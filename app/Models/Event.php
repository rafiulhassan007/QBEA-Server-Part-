<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $table = "event";
    public $timestamps = false;

    public function qrdata()
    {
        return $this->hasOne('App\Models\Qrdata');
    }

    public function enrolled()
    {
        return $this->hasMany('App\Models\Enrolled');
    }

    public function attendance()
    {
        return $this->hasMany('App\Models\Attendance');
    }
}
