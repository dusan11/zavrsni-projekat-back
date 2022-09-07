<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;

class OrderController extends Controller
{
    public function index() 
    {
        $data = Order::with('orderType', 'orderStatus', 'company', 'products')->orderBy('id', 'DESC')->get();
        return $data;
    }

    public function show($id)
    {
        $data = Order::with('orderType', 'orderStatus', 'company', 'products')->findOrFail($id);
        return $data;
    }

    public function store(Request $request)
    {
        $order = Order::insert([
            'date' => $request->date,
            'order_type_id' => $request->orderType,
            'company_id' => $request->company,
            'order_status_id' => $request->orderStatus,
            'total_price' => $request->totalPrice,
            'created_at' =>  date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        
        $respData['status']=201;
        $respData['message']='Uspješno kreirano.';
        $respData['order']=$order;

        return response()->json($respData);
    }

    public function update(Request $request, $id)
    {
        $order = Order::find($id);
      
        $order->update([
            'date' => $request->date,
            'order_type_id' => $request->orderTypeId,
            'company_id' => $request->companyId,
            'order_status_id' => $request->orderStatusId,
            'total_price' => $request->total_price,
            'updated_at' => date('Y-m-d H:i:s'),
            ]);

        $respData['status']=204;
        $respData['message']='Uspješno ažurirano.';
        $respData['data']=$order;

        return response()->json($respData);
    }

    public function updateTotalPrice(Request $request, $id)
    {
        $order = Order::find($id);
      
        $order->update([
            'total_price' => $request->total_price,
            'updated_at' => date('Y-m-d H:i:s'),
            ]);

        $respData['status']=204;
        $respData['message']='Ukupna cijena uspješno ažurirana.';
        $respData['data']=$order;

        return response()->json($respData);
    }

    public function destroy($id)
    {
        $order = Order::findOrFail($id);
        $order->delete($id);
       
        $respData['status']=204;
        $respData['message']='Uspješno obrisano.';
       
        return response()->json($respData);
    }

    public function removeProduct($order_id, $product_id)
    {
        $order = Order::find($order_id);
        $order->products()->detach($product_id);
        
        $respData['status']=200;
        $respData['message']='Proizvod uspješno uklonjen.';
        
        return response()->json($respData);
    }

    public function addProduct(Request $request, $order_id, $product_id)
    {
        $order = Order::find($order_id);
        $order->products()->attach($product_id, ['amount' => $request->input('amount')]);
        
        $respData['status']=200;
        $respData['message']='Proizvod uspješno dodat.';
        
        return response()->json($respData);
    }
}
