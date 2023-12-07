<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Project;
use App\Models\Lead;
use App\Models\LeadHistory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class AdminHome extends Controller
{
    function index(Request $r)
    {

        $this->authorize('browse_admin');

        $leads = Lead::orderBy('id', 'desc')->where('resolvido', false)->get();

        return Inertia::render('Admin/Home', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'leads' => $leads
        ]);
    }

}