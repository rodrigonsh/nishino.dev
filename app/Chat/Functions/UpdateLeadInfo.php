<?php

namespace App\Chat\Functions;

use App\Models\Lead;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class UpdateLeadInfo extends ChatFunction
{
    static function run($threadId, $call)
    {

        
        $arguments = (array) json_decode($call['function']['arguments']);
        
        $name = $arguments['name'];
        $value = $arguments['value'];
        
        Log::debug("Function: updateLeadInfo, $name = $value");

        $expected = ['name', 'whatsapp', 'origin', 'email', 'orcamento', 'proximo_contato', 'address'];

        $lead = Lead::where('thread_id', $threadId)->first();

        if ( in_array($name, $expected) )
        {
            $lead->$name = $value;
        }
        else
        {
            if ( $lead->body == null ) $lead->body = "{}";

            $jsonData = json_decode($lead->body);
            $jsonData->$name = $value;
            $lead->body = json_encode($jsonData);

            // TODO fazer aquele port do traverse
        }
        
        $lead->save();

        return "Tell the user that the information was saved sucessfuly and proceed on gathering more info";
    }
}
