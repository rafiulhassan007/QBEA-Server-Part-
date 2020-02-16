<?php

namespace App\Http\Controllers\Api;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AuthController extends Controller
{
   public function register(Request $request){

       $validatedData = $request->validate([
          'name'=>'required|max:55',
          'email'=>'email|required|unique:users',
          'password'=>'required|confirmed'
       ]);

       $validatedData['password']= bcrypt($request->password);

       $user = User::create($validatedData);

       $accessToken = $user->createToken('authToken')->accessToken;

       return response(['message'=>'success','user'=>$user,'access_token'=>$accessToken]);
   }

   public function login(Request $request){
       $loginData=$request->validate([
           'email'=>'email|required',
           'password'=>'required'
       ]);

       if(!auth()->attempt($loginData)){
           return(['message'=>'Invalid Credential']);
       }

       $accessToken = auth()->user()->createToken('authToken')->accessToken;
       return response(['message'=>'success','user'=>auth()->user(),'access_token'=>$accessToken]);

   }
}
