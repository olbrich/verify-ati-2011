<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Browser extends Controller_Template {
  var $template = 'layout/page';
  var $auto_render = true;

	public function action_index()
  {
        $this->template->title = "In Browser Testing";
        $this->template->links = array(
        	array("/browser","In Browser Testing"),
	        array("/cuke4php","Cuke4PHP Functional >"));
		$this->template->body = View::factory('browser');
	}

} // End Welcome
