<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Models\Lead;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Mail;


class ContatoController extends Controller
{
    public function enviar(Request $r)
    {
        $lead = new Lead();
        $lead->fill($r->all());
        $lead->save();

        Mail::to("rodrigo.nsh@gmail.com")->send(new NewLeadMail($lead)); 

    }
}
