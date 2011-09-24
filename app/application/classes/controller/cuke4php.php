<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Cuke4php extends Controller_Template {
  var $template = 'layout/page';
  var $auto_render = true;

	public function action_index()
  {
        $this->template->title = "Functional Testing with Cuke4php";
        $this->template->links = array(
            array("/browser","< In Browser Testing"),
            array("/cuke4php","Cuke4PHP Functional"),
            array("/remote","Cuke4PHP Remote >"));
		$this->template->body = View::factory('cuke4php');
	}

} // End Welcome
