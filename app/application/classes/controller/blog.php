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
  
  function action_new()
  {
      $this->template->title = "Create Blog Entry";
      $this->template->body = View::factory('blog/new');
  }
  
  function action_create()
  {
    $this->auto_render = false;
    $blog = ORM::factory('blog');
    $blog->title = $this->request->post('title');
    $blog->body = $this->request->post('body');
    $blog->save();
    $this->request->redirect($this->request->uri(array('action'=>'show', 'id'=>$blog->id)));
  }
  
  function action_edit()
  {
      $this->template->title = "Edit Blog Entry";
      $this->template->body = View::factory('blog/index')->set('blogs',$blogs);
  }
  
  function action_show()
  {
      $blog = ORM::factory('blog',intval($this->request->param('id')));
      // redirect to index if not found
      $this->template->title = "Blog: $blog->title";
      $this->template->body = View::factory('blog/show')->set('blog',$blog)->set('request',$this->request);
  }

}

?>
