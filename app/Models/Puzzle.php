<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Puzzle extends Model
{

    protected $table = 'tbl_puzzle';

    const CREATED_AT = 'd_added';
    const UPDATED_AT = 'd_modified';

    protected $fillable = [
        'l_display',
        'l_solution',
        'i_status', // 0 -> Active ; 1 - Inactive
        'd_added',
        'd_modified',
    ];

}
