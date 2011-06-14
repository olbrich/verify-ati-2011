Feature: A static landing page
  As a user of the application
  I want a landing page containing useful information and links
  So that I have someplace to start

Scenario: A user visits the home page
    When I go to the "home page"
    Then the page should have the title "Testing PHP Web applications with Cucumber"
    And the page should contain 1 "h1" tag
    And the page should contain 3 "h2" tags
    And the page should contain 1 "ul" tag
    And the page should contain at least 4 "a" tags
