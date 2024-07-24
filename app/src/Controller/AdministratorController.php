<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class AdministratorController extends AbstractController
{
    #[Route('/administrator', name: 'app_administrator')]
    public function index(Request $request): Response
    {
        $frameId = $request->headers->get('Turbo-Frame');

        return $this->render('administrator/index.html.twig', [
            'controller_name' => 'AdministratorController',
        ]);
    }
}
