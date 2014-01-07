<?php

namespace Scraip\StudyBundle\Controller;

require __DIR__.'/../../../../Goutte/goutte.phar';

use Goutte\Client;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\DomCrawler\Crawler;

class AtndController extends Controller
{




    public function indexAction()
    {
        $objClient = new Client();

        $intCode = '46288';

        //クロールしたいURLを指定
        $crawlUrl = 'http://atnd.org/events/'.$intCode;

        //初期化
        $crawler = $objClient->request('GET', $crawlUrl);
        $response = $objClient->getResponse();
        $content = $response->getContent();
        echo $content;

    }


}


