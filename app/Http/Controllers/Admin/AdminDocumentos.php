<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Project;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class AdminDocumentos extends Controller
{
    function index(Request $r)
    {

        $this->authorize('browse_admin');

        return Inertia::render('Admin/Documentos', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token()
        ]);
    }

}