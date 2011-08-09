<?php

    require_once("src/reporter/HtmlCoverageReporter.php");
    require_once("src/remote/RemoteCoverageRecorder.php");

    $xmlUrl = "/tmp/phpcoverage.coverage.xml";
    
    // Configure reporter, and generate report
    $covReporter = new HtmlCoverageReporter(
      "Cucumber Demo App", "", "php-coverage-remote-report");
    $excludePaths = array("/vagrant/app/system/","/vagrant/app/phpcoverage/","/vagrant/app/modules/","/vagrant/app/features/","/vagrant/app/application/logs/","/vagrant/app/remote_features/"); 
    // Set the include path for the web-app
    // PHPCOVERAGE_APPBASE_PATH is passed on the commandline
    $includePaths = array(realpath("/vagrant/app/"));

    // Notice the coverage recorder is of type RemoteCoverageRecorder
    $cov = new RemoteCoverageRecorder($includePaths, $excludePaths, $covReporter);
    // Pass the XML data url to generateReport function
    // Alternatively, you can pass the complete file path of a local file here.
    // The second parameter signifies that this is a url stream and an XML string
    $cov->generateReport($xmlUrl);
    $covReporter->printTextSummary("/tmp/report.txt");

?>