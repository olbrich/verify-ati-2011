<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Remote extends Controller_Template {
  var $template = 'layout/page';
  var $auto_render = true;

	public function action_index()
  {
        $this->template->title = "Remote Testing with Cuke4php";
        $this->template->links = array(
            array("/cuke4php","Cuke4php"),
            array("/coverage","Code Coverage"));
		$this->template->body = View::factory('remote');
	}

} // End Welcome
