<?php

namespace App\Controller;

use App\Entity\Habitat;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/habitats')]
class HabitatsController extends AbstractController
{
    #[Route('/', name: 'app_habitats')]
    public function index(): Response
    {
        return $this->render('habitats/index.html.twig', [
            'controller_name' => 'HabitatsController',
        ]);
    }
    
    #[Route('/new', name: 'app_habitats')]
    public function new(EntityManagerInterface $em)
    {
        $habitatsNames=['Savane', 'Jungle', 'Marais'];
        $habitatsDescr=
        [
            'Des plaines arides, où vivent des animaux légendaires.',
            'Une jungle luxuriante abritant des espèces rares et sauvages',
            'Un écosystème riche en faune sauvage et en végétation luxuriante'
        ];
        foreach($habitatsNames as $el => $name){
            $habitatsGen= new Habitat();
            $habitatsGen->setName($name);
            $habitatsGen->setDescription($habitatsDescr[$el]);
            $em->persist($habitatsGen);
            $em->flush();
        }
    }
}
