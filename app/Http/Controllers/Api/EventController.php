<?php

namespace App\Http\Controllers\Api;

use App\Models\Attendance;
use App\Models\Enrolled;
use App\Models\Event;
use App\Models\Qrdata;
use App\User;
use Carbon\Carbon;
use DateTimeZone;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EventController extends Controller
{
    public function createEvent(Request $request)
    {

        $event = new Event();
        $event->title = $request->input('title');
        $event->code = $request->input('code');
        $event->description = $request->input('description');
        $event->status = "inactive";
        $event->user_id = $request->user()->id;
        $event->created_at = Carbon::now(new DateTimeZone('Asia/Dhaka'));
        $event->save();
        $qrdata = new Qrdata();
        $qrdata->event_id = $event->id;
        $qrdata->data_1 = "";
        $qrdata->data_2 = "";
        $qrdata->save();
        return response(array('message' => 'success'), 200);
    }

    public function subscribeEvent(Request $request)
    {
        $code = $request->input('code');
        $event = Event::where('code', $code)->first();
        $enrolled = Enrolled::where('event_id', $event->id)->where('user_id', $request->user()->id)->first();
        if ($enrolled) {
            return response(array('message' => 'fail', 'status' => 'Already Subscribed To This Event'), 200);
        }
        if ($event) {
            $enrolled = new Enrolled();
            $enrolled->user_id = $request->user()->id;
            $enrolled->event_id = $event->id;
            $enrolled->accepted = 'false';
            $enrolled->save();
            return response(array('message' => 'success', 'status' => 'Successfully Subscribed'), 200);
        } else {
            return response(array('message' => 'fail', 'status' => 'No event found for this subscription code'), 200);
        }
    }

    public function startEvent(Request $request)
    {
        $id = $request->input('event_id');
        $data_1 = $request->input('data_1');
        $data_2 = $request->input('data_2');
        $events = Event::where('id', $id)->where('user_id', $request->user()->id)->first();
        if ($events) {
            $events->status = "active";
            $events->save();
            $qrdata = Qrdata::where('event_id', $id)->first();
            if ($qrdata) {
                $qrdata->data_1 = $data_1;
                $qrdata->data_2 = $data_2;
                $qrdata->save();
            }
            return response(array('message' => 'success', 'status' => 'Successfully Started'), 200);
        } else {
            return response(array('message' => 'failed', 'status' => 'No Event To Start'), 200);
        }
    }

    public function stopEvent(Request $request)
    {
        $id = $request->input('event_id');
        $events = Event::where('id', $id)->where('user_id', $request->user()->id)->first();
        if ($events) {
            $events->status = "inactive";
            $events->save();
            $qrdata = Qrdata::where('event_id', $id)->first();
            if ($qrdata) {
                $qrdata->data_1 = "";
                $qrdata->data_2 = "";
                $qrdata->save();
            }
            return response(array('message' => 'success', 'status' => 'Successfully Stopped'), 200);
        } else {
            return response(array('message' => 'failed', 'status' => 'No Event To Stop'), 200);
        }
    }

    public function hostedEvents(Request $request)
    {
        $user_id = $request->user()->id;
        $events = Event::where('user_id', $user_id)->get();
        if ($events) {
            return response(array('message' => 'success', 'events' => $events));
        } else {
            return response(array('message' => 'fail'));
        }
    }

    public function eventAttendance(Request $request)
    {
        $event_id = $request->input('event_id');
        $data = $request->input('data');
        $date = Carbon::today(new DateTimeZone('Asia/Dhaka'));
        $event = Event::where('id', $event_id)->where('status', 'active')->first();
        if ($event) {
            $user = $event->enrolled->where('user_id', $request->user()->id)->where('accepted', 'true')->first();
            if ($user) {
                $qr = $event->qrdata->where('data_1', $data)->orWhere('data_2', $data)->first();
                if ($qr) {
                    $attendance = $event->attendance->where('user_id', $request->user()->id)->where('datetime', substr($date, 0, 10))->first();
                    if (!$attendance) {
                        $attendance = new Attendance();
                        $attendance->user_id = $request->user()->id;
                        $attendance->event_id = $event_id;
                        $attendance->datetime = $date;
                        $attendance->save();
                        return response(array('message' => 'success'), 200);
                    }
                }

            }
            return response(array('message' => 'fail'), 200);
        }
        return response(array('message' => 'fail'), 200);
    }

    public function subscriptionAuthorize(Request $request)
    {
        $statusNote = '';
        $eventId = $request->input('event_id');
        $subscriberId = $request->input('sud_user_id');
        $event = Event::where('id', $eventId)->where('user_id', $request->user()->id)->first();
        if ($event) {
            $enrolled = Enrolled::where('event_id', $eventId)->where('user_id', $subscriberId)->first();
            if ($enrolled) {
                if ($enrolled->accepted == 'true') {
                    $enrolled->accepted = 'false';
                    $statusNote = "Subscriber Successfully Removed From The Event. ";
                } else {
                    $enrolled->accepted = 'true';
                    $statusNote = "Subscriber Successfully Accepted In The Event. ";
                }
                $enrolled->save();
                return response(array('message' => 'success', 'status' => $statusNote), 200);
            } else return response(array('message' => 'fail', 'status' => 'Not A Valid Subscriber!.'), 200);
        } else {
            return response(array('message' => 'fail', 'status' => 'You Are Not Authorized To Do So.'), 200);
        }
    }
    public function myEvents(Request $request){

        $enrolled=Enrolled::with(['event'])->where('user_id',$request->user()->id)->get();

        if($enrolled){
            return response(array('message' => 'success', 'enrolled' => $enrolled), 200);
        }else{
            return response(array('message' => 'fail'), 200);
        }
    }
}
