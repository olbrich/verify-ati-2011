<?php

    require_once("src/reporter/HtmlCoverageReporter.php");
    require_once("src/remote/RemoteCoverageRecorder.php");

    $xmlUrl = "/tmp/phpcoverage.coverage.xml";

    // Configure reporter, and generate report
    $covReporter = new HtmlCoverageReporter(
      "Cucumber Demo App", "", "/tmp/php-coverage-remote-report");
    $excludePaths = array("/vagrant/app/system/","/vagrant/app/phpcoverage/","/vagrant/app/modules/","/vagrant/app/features/","/vagrant/app/application/logs/","/vagrant/app/remote_features/"); 
    $includePaths = array(realpath("/vagrant/app/"));

    $cov = new RemoteCoverageRecorder($includePaths, $excludePaths, $covReporter);
    system("rm -rf /vagrant/app/phpcoverage/php-coverage-remote-report/*");
    $cov->generateReport($xmlUrl);
    
    header("Location: /phpcoverage/report");
?>