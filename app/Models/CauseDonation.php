<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CauseDonation extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'cause_id',
        'price',
        'currency',
        'payment_id',
        'payment_method',
        'payment_status',
    ];
}
