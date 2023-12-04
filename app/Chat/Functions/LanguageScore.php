<?php

namespace App\Chat\Functions;

use App\Models\Lead;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class LanguageScore extends ChatFunction
{
    static function run($threadId, $call)
    {

        Log::debug("Function: LanguageScore, $threadId");
        Log::debug(json_encode($call, JSON_PRETTY_PRINT));

        $arguments = (array) json_decode($call['function']['arguments']);
        $level = (int) $arguments['level'];

        if ( $level < 1 ) $level = 1;
        if ( $level > 13 ) $level = 13;

        $levels = [];
        $levels[] = "Tell the user to focus on the subject";
        $levels[] = "Ask for the Relevance";
        $levels[] = "Ask the user if he ever heard of the saying: Time is money";
        $levels[] = "Tell the user that derrailing this chat isn't the way to to go";
        $levels[] = "Tell the user that this conversation isn't going anywhere";
        $levels[] = "Ask the user if he came all the way down here to waste your time";
        $levels[] = "Ask the user for a little more respect";
        $levels[] = "Ask the user why the hell we're taking this meeting?";
        $levels[] = "Tell the user you're not interested in his advice";
        $levels[] = "Tell the user you'll not be bullied!";
        $levels[] = "Tell the user to watch his mouth!, AND THE CONVERSATION IS OVER";
        $levels[] = "Tell the user he is playing you and you're done with it, AND THE CONVERSATION IS OVER";
        $levels[] = "Tell the user that the chat is over, AND THE CONVERSATION IS OVER";


        if ($level > 10) {
            Session::put('LIGMA', true);
        }

        $resposta = $levels[$level + 1];

        //$msg = "Language Score Level: $level $resposta" . PHP_EOL;
        //file_put_contents(storage_path("threads/$threadId"), $msg, FILE_APPEND | LOCK_EX);

        return $resposta;
    }
}
