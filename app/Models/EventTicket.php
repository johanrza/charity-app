<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventTicket extends Model
{
    use HasFactory;

    protected $fillable = [
        'event_id',
        'user_id',
        'unit_price',
        'number_of_tickets',
        'total_price',
        'currency',
        'payment_id',
        'payment_method',
        'payment_status',
    ];
}
