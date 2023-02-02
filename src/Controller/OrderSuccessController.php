<?php

namespace App\Controller;

use App\Entity\User;
use App\Classe\Cart;
use App\Classe\Mail;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderSuccessController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/commande/merci/{stripeSessionId}", name="order_validate")
     */
    public function index(Cart $cart, $stripeSessionId)
    {
        $order = $this->entityManager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId);
        
    if (!$order || $order->getUser() != $this->getUser()){
        return $this->redirectToRoute('home');
    }
    if (!$order->getIsPaid()){
        //vider la session cart
        $cart->remove();
        
        $order->setIsPaid(1);
        $this->entityManager->flush();


        //envoyer un email au client
        $mail = new Mail();
                $content = "Bonjour ".$order->getUser()->getFirstname()."<br/>Merci pour votre commande sur Broc Vintage Style, vous pouvez la suivre sur votre compte dans notre site Broc Vintage Style ";
                $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname(), 'Votre commande Broc Vintage Style est bien validée', $content);
    }

        return $this->render('order_success/index.html.twig', [
            'order' => $order
        ]);
    }
}
