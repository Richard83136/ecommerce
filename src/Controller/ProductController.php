<?php

namespace App\Controller;

use App\Classe\Filter;
use App\Entity\Product;
use App\Form\FilterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class ProductController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/nos-produits", name="products")
     */
    public function index(Request $request)
    {
        $products = $this->entityManager->getRepository(Product::class)->findAll();

        $filters = new Filter();
        $filterform = $this->createForm(FilterType::class, $filters);

        $filterform->handleRequest($request);
        if ($filterform->isSubmitted() && $filterform->isValid()) {
            $products = $this->entityManager->getRepository(Product::class)->findWithFilters($filters);
        }


        return $this->render('product/index.html.twig',[
            'products' => $products,
            'filterform' => $filterform->createView()
        ]);
    }
    /**
     * @Route("/produit/{slug}", name="product")
     */
    public function show($slug)
    {
        $product = $this->entityManager->getRepository(Product::class)->findOneBySlug($slug);

        if(!$product){
            return $this->redirectToRoute('products');
        }
        return $this->render('product/show.html.twig',[
            'product' =>$product
        ]);
    }
}
