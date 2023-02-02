<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ArtTableController extends AbstractController
{
    /**
     * @Route("/art_table_chic_ou_vintage", name="art_table")
     */
    public function index(): Response
    {
        return $this->render('art_table/index.html.twig');
    }
}
