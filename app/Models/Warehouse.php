<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Warehouse extends Model
{
    protected $fillable =[

        "name", "phone", "email", "address", "is_active",'image','print_kitchen','slip_description'
    ];

    public function product()
    {
    	return $this->hasMany('App\Models\Product');

    }
}
