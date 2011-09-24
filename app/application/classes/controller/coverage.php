<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Coverage extends Controller_Template {
  var $template = 'layout/page';
  var $auto_render = true;

	public function action_index()
  {
        $this->template->title = "Code Coverage";
        $this->template->links = array(
            array("/remote","< Remote Cuke4PHP"),
            array("/coverage", "Code Coverage >>|"));
		$this->template->body = View::factory('coverage');
	}

} // End Welcome
