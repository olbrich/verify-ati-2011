Feature: a simple blog
  As a user of the Website
  I want a simple blog
  So that I can see information about various topics

Scenario: I visit the blog index
  When I go to "blog/index" 
  Then the page title should be "Blog Index"
  And the page should contain 1 "table" tag

Scenario: I create a blog entry
  When I go to the "blog/new" page
  Then the page title should be "Create Blog Entry"
  And the page should contain 1 "form" tag
  When I fill "Title" with "my awesome blog title"
  And I fill "Body" with "lorem ipsum, blah, blah, blah..."
  And I press "Create"
  Then the page title should be "Blog: my awesome blog title"

@remote  
Scenario: I view a blog entry
  Given the "blogs" table is empty
  And a blog entry exists:
    | id    | 1                             |
    | title | yet another awesome blog post |
    | body  | I can haz blog post?          |
  When I go to "blog/show/1"
  Then the page title should be "Blog: yet another awesome blog post"
  And the page should contain "I can haz blog post?"
  
