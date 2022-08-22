<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaction;

class TransactionController extends Controller
{
    public function index() 
    {
        $data = Transaction::with('company')->orderBy('id', 'DESC')->get();
        return $data;
    }

    public function show($id)
    {
        $data = Transaction::with('company')->findOrFail($id);
        return $data;
    }

    public function store(Request $request)
    {
        $transaction = Transaction::insert([
            'date' => $request->date,
            'amount' => $request->amount,
            'company_id' => $request->company,
            'order_id' => $request->order,
            'created_at' =>  date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        
        $respData['status']=201;
        $respData['message']='Uspješno dodato.';
        $respData['order']=$transaction;

        return response()->json($respData);
    }

    public function update(Request $request, $id)
    {
        $transaction = Transaction::find($id);
        //$order->update($request->all());
      
        $transaction->update([
            'date' => $request->date,
            'amount' => $request->amount,
            'company_id' => $request->company,
            'order_id' => $request->order,
            'updated_at' => date('Y-m-d H:i:s'),
            ]);

        $respData['status']=204;
        $respData['message']='Uspješno ažurirano.';
        $respData['data']=$transaction;

        return response()->json($respData);
    }

    public function destroy($id)
    {
        $transaction = Transaction::findOrFail($id);
        $transaction->delete($id);

        $respData['status']=204;
        $respData['message']='Uspješno obrisano.';
        
        return response()->json($respData);
    }

    public function financialCard($companyId)
    {
        $data = Transaction::with('company')->where('company_id', $companyId)->orderBy('date', 'DESC')->get();
        return $data;
    }

    public function orderTransactions($orderId)
    {
        $data = Transaction::with('company')->where('order_id', $orderId)->orderBy('date', 'DESC')->get();
        return $data;
    }
}
