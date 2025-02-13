<?php 
namespace App\SMSProviders;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class Twilio
{
    public function send($data)
    {
        // Decode the 'details' field from the provided data
        $detailsProvider = json_decode($data['details'], true);

        // Twilio API endpoint
        $endpoint = 'https://api.twilio.com/2010-04-01/Accounts/' . $detailsProvider['account_sid'] . '/Messages.json';

        

        if(!empty($data['numbers'])){
            foreach($data['numbers'] as $number){
            // Log the request data for debugging
            Log::info('Sending SMS', [
                'To' => $data['numbers'][0],
                'From' => $detailsProvider['twilio_number'],
                'Body' => $data['message']
            ]);
                // Send the SMS using Laravel's Http facade
                $response = Http::withBasicAuth($detailsProvider['account_sid'], $detailsProvider['auth_token'])
                ->asForm()
                ->post($endpoint, [
                    'To'   => $number
                    ,  // Recipient's phone number
                    'From' => $detailsProvider['twilio_number'],  // Twilio number
                    'Body' => $data['message'],  // Message body
                ]);

                // Log the response for debugging
                Log::info('Twilio Response', ['body' => $response->body(), 'status' => $response->status()]);

                 // Check for errors in the response
                if ($response->failed()) {
                    // Log the error
                    Log::error('Twilio API Error', ['error' => $response->body()]);
                    return $response->body();  // Return error response
                }

                // dd($response->body());  // Return successful response
                $message = "Message Sent successfully";
        }
        }
      

       
    }
}

