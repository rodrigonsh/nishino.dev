<?php

namespace App\Http\Controllers\Cliente;

use App\Models\Project;
use App\Models\ProjectHistory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;

class ClienteChat extends \App\Http\Controllers\GenericChatController
{

    public $indexView = 'Cliente/Atendimento';
    public $assistantId = null;
    public $threadSessionName = 'clientThreadId';
    public $threadTracker = null;

    public function setAssistant()
    {
        $this->assistantId = env("CHAT_ARIA");
    }

    public function setThreadTracker($threadId)
    {
        $user = Auth::user();


        $projectID =  Session::get('ClientChatProjectID');
        if ( $projectID == null)
        {
            $project = Project::where('user_id', $user->id)->orderBy('id', 'desc')->first();
            $projectID = $project->id;
            Session::put('ClientChatProjectID', $projectID);
        }

        $project = Project::find($projectID);

        $this->threadTracker = $project;
        

    }

    public function prependFirstMessage($message)
    {

        $projectID =  Session::get('ClientChatProjectID');
        $project = Project::find($projectID);      

        $ret = $project->toArray();
        $ret['requisitos'] = json_decode($project->requisitos);

        $user = Auth::user();

        $parts = [];
        $parts[] = json_encode($ret);
        $parts[] = ". O nome do cliente é {$user->name}";
        $parts[] = ". Responda perguntas sobre o projeto. ";
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

        Session::put('ClientChatProjectID', $id);
        Session::put('threadSessionName', null);

        // TODO: traduzir
        return "Agora estamos falando sobre o projeto ".$project->nome;

    }
    

}
