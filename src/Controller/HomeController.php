<?php

namespace App\Controller;

use App\Classe\Mail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="app_home")
     */
    public function index()
    {
        // $mail = new Mail();
        // $mail->send('madein43@hotmail.fr','Ric','test','bienvenue pour votre inscription');

        return $this->render('home/index.html.twig');
    }
}
