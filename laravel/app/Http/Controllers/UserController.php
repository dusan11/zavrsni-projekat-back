<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaction;

use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTExceptions;

class UserController extends Controller
{
    public function show($id)
    {
        $data = User::findOrFail($id);
        return $data;
    }

    public function register(Request $request) {

        $user = User::where('email', $request['email'])->first();

        if($user) {
            $response['status'] = 0;
            $response['message'] = 'Email postoji';
            $response['code'] = 409;
        } else {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password)
            ]);
            $response['status'] = 1;
            $response['message'] = 'Korisnik uspješno kreiran';
            $response['code'] = 200;
        }

        return response()->json($response);
    }

    public function updateName(Request $request, $id) {

        $user = User::findOrFail($id);

        if($user) {
            $user->name = $request->name;
            $user->save();
            $response['status'] = 1;
            $response['message'] = 'Korisničko ime uspješno ažurirano';
            $response['code'] = 200;
        }else{
            $response['status'] = 0;
            $response['message'] = 'Internal server error';
            $response['code'] = 500;
        }

       // $user->update(['name', $request->only('name')]);

       return response()->json($response);
    }

    public function updateEmail(Request $request, $id) {

        $user = User::findOrFail($id);
        $email = $request->email;
        $existingUser = User::where('email', $email)->first();

        if($existingUser){
            $response['status'] = 0;
            $response['message'] = 'Internal server error. Unable to process';
            $response['code'] = 500;
        }else{
            if($user) {
                $user->email = $request->email;
                $user->save();
                $response['status'] = 1;
                $response['message'] = 'Korisnički email uspješno ažuriran';
                $response['code'] = 200;
            }else{
                $response['status'] = 0;
                $response['message'] = 'Internal server error. Unable to process';
                $response['code'] = 500;
            }
        }

       // $user->update(['name', $request->only('name')]);

       return response()->json($response);
    }

    public function login(Request $request) {
        $credentials = $request->only('email', 'password');

        try {
            if(!JWTAuth::attempt($credentials)) {
                $response['status'] = 0;
                $response['data'] = null;
                $response['code'] = 401;
                $response['message'] = 'Email ili password je netačan';
                return response()->json($response);
            }
        } catch (JWTExceptions $e) {
            $response['data'] = null;
            $response['code'] = 500;
            $response['message'] = 'Could not create the token';
            return response()->json($response);
        }

        $user = auth()->user();
        $data['token'] = auth()->claims([
            'user_id' => $user->id,
            'email' => $user->email
        ])->attempt($credentials);

        $response['status'] = 1;
        $response['data'] = $data;
        $response['code'] = 200;
        $response['message'] = 'Logovanje uspješno';

        return response()->json($response);
    }
}
