<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use OpenAI\Laravel\Facades\OpenAI;
use App\Models\Lead;
use App\Mail\NewLeadMail;
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
        
            }

            $langs = 
            [
                "pt" => ". Por favor responda em português",
                "en" => ". Please answer in english",
                "es" => ". Por favor responda en español",
            ];

            

            $response = OpenAI::threads()->messages()->create($threadId, [
                'role' => 'user',
                'content' => $r->get('message').$langs[$lang],
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
                Log::debug('checking run status...');
                sleep(2);
                $run = OpenAI::threads()->runs()->retrieve($threadId, $runId);
                $threadStatus = $run->status;
                Log::debug($threadStatus);

            } while ( ! in_array($threadStatus, $expectedStatus)  );


            if ( $threadStatus == "requires_action" )
            {
                Log::debug("REQUIRES ACTION!!!!!");

                $run = $run->toArray();

                if ( $run['required_action']['type'] != 'submit_tool_outputs' )
                {
                    Log::error('NAO SEI O QUE FAZER!');
                    Log::debug($run['required_action']['type']);
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

                                    // mandar email
                                    Log::debug('negocio fechado!');

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
                                    $fillData['origin'] = $fillData['company'] ?? 'Unknown' .' - '. ($fillData['job'] ?? 'Unknown');
                                    $fillData['address'] = $fillData['location'] ?? 'Unknown';
                                    $fillData['city'] = $fillData['location'] ?? 'Unknown';
                                    $fillData['orcamento'] = $fillData['budget'] ?? 'Unknown';
                                    $fillData['cta'] = "Harvey Wood";

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

                                    Log::debug("Desrespeito detectado");
                                    Log::debug($arguments);

                                    $level = (int) $arguments['level'];

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
                                            'es' => "La conversación terminó"
                                        ];

                                        $outputs[] = $over[$lang];  
                                        Session::put('LIGMA', true);
                                    }

                                    $callOUTPUT = true;

                                    break;

                                default:

                                    Log::error('UEEEEE: '.$call['function']['name']);
                                    Log::debug($call['function']);

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

                    Log::debug($response->toArray());
                    return implode(" ", $outputs);

                }


                Log::debug($run);
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

            Log::debug($arr['data'][0]['role']);

            return $arr['data'][0]['content'][0]['text']['value'];
        }

        catch(\Exception $e)
        {
            Log::error($e->getMessage());
            return "ERROR! Please check logs";
        }

    }

    public function debug()
    {
        $threadId = Session::get('threadId');
        $response2 = OpenAI::threads()->messages()->list($threadId, [
            'limit' => 10,
        ]);

        dd($response2);
    }

}
