<?php

namespace App\Chat\Functions;

use App\Models\Project;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class UpdateClientInfo extends ChatFunction
{
    static function run($threadId, $call)
    {

        
        $arguments = (array) json_decode($call['function']['arguments']);
        
        $name = $arguments['name'];
        $value = $arguments['value'];
        
        Log::debug("Function: updateClientInfo, $name = $value");

        $projectID =  Session::get('ClientChatProjectID');
        $project = Project::find($projectID);
        $user = $project->user;

        if ( $user->map == null ) $user->map = "{}";

        $jsonData = json_decode($user->map);
        $jsonData->$name = $value;
        $user->map = json_encode($jsonData);

        // TODO fazer aquele port do traverse
    
        $user->save();

        return "Proceed on gathering more info";
    }
}
