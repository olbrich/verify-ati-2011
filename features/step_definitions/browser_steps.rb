Before do
  $browser = case ENV['BROWSER']
             when 'ie','firefox','chrome'
               Watir::Browser.new ENV['BROWSER'].to_sym
             when 'headless'
               nil
             end
end

After do
  $browser.quit
end


When /^I go to (?:the )?"([^"]*)"(?: page)?$/ do |page|
  $browser.goto(location(page))
end

When /^I fill "([^"]*)" with "([^"]*)"$/ do |label_text, value|
  $browser.text_field(:id,$browser.label(:text,label_text).for).set(value)
end

When /^I press "([^"]*)"$/ do |button_text|
  $browser.button(:value, button_text).click
end


Given /^a blog entry exists:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

# ========= Transforms

Transform /^(\d+)$/ do |num|
  num.to_i
end


# ========= Assertions

Then /^the page (?:should have the title|title should be) "([^"]*)"$/ do |title|
  $browser.title.should == title
end

Then /^the page should contain (\d+) "([^"]*)"(?: tags?)?$/ do |count, tag|
  $browser.send("#{tag}s").should have(count).elements
end

Then /^the page should contain at least (\d+) "([^"]*)"(?: tags?)?$/ do |count, tag|
  $browser.send("#{tag}s").should have_at_least(count).elements
end

Then /^the page should contain "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should be on the "([^"]*)" page$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
