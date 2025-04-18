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


class AdminLeads extends Controller
{
    function index(Request $r)
    {

        $this->authorize('browse_admin');

        $leads = Lead::orderBy('id', 'desc')->where('resolvido', false)->get();

        return Inertia::render('Admin/Leads', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'leads' => $leads
        ]);
    }

    function view($id)
    {

        $this->authorize('browse_admin');

        $lead = Lead::with('messages')->find($id);

        return Inertia::render('Admin/Lead', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'lead' => $lead
        ]);
    }

    function converter($id)
    {

        $this->authorize('browse_admin');
    
        $lead = Lead::findOrFail($id);
        $lead->resolvido = true;
        
        // Procurar cliente com mesmo email
        $user = User::where('email', $lead->email)->firstOrFail();
        if ( $user == null )
        {
            $user = new User();
            $user->name = $lead->name;
            $user->email = $lead->email;
            $user->password = Hash::make(uniqid());
            $user->map = "{}";
            $user->save();
        }
        
        $projeto = new Project();
        $projeto->user_id = $user->id;
        $projeto->lead_id = $lead->id;
        $projeto->nome = $lead->name;
        $projeto->slug = Str::slug($lead->name);
        $projeto->descricao_pt =  "";
        $projeto->descricao_en =  "";
        $projeto->descricao_es =  "";
        $projeto->estoria_pt = "";
        $projeto->estoria_en = "";
        $projeto->estoria_es = "";
        $projeto->cliente = $user->name;
        $projeto->data = date('Y');
        $projeto->cover = "";
        $projeto->chips = "proposta";
        $projeto->galeria = "";
        $projeto->requisitos = $lead->body;
        $projeto->save();
        
        $lead->save();
        /*return Inertia::render('Admin/Leads', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'leads' => $leads
        ]);*/
    }

    function descartar($id)
    {

        $this->authorize('browse_admin');

        $lead = Lead::findOrFail($id);
        $lead->delete();
        
        /*return Inertia::render('Admin/Lead', [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
            'lead' => $lead
        ]);*/
    }

}