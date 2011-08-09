<?php

/**
* 
*/
class RemoteSteps extends CucumberSteps
{

    /**
     * write log files at the end
     */
     public function afterWriteLogs() {
         Kohana::$log->write();
     }

    /**
    * Given /^the "([^"]*)" table is empty$/
    **/
    public function stepTheParameterTableIsEmpty($sTable) {
        DB::delete($sTable)->execute();
    }

    /**
    * Given /^a blog entry exists\:$/
    **/
    public function stepABlogEntryExists($aTable) {
        $blog = ORM::factory('blog');
        foreach ($aTable as $key => $value) {
            $blog->$value[0] = $value[1];
        }
        $blog->save();
        Kohana::$log->add(Log::INFO, "Created Blog { id: $blog->id title: $blog->title }");
    }
    
    /**
    * Given /^Remote code is instrumented for code coverage$/
    **/
    public function stepRemoteCodeIsInstrumentedForCodeCoverage() {
        system("ls");
    }
    
}
