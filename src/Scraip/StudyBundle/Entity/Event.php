<?php

namespace Scraip\StudyBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Event
 */
class Event
{
    /**
     * @var integer
     */
    private $event_id;

    /**
     * @var string
     */
    private $event_title;

    /**
     * @var string
     */
    private $url;

    /**
     * @var string
     */
    private $event_detail;

    /**
     * @var string
     */
    private $event_address;

    /**
     * @var string
     */
    private $event_pref;

    /**
     * @var string
     */
    private $event_year;

    /**
     * @var string
     */
    private $event_month;

    /**
     * @var string
     */
    private $event_day;

    /**
     * @var \DateTime
     */
    private $last_update;


    /**
     * Set event_id
     *
     * @param integer $eventId
     * @return Event
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
     * Set event_title
     *
     * @param string $eventTitle
     * @return Event
     */
    public function setEventTitle($eventTitle)
    {
        $this->event_title = $eventTitle;

        return $this;
    }

    /**
     * Get event_title
     *
     * @return string 
     */
    public function getEventTitle()
    {
        return $this->event_title;
    }

    /**
     * Set url
     *
     * @param string $url
     * @return Event
     */
    public function setUrl($url)
    {
        $this->url = $url;

        return $this;
    }

    /**
     * Get url
     *
     * @return string 
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * Set event_detail
     *
     * @param string $eventDetail
     * @return Event
     */
    public function setEventDetail($eventDetail)
    {
        $this->event_detail = $eventDetail;

        return $this;
    }

    /**
     * Get event_detail
     *
     * @return string 
     */
    public function getEventDetail()
    {
        return $this->event_detail;
    }

    /**
     * Set event_address
     *
     * @param string $eventAddress
     * @return Event
     */
    public function setEventAddress($eventAddress)
    {
        $this->event_address = $eventAddress;

        return $this;
    }

    /**
     * Get event_address
     *
     * @return string 
     */
    public function getEventAddress()
    {
        return $this->event_address;
    }

    /**
     * Set event_pref
     *
     * @param string $eventPref
     * @return Event
     */
    public function setEventPref($eventPref)
    {
        $this->event_pref = $eventPref;

        return $this;
    }

    /**
     * Get event_pref
     *
     * @return string 
     */
    public function getEventPref()
    {
        return $this->event_pref;
    }

    /**
     * Set event_year
     *
     * @param string $eventYear
     * @return Event
     */
    public function setEventYear($eventYear)
    {
        $this->event_year = $eventYear;

        return $this;
    }

    /**
     * Get event_year
     *
     * @return string 
     */
    public function getEventYear()
    {
        return $this->event_year;
    }

    /**
     * Set event_month
     *
     * @param string $eventMonth
     * @return Event
     */
    public function setEventMonth($eventMonth)
    {
        $this->event_month = $eventMonth;

        return $this;
    }

    /**
     * Get event_month
     *
     * @return string 
     */
    public function getEventMonth()
    {
        return $this->event_month;
    }

    /**
     * Set event_day
     *
     * @param string $eventDay
     * @return Event
     */
    public function setEventDay($eventDay)
    {
        $this->event_day = $eventDay;

        return $this;
    }

    /**
     * Get event_day
     *
     * @return string 
     */
    public function getEventDay()
    {
        return $this->event_day;
    }

    /**
     * Set last_update
     *
     * @param \DateTime $lastUpdate
     * @return Event
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
