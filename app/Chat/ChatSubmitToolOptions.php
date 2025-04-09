<?php

namespace App\Chat;

use App\Chat\Functions\CallAgendada;
use App\Chat\Functions\SendMoreData;
use App\Chat\Functions\GenerateClientCode;
use App\Chat\Functions\LanguageScore;
use App\Chat\Functions\UpdateLeadInfo;
use App\Chat\Functions\UpdateProjectInfo;
use App\Chat\Functions\UpdateClientInfo;
use App\Models\Lead;
use App\Models\LeadHistory;
use Illuminate\Support\Facades\Log;
use OpenAI\Laravel\Facades\OpenAI;

class ChatSubmitToolOptions
{
    public static function run($threadId, $run)
    {

        Log::debug("ChatSubmitToolOptions: $threadId");

        $runId = $run['id'];
        $tool_outputs = [];

        foreach($run['required_action']['submit_tool_outputs']['tool_calls'] as $call)
        {

            $callID = $call['id'];
            $callOUTPUT = 'unknown';

            if ( $call['type'] == 'function')
            {

                switch( $call['function']['name'] )
                {
                    case 'call_agendada':
                        $callOUTPUT = CallAgendada::run($threadId, $call);
                        break;

                    case 'language_score':
                        $callOUTPUT = LanguageScore::run($threadId, $call);
                        break;

                    case 'send_more_data':
                        $callOUTPUT = SendMoreData::run($threadId, $call);           
                        break;

                    case 'generate_client_code':
                        $callOUTPUT = GenerateClientCode::run($threadId, $call);           
                        break;
                        
                    case 'update_lead_info':
                        $callOUTPUT = UpdateLeadInfo::run($threadId, $call);           
                        break;

                    case 'update_project_info':
                        $callOUTPUT = UpdateProjectInfo::run($threadId, $call);           
                        break;

                    case 'update_client_info':
                        $callOUTPUT = UpdateClientInfo::run($threadId, $call);           
                        break;

                    default:
                        $msg = "function: ".json_encode($call['function']).PHP_EOL;
                        file_put_contents(storage_path("threads/$threadId"), "WTF: $msg" , FILE_APPEND | LOCK_EX);
                        $callOUTPUT = 'the backend could not process this function';           
                        break;


                }

            }

            $tool_outputs[] = [
                'role'         => 'tool',
                'tool_call_id' => $callID,
                'output'       => $callOUTPUT,
                'name'         => $call['function']['name']
            ];

        }

        $response = OpenAI::threads()->runs()->submitToolOutputs(
            threadId: $threadId,
            runId: $runId,
            parameters: [
                'tool_outputs' => $tool_outputs,
            ]
        );

        $runId = (string) $response['id'];

        $expectedStatus = ['cancelled', 'failed', 'completed', 'expired', 'requires_action'];

        do{
            sleep(2);
            $run = OpenAI::threads()->runs()->retrieve($threadId, $runId);
            $threadStatus = $run->status;

        } while ( ! in_array($threadStatus, $expectedStatus)  );

        //Log::debug('Teste!', $response->toArray());

        if ( $threadStatus == "requires_action" )
        {
            $run = $run->toArray();

            $lead = Lead::where('thread_id', $threadId)->first();

            if ( $run['required_action']['type'] != 'submit_tool_outputs' )
            {
                $msg = 'requires_action: '.$run['required_action']['type'].PHP_EOL;
                
                $history = new LeadHistory;
                $history->lead_id = $lead->id;
                $history->text = $msg;
                $history->save();
                                    
                return 'ERROR 1340';
            }
            
            else
            {
                // executar as ferramentas, e pegar a nova resposta do servidor
                $result =  ChatSubmitToolOptions::run($threadId, $run);
                
                $arr = $result->toArray();

                $mensagem = $arr['data'][0]['content'][0]['text']['value'];
                
                $history = new LeadHistory;
                $history->lead_id = $lead->id;
                $history->text = $mensagem;
                $history->save();

                return $mensagem;
            }

        }

        $result = OpenAI::threads()->messages()->list($threadId, [
            'limit' => 1,
        ]);
        return $result;

    }

}
