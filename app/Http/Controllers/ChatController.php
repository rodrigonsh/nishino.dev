<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use OpenAI\Laravel\Facades\OpenAI;
use App\Models\Lead;
use App\Mail\NewLeadMail;
use App\Mail\sendMoreDataMail;
use Illuminate\Support\Facades\Mail;

class ChatController extends Controller
{
    function index(Request $r)
    {
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

                    $tool_outputs = [];
                    $outputs = [];

                    foreach($run['required_action']['submit_tool_outputs']['tool_calls'] as $call)
                    {
    
                        $callID = $call['id'];
                        $callOUTPUT = 'unknown';

                        if ( $call['type'] == 'function')
                        {

                            switch( $call['function']['name'] )
                            {
                                case 'negocio_fechado':

                                    //name
                                    //whatsapp
                                    //origin
                                    //email
                                    //orcamento
                                    //state
                                    //city

                                    // TODO: chamar isso num JOB
                                    $fillData = (array) json_decode($call['function']['arguments']);

                                    $fillData['name'] = $fillData['name'] ?? 'Unknown';
                                    $fillData['body'] = $fillData['summary'] ?? 'Unknown';
                                    $fillData['origin'] = $fillData['company'] ?? 'Unknown';
                                    $fillData['address'] = $fillData['location'] ?? 'Unknown';
                                    $fillData['city'] = $fillData['location'] ?? 'Unknown';
                                    $fillData['orcamento'] = $fillData['budget'] ?? 'Unknown';
                                    $fillData['cta'] = "Harvey Wood";

                                    // mandar email
                                    $msg = 'negocio fechado! '.json_encode($fillData).PHP_EOL;
                                    file_put_contents(storage_path("threads/$threadId"), "SUCCESS: $msg" , FILE_APPEND | LOCK_EX);

                                    $lead = new Lead();
                                    $lead->fill($fillData);
                                    $lead->save();

                                    Mail::to("rodrigo.nsh@gmail.com")->send(new NewLeadMail($lead)); 

                                    $callOUTPUT = true;
                                    
                                    $over = [
                                        'pt' => "OK! Tudo em ordem! Vou mandar estes dados pro Rodrigo Nishino e ele entrará em contato com você",
                                        'en' => "OK! Everything in order! I will send this data to Rodrigo Nishino and he will contact you",
                                        'es' => "¡DE ACUERDO! ¡Todo en orden! Le enviaré estes datos a Rodrigo Nishino y él se pondrá en contacto contigo."
                                    ];

                                    $outputs[] = $over[$lang];
        
                                    break;

                                case 'abort_chat':

                                    $arguments = (array) json_decode($call['function']['arguments']);                                  
                                    $level = (int) $arguments['level'];

                                    $msg = "Desrespeito detectado! Level: $level".PHP_EOL;
                                    file_put_contents(storage_path("threads/$threadId"), "ABORT: $msg" , FILE_APPEND | LOCK_EX);

                                    if ( $level <= 5 )
                                    {
                                        $over = [
                                            'pt' => "Desculpe mas esta conversa não está indo a lugar nenhum",
                                            'en' => "Sorry but this conversation isn't going anywhere",
                                            'es' => "Lo siento pero esta conversación no va a ninguna parte."
                                        ];

                                        $outputs[] = $over[$lang];  


                                    }
                                    else if ( $level > 5 && $level <= 6 )
                                    {
                                        $over = [
                                            'pt' => "Um pouco mais de respeito por favor!",
                                            'en' => "A little more respect please!",
                                            'es' => "Un poco mas de respeto por favor!"
                                        ];

                                        $outputs[] = $over[$lang];

                                    } else if ($level > 6){

                                        $over = [
                                            'pt' => "Conversa encerrada.",
                                            'en' => "Chat ended.",
                                            'es' => "La conversación terminó."
                                        ];

                                        $outputs[] = $over[$lang];  
                                        Session::put('LIGMA', true);
                                    }

                                    $callOUTPUT = true;

                                    break;

                                    case 'send_more_data':
                                          
                                        // TODO: chamar isso num JOB
                                        $fillData = (array) json_decode($call['function']['arguments']);
    
                                        // mandar email
                                        $msg = 'send_more_data: '.json_encode($fillData).PHP_EOL;
                                        file_put_contents(storage_path("threads/$threadId"), $msg , FILE_APPEND | LOCK_EX);
     
                                        Mail::to("rodrigo.nsh@gmail.com")->send(new sendMoreDataMail($fillData)); 
    
                                        $callOUTPUT = true;
                                        
                                        $over = [
                                            'pt' => "OK {name}! Tudo em ordem! Os novos dados foram enviados",
                                            'en' => "OK {name}! Everything in order! The new data has been sent",
                                            'es' => "¡Bien, {name}! ¡Todo en orden! Los nuevos datos han sido enviados."
                                        ];
    
                                        $outputs[] = $over[$lang];
            
                                        break;

                                default:
                                    $msg = "function: ".json_encode($call['function']).PHP_EOL;
                                    file_put_contents(storage_path("threads/$threadId"), "WTF: $msg" , FILE_APPEND | LOCK_EX);

                            }

                        }

                        $tool_outputs[] = [
                            'tool_call_id' => $callID,
                            'output' => $callOUTPUT,
                        ];

                    }

                    $response = OpenAI::threads()->runs()->submitToolOutputs(
                        threadId: $threadId,
                        runId: $runId,
                        parameters: [
                            'tool_outputs' => $tool_outputs,
                        ]
                    );

                    //Log::debug($response->toArray());
                    return implode(" ", $outputs);

                }

                return "REQUIRES ACTION!";
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
            file_put_contents(storage_path("threads/$threadId"), "WTF: $msg" , FILE_APPEND | LOCK_EX);

            return $mensagem;
        }

        catch(\Exception $e)
        {
            Log::error($e->getMessage());
            return "ERROR! Please check logs";
        }

    }

}
