<?php

namespace App\Http\Controllers\Cliente;

use App\Models\Project;
use App\Models\ProjectHistory;
use Illuminate\Support\Facades\Auth;

class ClienteChat extends \App\Http\Controllers\GenericChatController
{

    public $indexView = 'Cliente/Harvey';
    public $assistantId = 'trocar por outro';
    public $threadSessionName = 'clientThreadId';

    public $threadTracker = null;

    public function setThreadTracker($threadId)
    {
        $user = Auth::user();

        // descobrir como pegar o projeto
        $project = Project::find(12);

        $this->threadTracker = $project;
        

    }

    public function addtoHistory($mensagem)
    {
        $history = new ProjectHistory;
        $history->project_id = $this->threadTracker->id;
        $history->text = $mensagem;
        $history->save();
    }

    

}
