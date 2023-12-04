<?php

namespace App\Chat\Functions;

use App\Models\Lead;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class NegocioFechado extends ChatFunction
{
    static function run($threadId, $call)
    {

        Log::debug("Function: NegocioFechado, $threadId");
        Log::debug(json_encode($call, JSON_PRETTY_PRINT));

        $lang = Session::get('lang', 'en');

        $arguments = (array) json_decode($call['function']['arguments']);

        $fillData['name']            = $arguments['name'] ?? 'Unknown';
        $fillData['body']            = $arguments['summary'] ?? 'Unknown';
        $fillData['origin']          = $arguments['company'] ?? 'Unknown';
        $fillData['address']         = $arguments['location'] ?? 'Unknown';
        $fillData['city']            = $arguments['location'] ?? 'Unknown';
        $fillData['orcamento']       = $arguments['budget'] ?? 'Unknown';
        $fillData['body']            = $arguments['briefing'] ?? 'Unknown';
        $fillData['proximo_contato'] = $arguments['next_meeting'] ?? 'Unknown';
        $fillData['cta']             = "Harvey Wood";

        // mandar email
        
        $lead = Lead::where('thread_id', $threadId)->first();
        $lead->fill($fillData);
        $lead->save();

        Mail::to("rodrigo.nsh@gmail.com")->send(new NewLeadMail($lead));

        //$msg = 'negocio fechado! ' . json_encode($fillData) . PHP_EOL;
        //file_put_contents(storage_path("threads/$threadId"), "SUCCESS: $msg", FILE_APPEND | LOCK_EX);

        $over = [
            'pt' => "OK! Tudo em ordem! Vou mandar estes dados pro Rodrigo Nishino e ele entrará em contato com você",
            'en' => "OK! Everything in order! I will send this data to Rodrigo Nishino and he will contact you",
            'es' => "¡DE ACUERDO! ¡Todo en orden! Le enviaré estes datos a Rodrigo Nishino y él se pondrá en contacto contigo."
        ];

        return $over[$lang];
    }
}
