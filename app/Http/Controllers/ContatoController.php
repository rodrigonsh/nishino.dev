<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Models\Lead;

class ContatoController extends Controller
{
    public function enviar(Request $r)
    {
        $lead = new Lead();
        $lead->fill($r->all());
        $lead->save();
    }
}
