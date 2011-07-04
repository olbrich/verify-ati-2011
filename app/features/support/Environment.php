<?php

require_once("PHPUnit/Autoload.php");
putenv('KOHANA_ENV=testing');
$_SERVER['KOHANA_ENV']="testing";
require_once(dirname(__FILE__). "/../../modules/unittest/bootstrap.php");

?>