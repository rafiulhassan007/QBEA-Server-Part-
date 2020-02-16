<?php

namespace App\Http\Controllers\Api;

use App\Models\Event;
use App\Models\Qrdata;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class QrdataController extends Controller
{
    public function addQrData(Request $request)
    {
        $qrdata = new Qrdata();
        $event_id = $request->input('event_id');
        $events = Event::where('id', $event_id)->where('user_id', $request->user()->id)->first();
        if ($events) {
            $qrdata->event_id = $event_id;
            $qrdata->data_1 = $request->input('data_1');
            $qrdata->data_2 = $request->input('data_2');
            $qrdata->save();
            return response(array('message' => 'success', 'status' => 'Successfully Started'), 200);
        } else {
            return response(array('message' => 'failed', 'status' => 'No Event Found'), 200);
        }
    }
}
