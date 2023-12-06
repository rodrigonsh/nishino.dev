<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lead extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'name', 'email', 'whatsapp',
        'address', 'orcamento', 
        'body', 'origin'
    ];

    protected $appends = ['date_diff'];

    public function getDateDiffAttribute()
    {
        return $this->created_at->diffForHumans();
    }

    public function messages()
    {
        return $this->hasMany(LeadHistory::class, 'lead_id');
    }

}
