<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\GenericChatController;
use App\Models\Project;
use App\Models\ProjectHistory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;

class AdminDonna extends GenericChatController
{

    public $indexView = 'Admin/Donna';
    public $assistantId = null;
    public $threadSessionName = 'donnaThreadId';
    public $threadTracker = null;

    public function setAssistant()
    {
        $this->assistantId = env("CHAT_DONNA");
    }

    public function setThreadTracker($threadId)
    {
        $projectID =  Session::get('DonnaChatProjectID');
        if ( $projectID == null)
        {
            $project = Project::orderBy('id', 'desc')->first();
            $projectID = $project->id;
            Session::put('DonnaChatProjectID', $projectID);
        }

        $project = Project::find($projectID);

        $this->threadTracker = $project;
        

    }

    public function prependFirstMessage($message)
    {

        $projectID =  Session::get('DonnaChatProjectID');
        $project = Project::find($projectID);      
        $user = $project->user;

        $ret = $project->toArray();
        $ret['requisitos'] = json_decode($project->requisitos);

        $userData = $user->toArray();
        $userData['map'] = json_decode($user->map);

        $parts = [];
        $parts[] = "O projeto é: ".json_encode($ret);
        $parts[] = ". O cliente é: ".json_encode($userData);
        $parts[] = ". A mensagem inicial é: ";
        $parts[] = $message;

        $firstMessage = implode("", $parts);
        Log::debug($firstMessage);

        return $firstMessage;
    }


    public function addtoHistory($mensagem)
    {
        $history = new ProjectHistory;
        $history->project_id = $this->threadTracker->id;
        $history->text = $mensagem;
        $history->save();
    }

    public function setSubject($id)
    {
        $user = Auth::user();
        if ( $user == null ) return abort(401);

        $project = Project::find($id);

        // Malandrachion detected!
        if ( $project->user_id != $user->id ) return abort(403);

        Session::put('DonnaChatProjectID', $id);
        Session::put('threadSessionName', null);

        // TODO: traduzir
        return "Agora estamos falando sobre o projeto ".$project->nome;

    }

    function getProjetos()
    {
        $projetos = Project::orderBy('id', 'desc')->get();

        $ret = [];

        foreach( $projetos as $p )
        {
            $ret[] = [ 'title'=>$p->nome, 'value'=>$p->id];
        }

        return json_encode($ret);
    }

}
