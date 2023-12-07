<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $appends = ['briefing'];

    public function getBriefingAttribute()
    {
        $req = json_decode($this->requisitos);
        
        if ( $req == null || ! property_exists($req, 'briefing') )
        {
            return "Sem briefing definido";
        }

        return $req->briefing;
    }

}
