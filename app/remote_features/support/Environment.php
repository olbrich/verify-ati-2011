<?php

require_once("PHPUnit/Autoload.php");
putenv('KOHANA_ENV=development');
$_SERVER['KOHANA_ENV']="development";
require_once(dirname(__FILE__). "/../../modules/unittest/bootstrap.php");

?>