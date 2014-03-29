<?php

namespace Scraip\StudyBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * EventTag
 */
class EventTag
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var integer
     */
    private $event_id;

    /**
     * @var string
     */
    private $tag;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set event_id
     *
     * @param integer $eventId
     * @return EventTag
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
     * Set tag
     *
     * @param string $tag
     * @return EventTag
     */
    public function setTag($tag)
    {
        $this->tag = $tag;

        return $this;
    }

    /**
     * Get tag
     *
     * @return string 
     */
    public function getTag()
    {
        return $this->tag;
    }
}
