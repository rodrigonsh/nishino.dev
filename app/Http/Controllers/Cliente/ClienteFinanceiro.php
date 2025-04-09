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


class ClienteFinanceiro extends Controller
{
    function index(Request $r)
    {

        return Inertia::render('Cliente/Financeiro', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
        ]);
    }
    

}