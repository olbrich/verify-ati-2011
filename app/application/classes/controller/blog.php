<?php defined('SYSPATH') or die("No direct script access.");

/**
 * 
 **/
class Controller_Blog extends Controller_Template
{
  var $template = "layout/page";
  var $auto_render = true;

  function action_index()
  {
    $this->template->title = "Blog Index";
    $blogs = ORM::factory('blog')->find_all();
    $this->template->body = View::factory('blog/index')->set('blogs',$blogs);
  }

}

?>
