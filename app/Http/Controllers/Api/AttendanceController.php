<?php

namespace App\Http\Controllers\Api;

use App\Models\Attendance;
use App\Models\Enrolled;
use App\Models\Event;
use App\Models\Qrdata;
use Carbon\Carbon;
use DateTimeZone;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AttendanceController extends Controller
{
    public function attendanceRecord(Request $request)
    {
        $data = $request->input('data_1');
        $qrdata = Qrdata::where('data_1', $data)->first();
        $date = Carbon::today(new DateTimeZone('Asia/Dhaka'));
        if ($qrdata) {
            $event = Event::where('id', $qrdata->event_id)->first();
            $enrolled = Enrolled::where('event_id', $event->id)->where('user_id', $request->user()->id)->first();
            if ($enrolled) {
                $attendance = $event->attendance->where('user_id', $request->user()->id)->where('datetime', substr($date, 0, 10))->first();
                if (!$attendance) {
                    $attendance = new Attendance();
                    $attendance->user_id = $request->user()->id;
                    $attendance->event_id = $event->id;
                    $attendance->datetime = $date;
                    $attendance->save();
                    return response(array('message' => 'success'), 200);
                } else {
                    return response(array('message' => 'fail', 'status' => 'Attendance Already Taken'), 200);
                }
            }
        } else {
            return response(array('message' => 'fail', 'status' => 'Invalid QR Code'), 200);
        }
    }

    public function attendanceReport(Request $request)
    {
        $eventId=$request->input("event_id");
        $userId=$request->input("user_id");
        $attendance=Attendance::where('event_id',$eventId)->where('user_id',$userId)->get();
        if($attendance){
            return response(array('message' => 'success', 'attendance' => $attendance), 200);
        }else return response(array('message' => 'fail', 'status' => 'No Attendance Data Found'), 200);
    }

}
