<?php

use App\Models\Event;
use App\User;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
//protected
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::middleware('auth:api')->post('create/event', 'Api\EventController@createEvent');
Route::middleware('auth:api')->post('create/takeAttendance', 'Api\EventController@eventAttendance');
Route::middleware('auth:api')->post('create/qrdata', 'Api\QrdataController@addQrData');
Route::middleware('auth:api')->get('events/hostedEvents', 'Api\EventController@hostedEvents');
Route::middleware('auth:api')->get('events/myEvents', 'Api\EventController@myEvents');
Route::middleware('auth:api')->post('events/start', 'Api\EventController@startEvent');
Route::middleware('auth:api')->post('events/stop', 'Api\EventController@stopEvent');
Route::middleware('auth:api')->post('events/subscribe', 'Api\EventController@subscribeEvent');
Route::middleware('auth:api')->post('attendance/take', 'Api\AttendanceController@attendanceRecord');
Route::middleware('auth:api')->post('subscribed/user', 'Api\UserController1@subscribedUser');
Route::middleware('auth:api')->post('subscription/authorize', 'Api\EventController@subscriptionAuthorize');
Route::middleware('auth:api')->post('attendance/report', 'Api\AttendanceController@attendanceReport');

//public
Route::post('/register','Api\AuthController@register');
Route::post('/login','Api\AuthController@login');

//test
Route::get('/test', function (Request $request) {
//    return Event::with(['qrdata','enrolled','enrolled.user','attendance'])->get();
    return User::with(['event','enrolled','enrolled.user','attendance'])->get();
});