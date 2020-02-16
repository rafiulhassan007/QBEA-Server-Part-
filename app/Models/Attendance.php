<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    protected $table = "attendance";
    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo('App\User');
    }

}
