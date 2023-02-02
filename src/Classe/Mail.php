<?php 

namespace App\Classe;

use Mailjet\Client;
use Mailjet\Resources;

class Mail
{
    private $api_key = '0c30ab60f5b89dfa55308f70df23c3b1';
    private $api_key_secret = '41598a96df60d4bc527b8214fd26279c';

    public function send($to_email, $to_name, $subject, $content)
    {
        $mj = new Client($this->api_key, $this->api_key_secret,true,['version' => 'v3.1']);
       
        $body = [
            'Messages' => [
        [
            'From' => [
                'Email' => "rswebcorp@gmail.com",
                'Name' => "Broc Vintage Style"
            ],
            'To' => [
                [
                    'Email' => $to_email,
                    'Name' => $to_name
                ]
            ],
            'TemplateID' => 4461543,
            'TemplateLanguage' => true,
            'Subject' => $subject,
            'variables' => [
                'content' => $content
            ]
				
            ]
    ]
];
$response = $mj->post(Resources::$Email, ['body' => $body]);
$response->success(); 

    }
}