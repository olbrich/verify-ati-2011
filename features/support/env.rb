require 'bundler/setup'
require 'watir-webdriver'
require 'rspec'

ROOT_URL = "http://localhost:8080"

def location(name)
  case name
  when "home page", "/"
    "#{ROOT_URL}/"
  else
    "#{ROOT_URL}/#{name}"
  end
end

# suppress features tagged with @remote when there is no .wire file in step_definitions
# this lets us use other scenarios when the cuke4php server on the remote box isn't running
# otherwise cucumber complains about not being able to talk to the wire server
AfterConfiguration do |config|
  if Dir[File.dirname(__FILE__) + "/../step_definitions/*.wire"].empty?
    config.tag_expression.send(:add,"~@remote")
    puts "Skipping scenarios tagged with @remote"
  end
end
