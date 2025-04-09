<?php

namespace App\Http\Controllers\Cliente;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Project;
use App\Models\Lead;
use App\Models\LeadHistory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class ClienteProjetos extends Controller
{
    function index(Request $r)
    {

        return Inertia::render('Cliente/Projetos', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
        ]);
    }
    
    function get()
    {
        $user = Auth::user();
        $projetos = Project::where('user_id', $user->id)->get();

        $ret = [];

        foreach( $projetos as $p )
        {
            $ret[] = [ 'title'=>$p->nome, 'value'=>$p->id];
        }

        return json_encode($ret);
    }

}