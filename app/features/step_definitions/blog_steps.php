<?php

class BlogSteps extends CucumberSteps {

    public function beforeCleanDB() {
        DB::delete("blogs")->execute();
    }

    /**
    * Given /^a blog model with\:$/
    **/
    public function stepABlogModelWith($aTable) {
        $this->blog = ORM::factory('blog');
        foreach ($aTable as $aRow) {
             $this->blog->$aRow[0] = $aRow[1];
        }
    }


    /**
    * When /^the model is saved$/
    **/
    public function stepTheModelIsSaved() {
        $this->blog->save();
    }


    /**
    * Then /^there should be (\d+) blog$/
    **/
    public function stepThereShouldBeNBlog($sCount) {
        $this->assertEquals(intval($sCount),$this->blog->count_all());
    }
    
}

?>