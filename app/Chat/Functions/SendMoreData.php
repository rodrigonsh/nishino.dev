<?php

namespace App\Chat\Functions;

use App\Mail\sendMoreDataMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class SendMoreData extends ChatFunction
{
    static function run($threadId, $call)
    {

        $lang = Session::get('lang', 'en');
        $fillData = (array) json_decode($call['function']['arguments']);

        // mandar email
        //$msg = 'send_more_data: ' . json_encode($fillData) . PHP_EOL;
        //file_put_contents(storage_path("threads/$threadId"), $msg, FILE_APPEND | LOCK_EX);

        Mail::to("rodrigo.nsh@gmail.com")->send(new sendMoreDataMail($fillData));

        $callOUTPUT = true;

        $over = [
            'pt' => "OK {name}! Tudo em ordem! Os novos dados foram enviados",
            'en' => "OK {name}! Everything in order! The new data has been sent",
            'es' => "¡Bien, {name}! ¡Todo en orden! Los nuevos datos han sido enviados."
        ];

        $outputs[] = $over[$lang];

        return $over[$lang];
    }
}
