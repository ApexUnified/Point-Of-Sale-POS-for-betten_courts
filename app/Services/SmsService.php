<?php

namespace App\Services;

use App\SMSProviders\BdBulkSms;
use App\SMSProviders\ReveSms;
use App\SMSProviders\TonkraSms;
use App\SMSProviders\Twilio;

class SmsService
{
    private $_tonkraSms;
    private $_reveSms;
    private $_bdbulkSms;
    private $_twilio;

    public function __construct(TonkraSms $tonkraSms, ReveSms $reveSms, BdBulkSms $bdBulkSms, Twilio $twilio)
    {
        $this->_tonkraSms = $tonkraSms;
        $this->_reveSms = $reveSms;
        $this->_bdbulkSms = $bdBulkSms;
        $this->_twilio = $twilio;
    }

    public function initialize($data)
    {
        $smsServiceProviderName = $data['sms_provider_name'];
        
        switch ($smsServiceProviderName) {
            case 'tonkra':
                return $this->_tonkraSms->send($data);
            case 'revesms':
                return $this->_reveSms->send($data);
            case 'bdbulksms':
                return $this->_bdbulkSms->send($data);
                break;
            case 'twilio':
                 return $this->_twilio->send($data); 
                 break;   
            default:
                break;
        }
    }
}