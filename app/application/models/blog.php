<?php
/**
 * Blog Post Model
 **/

class Blog extends CI_Model
{
  var $title = '';
  var $body = '';
  var $created_at = '';
  var $updated_at = '';

  function __construct()
  {
    parent::__construct();
  }

  /**
   * create a blog entry
   **/
  function create($_title, $_body)
  {
    $this->$title = $_title;
    $this->$body = $_body;
    $this->$created_at = date();
    $this->$updated_at = date();
    $this->db->insert("blogs", $this);
  }

}

?>
