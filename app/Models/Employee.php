<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $fillable =[
        'id',"name", "image", "department_id",'device_id', "email", "phone_number",
        "user_id", "staff_id", "address", "city", "country", "is_active","shift","shift_days"
    ];

    public function payroll()
    {
    	return $this->hasMany('App\Models\Payroll');
    }


    public function hrmSetting(){
        return $this->belongsTo(HrmSetting::class,'shift','id' );
    }


    protected $casts = [
        'shift' => 'string', // Assuming shift_ids is a string for storing comma-separated values
    ];

    // Method to get all shifts associated with the employee
    public function getShifts()
    {
        $shift = explode(',', $this->shift); // Convert comma-separated string to array
        return HrmSetting::whereIn('id', $shift)->get(); // Fetch shifts by IDs
    }

}
