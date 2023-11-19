<?php

namespace App\Http\Controllers;

use App\Chat\ChatSubmitToolOptions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use OpenAI\Laravel\Facades\OpenAI;

class ChatController extends Controller
{
    function index(Request $r)
    {

        Log::debug('Hi there!');

        return Inertia::render('Chat', [
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
            $assistantId = 'asst_9ye4LphpEr4Wl0d9rhYSA2Fn';
            $threadId = Session::get('threadId');
            
            if ( $threadId == null )
            {
                $res = OpenAI::threads()->create([]);
                $threadId = $res['id'];
                Session::put('threadId', $threadId);
        
                file_put_contents(storage_path("threads/$threadId"), "Novo thread".PHP_EOL , FILE_APPEND | LOCK_EX);
                Log::debug("NEW THREAD: $threadId");

            }

            $langs = 
            [
                "pt" => ". Por favor responda em português",
                "en" => ". Please answer in english",
                "es" => ". Por favor responda en español",
            ];

            
            
            file_put_contents(storage_path("threads/$threadId"), "USER: ".$mensagem.PHP_EOL , FILE_APPEND | LOCK_EX);
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
                    file_put_contents(storage_path("threads/$threadId"), "ERROR: $msg" , FILE_APPEND | LOCK_EX);
                    
                    return 'ERROR 1340';
                }
                
                else
                {
                    // executar as ferramentas, e pegar a nova resposta do servidor
                    $result =  ChatSubmitToolOptions::run($threadId, $run);
                    
                    $arr = $result->toArray();
                    Log::debug("OLHA ISSO AQUI!!", $arr);

                    $mensagem = $arr['data'][0]['content'][0]['text']['value'];
                    return $mensagem;
                }

            }

            if ( $threadStatus == "failed" )
            {
                return "Failed, try again?";
            }

            $result = OpenAI::threads()->messages()->list($threadId, [
                'limit' => 5,
            ]);

            $arr = $result->toArray();

            $role = $arr['data'][0]['role'];
            $mensagem = $arr['data'][0]['content'][0]['text']['value'];
            
            $msg = "$role: $mensagem".PHP_EOL;
            file_put_contents(storage_path("threads/$threadId"), $msg , FILE_APPEND | LOCK_EX);

            return $mensagem;
        }

        catch(\Exception $e)
        {
            $line = $e->getLine();
            Log::error($e->getMessage());
            return "ERROR on #$line Please check logs!";
        }

    }

}
