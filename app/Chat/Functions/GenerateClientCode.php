<?php

namespace App\Chat\Functions;

use App\Mail\sendMoreDataMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class GenerateClientCode extends ChatFunction
{
    static function run($threadId, $call)
    {

        $lang = Session::get('lang', 'en');
        $fillData = (array) json_decode($call['function']['arguments']);

        $code = uniqid();

        Log::debug("GENERATECLIENTCODE: $code", $fillData);

        $over = [
            'pt' => "Envie este código para o usuário: $code",
            'en' => "Send this code to the user: $code",
            'es' => "Envía este código al usuario: $code."
        ];

        return $over[$lang];
    }
}
