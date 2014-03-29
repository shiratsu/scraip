<?php

namespace Scraip\StudyBundle\Controller;

require __DIR__.'/../../../../Goutte/goutte.phar';

use Goutte\Client;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\HttpFoundation\Response;

use Scraip\StudyBundle\Entity\Event;
/**
 * AtndController
 * Atndのイベントを管理するクラス
 *
 */
class AtndController extends Controller
{


    public function indexAction()
    {
        $objClient = new Client();

        $eventId = '46288';

        //クロールしたいURLを指定
        $crawlUrl = 'http://atnd.org/events/'.$eventId;

        //初期化
        $crawler = $objClient->request('GET', $crawlUrl);

        $response = $objClient->getResponse();
        $status = $response->getStatus();
        var_dump($status);

        //タイトル
        $title = $crawler->filter('body > div#events > hgroup.title > h1 > a')->text();

        //URL
        $url = $crawler->filter('body > div#events > hgroup.title > h1 > a')->attr('href');

        $aryYouso = array();
        $date = null;
        $eventLocation = null;

        //ループで入ってくる要素を取得
        $aryYouso = $crawler->filter('body > div#events > div#events-show > div.main > div.events-show-info > dl.clearfix')->each(function($node) {
            //日時,会場など
            return $node->filter('dd')->text();

        });
//print_r($aryYouso);
        //イベントデータを分ける
        $date = $aryYouso[0];
        $eventAddress = $aryYouso[2];

        $aryDate = preg_split("[\/| ]", $date);
//print_r($aryDate);
        $eventYear = $aryDate[0];
        $eventMonth = $aryDate[1];
        $eventDay = $aryDate[2];

        // //データを登録する
        // $event = new Event();
//
//
        // $em = $this->getDoctrine()->getEntityManager();
//
        // //
        // $event->setEventId($eventId);
        // $event->setEventTitle($title);
        // $event->setUrl($url);
        // $event->setEventAddress($eventAddress);
        // $event->setEventYear($eventYear);
        // $event->setEventMonth($eventMonth);
        // $event->setEventDay($eventDay);
//
        // $em->persist($event);
        // $em->flush();

        $eventId = 0;
        $repository = $this->getDoctrine()->getRepository('ScraipStudyBundle:CrawlResult');

        $crawlResult = $repository->findOneBy(array('event_kind' => 1));
        if(!empty($crawlResult)){
            $eventId = $crawlResult->getEventId();
            echo $eventId;
        }


        return new Response("OK");

    }


}


