<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ProductController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\OrderTypeController;
use App\Http\Controllers\OrderStatusController;

use App\Http\Controllers\OrderController;
use App\Http\Controllers\StockController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('proizvodi', ProductController::class);
Route::resource('kompanija', CompanyController::class);
Route::resource('vrsta-narudzbe', OrderTypeController::class);
Route::resource('status-narudzbe', OrderStatusController::class);

Route::get('narudzbe', [OrderController::class, 'index']);
Route::get('narudzbe/{id}', [OrderController::class, 'show']);
Route::post('narudzbe', [OrderController::class, 'store']);
Route::put('narudzbe/{id}', [OrderController::class, 'update']);
Route::put('narudzbe/{id}/cijena', [OrderController::class, 'updateTotalPrice']);
Route::delete('narudzbe/{id}', [OrderController::class, 'destroy']);
Route::post('narudzbe/{narudzba_id}/proizvodi/{proizvod_id}', [OrderController::class, 'addProduct']);
Route::delete('narudzbe/{narudzba_id}/proizvodi/{proizvod_id}', [OrderController::class, 'removeProduct']);

Route::get('lager', [StockController::class, 'index']);
Route::get('lager/{id}', [StockController::class, 'show']);
Route::post('lager', [StockController::class, 'store']);
Route::put('lager/{id}', [StockController::class, 'update']);
Route::delete('lager/{id}', [StockController::class, 'destroy']);
Route::get('lager/proizvodi', [StockController::class, 'stockLevel']);
Route::get('lager/proizvodi/{id}', [StockController::class, 'stockLevelProduct']);