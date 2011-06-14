Feature: a simple blog
  As a user of the Website
  I want a simple blog
  So that I can see information about various topics

Scenario: I visit the blog index
    When I go to the "blog/index" 
    Then the page title should be "Blog Index"
    And the page should contain 1 "table" tag
