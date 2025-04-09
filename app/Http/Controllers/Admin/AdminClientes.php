<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Project;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class AdminClientes extends Controller
{
    function index(Request $r)
    {

        $this->authorize('browse_admin');

        $clientes = User::orderBy('id', 'desc')->get();

        return Inertia::render('Admin/Clientes', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'clientes' => $clientes
        ]);
    }

    function view($id)
    {

        $this->authorize('browse_admin');

        $cliente = User::find($id);

        $projetos = Project::where('user_id', $cliente->id)->get();

        return Inertia::render('Admin/Cliente', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'cliente' => $cliente,
            'projetos' => $projetos,
        ]);
    }

    function projeto($id, $pid)
    {

        $this->authorize('browse_admin');

        $projeto = Project::with('messages')->find($pid);
        $cliente = User::find($projeto->user_id);

        return Inertia::render('Admin/ClienteProjeto', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'cliente' => $cliente,
            'projeto' => $projeto,
        ]);

    }

}