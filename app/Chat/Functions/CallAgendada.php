<?php

namespace App\Chat\Functions;

use App\Models\Lead;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class CallAgendada extends ChatFunction
{
    static function run($threadId, $call)
    {

        Log::debug("Function: CallAgendada, $threadId");
        Log::debug(json_encode($call, JSON_PRETTY_PRINT));

        
        $arguments = (array) json_decode($call['function']['arguments']);
        
        foreach($arguments as $k=>$v)
        {
            $call = [];
            $call['function'] = ['arguments'=>json_encode(['name'=>$k, 'value'=>$v])];

            UpdateLeadInfo::run($threadId, $call);
        }
        
        // mandar email
        
        $lead = Lead::where('thread_id', $threadId)->first();
        
        Mail::to("rodrigo.nsh@gmail.com")->send(new NewLeadMail($lead));
        
        //$msg = 'negocio fechado! ' . json_encode($fillData) . PHP_EOL;
        //file_put_contents(storage_path("threads/$threadId"), "SUCCESS: $msg", FILE_APPEND | LOCK_EX);
        
        $lang = Session::get('lang', 'en');
        $over = [
            'pt' => "OK! Tudo em ordem! Vou mandar estes dados pro Rodrigo Nishino e ele entrará em contato com você",
            'en' => "OK! Everything in order! I will send this data to Rodrigo Nishino and he will contact you",
            'es' => "¡DE ACUERDO! ¡Todo en orden! Le enviaré estes datos a Rodrigo Nishino y él se pondrá en contacto contigo."
        ];

        return $over[$lang];
    }
}
