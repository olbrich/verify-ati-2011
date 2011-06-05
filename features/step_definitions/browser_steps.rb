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



When /^I go to the "([^"]*)"$/ do |page|
  $browser.goto(location(page))
end

Transform /^(\d+)$/ do |num|
  num.to_i
end


# ========= Assertions

Then /^the page should have the title "([^"]*)"$/ do |title|
  $browser.title.should == title
end


Then /^the page should contain (\d+) "([^"]*)" tags?$/ do |count, tag|
  $browser.send("#{tag}s").should have(count).elements
end
