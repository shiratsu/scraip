<?php

namespace Scraip\StudyBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CrawlResult
 */
class CrawlResult
{
    /**
     * @var integer
     */
    private $event_id;

    /**
     * @var integer
     */
    private $event_kind;

    /**
     * @var \DateTime
     */
    private $last_update;


    /**
     * Set event_id
     *
     * @param integer $eventId
     * @return CrawlResult
     */
    public function setEventId($eventId)
    {
        $this->event_id = $eventId;

        return $this;
    }

    /**
     * Get event_id
     *
     * @return integer 
     */
    public function getEventId()
    {
        return $this->event_id;
    }

    /**
     * Set event_kind
     *
     * @param integer $eventKind
     * @return CrawlResult
     */
    public function setEventKind($eventKind)
    {
        $this->event_kind = $eventKind;

        return $this;
    }

    /**
     * Get event_kind
     *
     * @return integer 
     */
    public function getEventKind()
    {
        return $this->event_kind;
    }

    /**
     * Set last_update
     *
     * @param \DateTime $lastUpdate
     * @return CrawlResult
     */
    public function setLastUpdate($lastUpdate)
    {
        $this->last_update = $lastUpdate;

        return $this;
    }

    /**
     * Get last_update
     *
     * @return \DateTime 
     */
    public function getLastUpdate()
    {
        return $this->last_update;
    }
}
