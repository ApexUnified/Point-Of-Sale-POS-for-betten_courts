<?php

namespace App\Models;

use App\Models\Employee;
use Illuminate\Database\Eloquent\Model;

class HrmSetting extends Model
{
    protected $fillable =[
       "shift", "checkin", "checkout",'beginning_in','ending_out'
    ];


    public function employees(){
        return $this->hasMany(Employee::class,'shift','id');
    }
}
