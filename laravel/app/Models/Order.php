<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    public $table = 'orders';

    protected $fillable = [
        'date', 'total_price', 'order_type_id', 'company_id', 'order_status_id'

    ];

    public function orderType()
    {
        return $this->belongsTo(OrderType::class);
    }
    public function orderStatus()
    {
        return $this->belongsTo(OrderStatus::class);
    }
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function products()
    {
    return $this->belongsToMany(Product::class)->withPivot(['amount']);
    }
}
