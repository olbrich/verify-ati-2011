<?php

/**
* 
*/
class RemoteSteps extends CucumberSteps
{

    /**
    * Given /^the "([^"]*)" table is empty$/
    **/
    public function stepTheParameterTableIsEmpty($sTable) {
        DB::delete($sTable)->execute();
    }
    
}
