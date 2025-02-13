<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Product_Warehouse;
use App\Models\Warehouse;
use Illuminate\Http\Request;

class StockTransferController extends Controller
{
    public function index(string $id){

        $warehouse_products = Product_Warehouse::where('warehouse_id',$id)->get();
        if($warehouse_products->isEmpty()){
                Toastr()->error("This Branch is Empty Please Add Any Product To This Branch");
        }
        return view("backend.stock_transfer.index",compact("warehouse_products","id"));
    }

    public function stock_transfer(string $from_warehouse_id ,$to_warehouse_id, string $product_ids){

        // return [
        //     'from_warehouse_id' => $from_warehouse_id,
        //     'to_warehouse_id' => $to_warehouse_id,
        //     'product_ids' => explode(",", $product_ids)
        // ];

        // $warehouse_products = Product_Warehouse::whereIn("product_id",explode(',',$product_ids))->get();

        $products = Product::whereIn("id",explode(',',$product_ids))->get();

        return view("backend.stock_transfer.transfer",compact("from_warehouse_id","to_warehouse_id","products"));
    }


    public function stock_transfer_towarehouse(Request $request){
        // return $request->all();
       


        $qtys = $request->qty;
        $to_warehouse = $request->to_warehouse;
        $from_warehouse = $request->from_warehouse;

        $from_warehouse_data = Warehouse::find($from_warehouse);
        $to_warehouse_data = Warehouse::find($to_warehouse);

        $products = [];
        foreach($qtys as $product_id => $product_qty){

            $product = Product::find($product_id);
            if($product->qty < 1){
                Toastr()->error("Product '{$product->name}' Stock Transfer Quantity is Zero Please Select Quantity Greater Than Zero");
                return redirect()->back();
            }


            if($product->qty < $product_qty){
                Toastr()->error("Product '{$product->name}' Stock Transfer Quantity is Greater Than The Actual Quantity Please Select Quantity between The Actual Quantity");
            return redirect()->back();
           }

           $product_exists_in_warehouse = Product_Warehouse::where("warehouse_id",$to_warehouse)->where("product_id",$product_id)->first();
        //    return $product_exists_in_warehouse;
           if($product_exists_in_warehouse){
            $product_exists_in_warehouse->update([
                'product_id' => $product_id,
                'warehouse_id' => $to_warehouse,
                'qty' => $product_qty + $product_exists_in_warehouse->qty,
            ]);
           }else{
                 Product_Warehouse::create([
                     'product_id' => $product_id,
                'warehouse_id' => $to_warehouse,
                'qty' => $product_qty,
            ]);
        }
        
            $from_warehouse_minus_qty = Product_Warehouse::where("product_id",$product_id)->where("warehouse_id",$from_warehouse)->first();
            $from_warehouse_minus_qty->qty -= $product_qty;
            $from_warehouse_minus_qty->save();

        }   

        Toastr()->success("Stock Transfered Succesfully From {$from_warehouse_data->name} . To {$to_warehouse_data->name}");
        return redirect()->route("warehouse.index");
        // return $products;


    }
}
