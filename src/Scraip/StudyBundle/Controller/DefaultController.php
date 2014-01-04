<?php

namespace Scraip\StudyBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('ScraipStudyBundle:Default:index.html.twig', array('name' => $name));
    }
}
