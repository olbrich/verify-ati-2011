<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Welcome extends Controller_Template {
  var $template = 'layout/page';
  var $auto_render = true;

	public function action_index()
  	{
    	$this->template->title = "Testing PHP Web applications with Cucumber";
		$this->template->links = array(array("/browser","In Browser Testing >"));
		$this->template->body = View::factory('welcome');
	}

} // End Welcome
