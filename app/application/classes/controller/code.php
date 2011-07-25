<?php defined('SYSPATH') or die("No direct script access.");

/**
 * 
 **/
class Controller_Code extends Controller_Template
{
  var $template = "layout/code";
  var $auto_render = true;

  function action_index()
  {
    $this->template->title = $this->request->param('filename');
    $content = file_get_contents( "/vagrant/" . $this->request->param('filename'));
    $this->template->body = htmlspecialchars($content);
  }
  
}

?>
