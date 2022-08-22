<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\OrderType;

class OrderTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = OrderType::all();
        return $data;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //$data = OrderType::create($request->all());
        $success = OrderType::insert([
            'type' => $request->type,
        ]);

        $respData['status']=201;
        $respData['message']='Uspješno kreirano.';
        $respData['success']=$success;
        
        return response()->json($respData);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = OrderType::findOrFail($id);
        return $data;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $orderType = OrderType::find($id);
        $orderType->update($request->all());
       
        $respData['status']=204;
        $respData['message']='Uspješno ažurirano.';
        $respData['data']=$orderType;
       
        return response()->json($respData);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $orderType = OrderType::findOrFail($id);
        $orderType->delete($id);
        
        $respData['status']=204;
        $respData['message']='Uspješno obrisano.';
       
        return response()->json($respData);
    }
}
