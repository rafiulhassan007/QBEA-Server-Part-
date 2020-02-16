<?php

namespace App\Http\Controllers\Api;

use App\Models\Enrolled;
use App\Models\Event;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController1 extends Controller
{

    public function subscribedUser2(Request $request)
    {
        $eventId = $request->input('event_id');
        $event = Event::with(['enrolled', 'enrolled.user'])->where('id', $eventId)->where('user_id', $request->user()->id)->first();
        if ($event) {
            $enrolled = $event->enrolled;
            return response(array('users' => $enrolled));
        }
    }

    public function subscribedUser(Request $request)
    {
        $eventId = $request->input('event_id');
        $event=Event::where('id',$eventId)->where('user_id',$request->user()->id)->first();
        if(!$event){
            return response(array('message'=>'fail'), 200);
        }
        //$enrolled = Enrolled::with(['user', 'user'])->where('accepted', 'true')->where('event_id', $eventId)->get();
        $enrolled = Enrolled::with(['user', 'user'])->where('event_id', $eventId)->get();
        if ($enrolled) {
            return response(array('message'=>'success','enrolled' => $enrolled), 200);
        } else return response(array('message'=>'fail'), 200);
    }
}
