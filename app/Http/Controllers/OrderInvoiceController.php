<?php

namespace App\Http\Controllers;

use App\Models\Biller;
use App\Models\Customer;
use App\Models\CustomField;
use App\Models\GeneralSetting;
use App\Models\Payment;
use App\Models\PosSetting;
use App\Models\Product_Sale;
use App\Models\Sale;
use App\Models\Warehouse;
use DB;
use NumberToWords\NumberToWords;
use Salla\ZATCA\GenerateQrCode;
use Salla\ZATCA\Tags\InvoiceDate;
use Salla\ZATCA\Tags\InvoiceTaxAmount;
use Salla\ZATCA\Tags\InvoiceTotalAmount;
use Salla\ZATCA\Tags\Seller;
use Salla\ZATCA\Tags\TaxNumber;

class OrderInvoiceController extends Controller
{
    public function Invoice($id){
        $lims_sale_data = Sale::find($id);
          $warehouse = Warehouse::find($lims_sale_data->warehouse_id);
        $general_setting = GeneralSetting::first();
        $lims_product_sale_data = Product_Sale::where('sale_id', $id)->get();
        if(cache()->has('biller_list'))
        {
            $lims_biller_data = cache()->get('biller_list')->find($lims_sale_data->biller_id);
        }
        else{
            $lims_biller_data = Biller::find($lims_sale_data->biller_id);
        }
        if(cache()->has('warehouse_list'))
        {
            $lims_warehouse_data = cache()->get('warehouse_list')->find($lims_sale_data->warehouse_id);
        }
        else{
            $lims_warehouse_data = Warehouse::find($lims_sale_data->warehouse_id);
        }

        if(cache()->has('customer_list'))
        {
            $lims_customer_data = cache()->get('customer_list')->find($lims_sale_data->customer_id);
        }
        else{
            $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        }

        $lims_payment_data = Payment::where('sale_id', $id)->get();
        if(cache()->has('pos_setting'))
        {
            $lims_pos_setting_data = cache()->get('pos_setting');
        }
        else{
            $lims_pos_setting_data = PosSetting::select('invoice_option')->latest()->first();
        }

        $supportedIdentifiers = [
            'al', 'fr_BE', 'pt_BR', 'bg', 'cs', 'dk', 'nl', 'et', 'ka', 'de', 'fr', 'hu', 'id', 'it', 'lt', 'lv',
            'ms', 'fa', 'pl', 'ro', 'sk', 'es', 'ru', 'sv', 'tr', 'tk', 'ua', 'yo'
        ]; //ar, az, ku, mk - not supported

        $defaultLocale = \App::getLocale();
        $numberToWords = new NumberToWords();

        if(in_array($defaultLocale, $supportedIdentifiers))
            $numberTransformer = $numberToWords->getNumberTransformer($defaultLocale);
        else
            $numberTransformer = $numberToWords->getNumberTransformer('en');


        if(config('is_zatca')) {
            //generating base64 TLV format qrtext for qrcode
            $qrText = GenerateQrCode::fromArray([
                new Seller(config('company_name')), // seller name
                new TaxNumber(config('vat_registration_number')), // seller tax number
                new InvoiceDate($lims_sale_data->created_at->toDateString()."T".$lims_sale_data->created_at->toTimeString()), // invoice date as Zulu ISO8601 @see https://en.wikipedia.org/wiki/ISO_8601
                new InvoiceTotalAmount(number_format((float)$lims_sale_data->grand_total, 4, '.', '')), // invoice total amount
                new InvoiceTaxAmount(number_format((float)($lims_sale_data->total_tax+$lims_sale_data->order_tax), 4, '.', '')) // invoice tax amount
                // TODO :: Support others tags
            ])->toBase64();
        }
        else {
            $qrText = $lims_sale_data->reference_no;
        }
        if(is_null($lims_sale_data->exchange_rate))
        {
            $numberInWords = $numberTransformer->toWords($lims_sale_data->grand_total);
            $currency_code = cache()->get('currency')->code;
        } else {
            $numberInWords = $numberTransformer->toWords($lims_sale_data->grand_total);
            $sale_currency = DB::table('currencies')->select('code')->where('id',$lims_sale_data->currency_id)->first();
            $currency_code = $sale_currency->code;
        }
        $paying_methods = Payment::where('sale_id', $id)->pluck('paying_method')->toArray();
        $paid_by_info = '';
        foreach ($paying_methods as $key => $paying_method) {
            if($key)
                $paid_by_info .= ', '.$paying_method;
            else
                $paid_by_info = $paying_method;
        }
        $sale_custom_fields = CustomField::where([
                                ['belongs_to', 'sale'],
                                ['is_invoice', true]
                            ])->pluck('name');
        $customer_custom_fields = CustomField::where([
                                ['belongs_to', 'customer'],
                                ['is_invoice', true]
                            ])->pluck('name');
        $product_custom_fields = CustomField::where([
                                ['belongs_to', 'product'],
                                ['is_invoice', true]
                            ])->pluck('name');
        $returned_amount = DB::table('sales')
                                    ->join('returns', 'sales.id', '=', 'returns.sale_id')
                                    ->where([
                                        ['sales.customer_id', $lims_customer_data->id],
                                        ['sales.payment_status', '!=', 4]
                                    ])
                                    ->sum('returns.grand_total');
        $saleData = DB::table('sales')->where([
                        ['customer_id', $lims_customer_data->id],
                        ['payment_status', '!=', 4]
                    ])
                    ->selectRaw('SUM(grand_total) as grand_total,SUM(paid_amount) as paid_amount')
                    ->first();
        $totalDue = $saleData->grand_total - $returned_amount - $saleData->paid_amount;
        if($lims_pos_setting_data->invoice_option == 'A4') {
            return view('backend.order-invoice.order_invoice', compact('lims_sale_data','warehouse','general_setting', 'currency_code', 'lims_product_sale_data', 'lims_biller_data', 'lims_warehouse_data', 'lims_customer_data', 'lims_payment_data', 'numberInWords', 'paid_by_info', 'sale_custom_fields', 'customer_custom_fields', 'product_custom_fields', 'qrText', 'totalDue'));
        }
        elseif($lims_sale_data->sale_type == 'online'){
            return view('backend.order-invoice.order_invoice', compact('lims_sale_data','warehouse','general_setting', 'currency_code', 'lims_product_sale_data', 'lims_biller_data', 'lims_warehouse_data', 'lims_customer_data', 'lims_payment_data', 'numberInWords', 'paid_by_info', 'sale_custom_fields', 'customer_custom_fields', 'product_custom_fields', 'qrText', 'totalDue'));
        }
        else{
            return view('backend.order-invoice.order_invoice', compact('lims_sale_data','warehouse','general_setting', 'currency_code', 'lims_product_sale_data', 'lims_biller_data', 'lims_warehouse_data', 'lims_customer_data', 'lims_payment_data', 'numberInWords', 'sale_custom_fields', 'customer_custom_fields', 'product_custom_fields', 'qrText', 'totalDue'));
        }
    }
}
