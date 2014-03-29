<?php

// src/Scraip/StudyBundle/Command/AtndCommand.php
namespace Scraip\StudyBundle\Command;

require __DIR__.'/../../../../Goutte/goutte.phar';

use Goutte\Client;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

use Symfony\Component\DomCrawler\Crawler;

use Scraip\StudyBundle\Entity\Event;
use Scraip\StudyBundle\Entity\CrawlResult;

/**
 * AtndCommand
 * Atndのイベントをクロールするクラス
 *
 */
class AtndCommand extends ContainerAwareCommand
{

    private $objClient 		= null;
    private $intCrawlCount 	= null;
    const CRAWL_LIMIT 		= 2000;
    const EVENT_ATND		= 1;

    protected function configure()
    {
        $this
            ->setName('study:atnd')
            ->setDescription('Atnd Crawl')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $this->objClient = new Client();

        $eventId = $this->_getCurrentEventId(AtndCommand::EVENT_ATND);
        if($eventId == null){
            $eventId = 46288;
        }

        for($i=0;$i<AtndCommand::CRAWL_LIMIT;$i++){

            $eventId = $eventId+$i;
            $this->_crawlEvent($eventId);


        }

        $this->_afterProcess($eventId);

    }

    /**
     * イベントの種類に基づいたイベントIDの最後のクロールした値を取り出す
     */
    private function _getCurrentEventId($eventKind){

        $eventId = 0;
        $repository = $this->getDoctrine()->getRepository('ScraipStudyBundle:CrawlResult');

        $crawlResult = $repository->findOneBy(array('event_kind' => 1));
        if(!empty($crawlResult)){
            $eventId = $crawlResult->getEventId();
        }
        return $eventId;

    }


    /**
     * イベントデータをクロールする
     */
    private function _crawlEvent($eventId){
        //クロールしたいURLを指定
        $crawlUrl = 'http://atnd.org/events/'.$eventId;

        //初期化
        $crawler = $this->objClient->request('GET', $crawlUrl);

        //HTTPステータス取得
        $response = $objClient->getResponse();
        $status = $response->getStatus();
        if($status != 200){
            return;
        }

        //タイトル
        $title = $crawler->filter('body > div#events > hgroup.title > h1 > a')->text();

        //URL
        $url = $crawler->filter('body > div#events > hgroup.title > h1 > a')->attr('href');

        $aryYouso = array();
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

        $this->_registEvent($eventId, $title, $url, $eventAddress, $eventYear, $eventMonth, $eventDay);

    }


    /**
     * クロール結果を登録する
     */
    private function _registEvent($eventId,$title,$url,$eventAddress,$eventYear,$eventMonth,$eventDay){
        // //データを登録する
        $event = new Event();

        $container = $this->getContainer();
        $em = $container->get('doctrine')->getEntityManager();

        //
        $event->setEventId($eventId);
        $event->setEventTitle($title);
        $event->setUrl($url);
        $event->setEventAddress($eventAddress);
        $event->setEventYear($eventYear);
        $event->setEventMonth($eventMonth);
        $event->setEventDay($eventDay);
        $event->setLastUpdate(new \DateTime());

        $em->persist($event);
        $em->flush();
    }


    /**
     * バッチ終了後の後始末
     */
    private function _afterProcess($eventId){

        // //データを登録する
        $crawlResult = new CrawlResult();

        $container = $this->getContainer();
        $em = $container->get('doctrine')->getEntityManager();

        $crawlResult = $em->getRepository('ScraipStudyBundle:CrawlResult')->findOneBy(array('event_kind' => AtndCommand::EVENT_ATND));

        if (!$crawlResult) {
            throw $this->createNotFoundException('No CrawlResult found for event_kind '.AtndCommand::EVENT_ATND);
        }

        $crawlResult->setEventId($eventId);
        $em->flush();

    }
}