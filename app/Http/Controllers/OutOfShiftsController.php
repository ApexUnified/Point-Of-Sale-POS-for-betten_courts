<?php

namespace App\Http\Controllers;

use App\Models\OutOfShift;
use Illuminate\Http\Request;

class OutOfShiftsController extends Controller
{
    

    public function index(){

        $outOfShiftsEmployees = OutOfShift::all();
        return view('backend.out_of_shifts.index',compact('outOfShiftsEmployees'));
    }
}
