<?php

namespace App\Http\Controllers;

use App\Chat\ChatSubmitToolOptions;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use OpenAI\Laravel\Facades\OpenAI;
use App\Models\Lead;
use App\Models\LeadHistory;

use App\Mail\NewThreadMail;
use Illuminate\Support\Facades\Mail;

class ChatController extends GenericChatController
{

    public $indexView = 'Chat';
    public $assistantId = null;
    public $threadSessionName = 'threadId';

    public $threadTracker = null;

    public function setAssistant()
    {
        $this->assistantId = env("CHAT_HARVEY");
    }

    public function setThreadTracker($threadId)
    {
        $this->threadTracker = Lead::where('thread_id', $threadId)->firstOrNew();
        if ( $this->threadTracker->id == null )
        {
            $this->threadTracker->name = "Desconhecido";
            $this->threadTracker->email = "unknown";
            $this->threadTracker->thread_id = $threadId;
            $this->threadTracker->save();
        }
    }

    public function addtoHistory($mensagem)
    {
        $history = new LeadHistory;
        $history->lead_id = $this->threadTracker->id;
        $history->text = $mensagem;
        $history->save();
    }

    

}
