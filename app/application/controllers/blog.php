<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class BlogController extends CI_Controller {

  /**
   * show a list of blog entries
   **/
  function index() {
    $this->load->model("Blog");
    $data = $this->Blog->get_one_page();
    $this->load->view("index", $data);
  }


}


