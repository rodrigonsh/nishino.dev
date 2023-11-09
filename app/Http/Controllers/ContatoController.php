<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Models\Lead;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Mail;
use Inertia\Inertia;

class ContatoController extends Controller
{
    public function enviar(Request $r)
    {
        $lead = new Lead();
        $lead->fill($r->all());
        $lead->save();

        try
        {
            Mail::to("rodrigo.nsh@gmail.com")->send(new NewLeadMail($lead)); 
        }

        catch(\Exception $e)
        {
            return Inertia::render('Error', [
                'error_message' => 'Ocorreu um erro ao enviar o e-mail. Por favor, tente novamente mais tarde.',
            ])->toResponse(request());
        }

    }
}
