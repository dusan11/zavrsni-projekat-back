<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Stock;
use DB;

class StockController extends Controller
{
    public function index() 
    {
        $data = Stock::with('product')->orderBy('id', 'DESC')->get();
        return $data;
    }

    public function show($id)
    {
        $data = Stock::with('product')->findOrFail($id);
        return $data;
    }

    public function store(Request $request)
    {
        $stock = Stock::insert([
            'amount' => $request->amount,
            'product_id' => $request->product,
            'created_at' =>  date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        
        $respData['status']=201;
        $respData['message']='Uspješno dodato.';
        $respData['stock']=$stock;

        return response()->json($respData);
    }

    public function update(Request $request, $id)
    {
        $stock = Stock::find($id);
        //$order->update($request->all());
      
        $stock->update([
            'amount' => $request->amount,
            'product_id' => $request->product,
            'total_price' => $request->total_price,
            'updated_at' => date('Y-m-d H:i:s'),
            ]);

        $respData['status']=204;
        $respData['message']='Uspješno ažurirano.';
        $respData['data']=$stock;

        return response()->json($respData);
    }

    public function destroy($id)
    {
        $stock = Stock::findOrFail($id);
        $stock->delete($id);

        $respData['status']=204;
        $respData['message']='Uspješno obrisano.';

        return response()->json($respData);
    }

    public function stockLevel()
    {
        $data = DB::table('stocks')->groupBy('product_id')->sum('amount');
        return $data;
    }

    public function stockLevelProduct($id)
    {
        $data = DB::table('stocks')->where('product_id', $id)->sum('amount');
        return $data;

    }
}
