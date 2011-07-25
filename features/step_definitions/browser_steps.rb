Before do
  # BROWSER can be 'ie','firefox','chrome'
  $browser = Watir::Browser.new ENV['BROWSER'].to_sym
end

After do
  $browser.quit
end

at_exit do
  $browser.quit if $browser
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
