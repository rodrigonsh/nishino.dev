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


class ClienteHome extends Controller
{
    function index(Request $r)
    {

        $user = Auth::user();
        $projetos = Project::where('user_id', $user->id)->orderBy('id', 'desc')->get();

        return Inertia::render('Cliente/Home', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'projetos' => $projetos
        ]);
    }

    function view($id)
    {

        $projeto = Project::with('messages')->find($id);

        return Inertia::render('Cliente/Projeto', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'projeto' => $projeto
        ]);
    }

    

}