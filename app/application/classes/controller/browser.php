<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Browser extends Controller_Template {
  var $template = 'layout/page';
  var $auto_render = true;

	public function action_index()
  {
        $this->template->title = "Browser-based testing";
        $this->template->links = array(array("/cuke4php","Cuke4PHP"));
		$this->template->body = View::factory('browser');
	}

} // End Welcome
