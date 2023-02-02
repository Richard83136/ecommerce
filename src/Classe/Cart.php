<?php

namespace App\Classe;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class Cart
{

    private $session;
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager, SessionInterface $session)
    {
        $this->session = $session;
        $this->entityManager = $entityManager;
    }

    public function add($id)  //fonction qui va permettre d ajouter  un produit a mon panier 
    {
        $cart = $this->session->get('cart', []);  /*va chercher la session cart, si c est null renvoie un tableau*/

        if(!empty($cart[$id])){  /*si dif de vide et que tu as un bien produit déterminé fait ceci*/
            $cart[$id]++;  /*ajoute 1 en quantité*/
        }else{
            $cart[$id] = 1;
        }

        $this->session->set('cart', $cart);
    }

    public function get()
    {
        return $this->session->get('cart');
    }

    public function remove()
    {
        return $this->session->remove('cart');
    }

    public function delete($id)
    {
        $cart = $this->session->get('cart', []); 
        unset($cart[$id]);                   //tu me retires de mon tableau cart l'entrée cart qui a l'id que je souhaite supprimer

        return $this->session->set('cart', $cart);
    }
    public function decrease($id)
    {
        $cart = $this->session->get('cart', []);

        if($cart[$id]> 1){
            //retirer une quantité(-1)
            $cart[$id]--;
        }else{
            //supprimer mon produit
            unset($cart[$id]); 
        }
        return $this->session->set('cart', $cart);
       
    }
    public function getFull()
    {
        $cartComplete = [];

        if ($this->get()){

            foreach($this->get() as $id => $quantity){
                $product_object = $this->entityManager->getRepository(Product::class)->findOneById($id);
                
                if(!$product_object){
                    $this->delete($id);    //on ajoute cela si l id rentré ds la barre de tache n existe pas 
                    continue;
                }
                $cartComplete[] = [
                    'product' => $product_object,
                    'quantity' => $quantity
                ];
        }
    }
        return $cartComplete;
    }
}
