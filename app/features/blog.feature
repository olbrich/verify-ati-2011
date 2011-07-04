Feature: Blogs
  In order to manipulate blog posts
  As a user
  I want to be able to manipulate blog entries
    
Scenario: create a blog post
  Given a blog model with:
    | title | a blog title |
    | body  | a blog body  |
  When the model is saved
  Then there should be 1 blog
  