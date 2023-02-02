<?php

namespace App\Controller;

use Stripe\Stripe;
use App\Classe\Cart;
use App\Entity\Order;
use App\Entity\Product;
use Stripe\Checkout\Session;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class StripeController extends AbstractController
{
    /**
     * @Route("/commande/create-session/{reference}", name="stripe_create_session")
     */
    public function index(EntityManagerInterface $entityManager, Cart $cart, $reference)
    {
        $products_for_stripe  = [];
        $YOUR_DOMAIN = 'http://localhost:8000';

        $order = $entityManager->getRepository(Order::class)->findOneByReference($reference);
        if(!$order){
            new JsonResponse(['error' => 'order']);
        }
        

        foreach ($order->getOrderDetails()->getValues() as $product) {
            $product_object = $entityManager->getRepository(Product::class)->findOneByName($product->getProduct());
            $products_for_stripe[] = [               

                'price_data' => [
                    'currency' => "eur",
                    'unit_amount' => $product->getPrice(),
                    'product_data' => [
                        'name' => $product->getProduct(),
                        'images' => [$YOUR_DOMAIN."/uploads/".$product_object->getIllustration()],
                    ],
                ],

                'quantity' => $product->getQuantity(),
                
            ];
            
        } 
        $products_for_stripe[] = [               

            'price_data' => [
                'currency' => "eur",
                'unit_amount' => $order->getCarrierPrice(),
                'product_data' => [
                    'name' => $order->getCarrierName(),
                    'images' => [$YOUR_DOMAIN],
                ],
            ],

            'quantity' => 1,
            
        ];
       
        /*-----insérer la clé secret key  sk_test_ -----------*/
        Stripe::setApiKey('sk_test_51MKM7bBa7tMBS9WKPwtO2j0QeWXAL80bXnLipfExqopiuVDwPwbgGkchem25DFGhdUcE6RG8ET1sDr5zroJkks7500EtGAxMKZ');

           

        $checkout_session = Session::create([
            'customer_email' => $this->getUser()->getEmail(),

        'payment_method_types' => [
            'card'
        ],
        'line_items' => [
            $products_for_stripe
        ],


        'mode' => 'payment',

        'success_url' => $YOUR_DOMAIN . '/commande/merci/{CHECKOUT_SESSION_ID}',

        'cancel_url' => $YOUR_DOMAIN . '/commande/erreur/{CHECKOUT_SESSION_ID}',

        ]);

        $order->setStripeSessionId($checkout_session->id);
        $entityManager->flush();
       

        $response = new JsonResponse(['id' => $checkout_session->id]);
        return $response;
        
    }
}
