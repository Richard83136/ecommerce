<?php

namespace App\Form;

use App\Classe\Filter;
use App\Entity\Category;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;


class FilterType extends AbstractType
{
    /*création du formulaire de recherche */  

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('string', TextType::class, [
                'label' => 'Rechercher un produit',
                'required' => false,
                'attr' => [
                    'placholder' => 'Votre recherche...',
                    'class' => 'form-control-sm',
                    
                ]
                ])
            ->add('categories', EntityType::class, [
                'label' => false,
                'required' =>false,
                'class' => Category::class,
                'multiple' => true,
                'expanded' => true
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Filtrer',
                'attr' => [
                    'class' => 'btn-block btn-primary'
                ]
                ]);
    }

    /*creation d'une fonction qui permet de configurer des options*/ 

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Filter::class,
            'method' => 'GET',
            'crsf_protection' => false,

        ]);
    }
    public function getBlockPrefix() /*retourne untableau préfixé du nom de ma class search*/ 
    {
        return ''; /*retourne moi rien */ 
    }
}
