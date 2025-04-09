<?php

namespace App\Chat\Functions;

use App\Models\Project;
use App\Mail\NewLeadMail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class UpdateProjectInfo extends ChatFunction
{
    static function run($threadId, $call)
    {

        
        $arguments = (array) json_decode($call['function']['arguments']);
        
        $name = $arguments['name'];
        $value = $arguments['value'];
        
        Log::debug("Function: updateProjectInfo, $name = $value");

        $expected = ['name'];

        $projectID =  Session::get('ClientChatProjectID');
        $project = Project::find($projectID);

        if ( in_array($name, $expected) )
        {
            $project->$name = $value;
        }
        
        if ( $project->requisitos == null ) $project->requisitos = "{}";

        $jsonData = json_decode($project->requisitos);
        $jsonData->$name = $value;
        $project->requisitos = json_encode($jsonData);

        // TODO fazer aquele port do traverse
    
        $project->save();

        return "The information was saved sucessfuly. Proceed on gathering more info";
    }
}
