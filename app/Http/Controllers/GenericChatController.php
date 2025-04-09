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

class GenericChatController extends Controller
{
    public $indexView = 'ajustar';
    public $assistantId = 'ajustar';
    public $threadSessionName = 'ajustar';

    function index(Request $r)
    {
        return Inertia::render($this->indexView, [
            'canLogin' => false,
            'canRegister' => false,    
            'laravelToken' => csrf_token(),
        ]);
    }

    function message(Request $r)
    {

        $lang = $r->get('lang', 'en');
        
        // prevent xterm command abuse
        $mensagem = str_replace('\x1b', '\\x1b', $r->get('message'));
        $mensagem = substr($mensagem, 0, 250);

        if ( Session::get('LIGMA', null) != null )
        {
            $over = [
                'pt' => "Conversa encerrada.",
                'en' => "Chat ended.",
                'es' => "La conversación terminó"
            ];

            sleep(random_int(1, 10));

            return $over[$lang];
        }

        try
        {
            
            // assistantID
            if ( method_exists($this, 'setAssistant') ) $this->setAssistant();
            $assistantId = $this->assistantId;            
         
            $threadId = Session::get($this->threadSessionName);
            
            $newThread  = $threadId == null;

            if ( $threadId == null )
            {
                $res = OpenAI::threads()->create([]);
                $threadId = $res['id'];
                Session::put($this->threadSessionName, $threadId);

                Mail::to("rodrigo.nsh@gmail.com")->send(new NewThreadMail($mensagem));

                
            }
            
            // Este metodo tem que existir na classe herdeira
            // serve para trackear o Lead, ou Projeto, ou Usuario etc
            $this->setThreadTracker($threadId);
            
            if ( method_exists($this, 'addToHistory') ) $this->addToHistory($mensagem);
            
            
            if ( $newThread && method_exists($this, 'prependFirstMessage') )
            {
                $mensagem = $this->prependFirstMessage($mensagem);
            }

            $langs = 
            [
                "pt" => ". Por favor responda em português",
                "en" => ". Please answer in english",
                "es" => ". Por favor responda en español",
            ];

            

            $response = OpenAI::threads()->messages()->create($threadId, [
                'role' => 'user',
                'content' => $mensagem.$langs[$lang],
            ]);

            // run it 
            $res = OpenAI::threads()->runs()->create(
                threadId: $threadId, 
                parameters: [
                    'assistant_id' => $assistantId,
                ],
            );

            $runId = (string) $res['id'];

            $expectedStatus = ['cancelled', 'failed', 'completed', 'expired', 'requires_action'];

            do{
                sleep(2);
                $run = OpenAI::threads()->runs()->retrieve($threadId, $runId);
                $threadStatus = $run->status;

            } while ( ! in_array($threadStatus, $expectedStatus)  );


            if ( $threadStatus == "requires_action" )
            {
                $run = $run->toArray();

                if ( $run['required_action']['type'] != 'submit_tool_outputs' )
                {
                    $msg = 'requires_action: '.$run['required_action']['type'].PHP_EOL;
                    
                    if ( method_exists($this, 'addToHistory') ) $this->addToHistory($msg);
                                        
                    return 'ERROR 1340';
                }
                
                else
                {
                    // executar as ferramentas, e pegar a nova resposta do servidor
                    $result =  ChatSubmitToolOptions::run($threadId, $run);
                    
                    $arr = $result->toArray();

                    $mensagem = $arr['data'][0]['content'][0]['text']['value'];
                    
                    if ( method_exists($this, 'addToHistory') ) $this->addToHistory($mensagem);

                    return $mensagem;
                }

            }

            if ( $threadStatus == "failed" )
            {
                if ( method_exists($this, 'addToHistory') ) $this->addToHistory("Failed");
                return "Failed, try again?";
            }

            $result = OpenAI::threads()->messages()->list($threadId, [
                'limit' => 1,
            ]);

            $arr = $result->toArray();

            $role = $arr['data'][0]['role'];
            $mensagem = $arr['data'][0]['content'][0]['text']['value'];
            
            if ( method_exists($this, 'addToHistory') ) $this->addToHistory($mensagem);

            return $mensagem;
        }

        catch(\Exception $e)
        {
            $line = $e->getLine();
            //Log::error($e->getTrace());
            Log::error($e->getFile());
            Log::error($e->getMessage());
            return "ERROR on #$line Please check logs!";
        }

    }

}
