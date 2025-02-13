<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\MoneyTransfer;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class MoneyTransferController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('money-transfer')){
            $lims_money_transfer_all = MoneyTransfer::get();
            $lims_account_list = Account::where('is_active', true)->get();
            return view('backend.money_transfer.index', compact('lims_money_transfer_all', 'lims_account_list'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $fromAccountId = $data['from_account_id'];
        $toAccountId = $data['to_account_id'];

        $fromAccount = Account::find($fromAccountId);
        $toAccount = Account::find($toAccountId);

        if($fromAccount->initial_balance < $data['amount']){
            Toastr()->error("Insufficient balance in the source account");
            return redirect()->back();
        }

        $fromAccount->initial_balance -= $data['amount'];
        $fromAccount->total_balance -= $data['amount'];
        $toAccount->total_balance += $data['amount'];
        $toAccount->initial_balance += $data['amount'];

        $fromAccount->save();
        $toAccount->save();

        // return "From Account: ". $fromAccount->initial_balance . ' ' . $toAccount->initial_balance  .  " Amount: " . $data['amount'];
        $data['reference_no'] = 'mtr-' . date("Ymd") . '-'. date("his");
        MoneyTransfer::create($data);
        return redirect()->back()->with('message', 'Money transfered successfully');
    }

    public function show(MoneyTransfer $moneyTransfer)
    {
        //
    }

    public function edit(MoneyTransfer $moneyTransfer)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        MoneyTransfer::find($data['id'])->update($data);
        return redirect()->back()->with('message', 'Money transfer updated successfully');
    }

    public function destroy($id)
    {
        MoneyTransfer::find($id)->delete();
        return redirect()->back()->with('not_permitted', 'Data deleted successfully');
    }


    public function MoneydeleteBySelection(Request $request)
    {
        $money_ids = $request['money_transferIdArray'];
        $deletedIds = [];
        $errors = [];
    
        foreach ($money_ids as $id) {
            $moneyTransfer = MoneyTransfer::find($id);
            if ($moneyTransfer) {
                $moneyTransfer->delete();
                $deletedIds[] = $id; // Collect deleted IDs
            } else {
                $errors[] = "Money Transfer ID $id not found"; // Collect errors
            }
        }
    
        if (count($deletedIds) > 0) {
            return 'Deleted successfully';
        } else {
            'No Money Transfers were deleted.';
        }
    }
    
}
