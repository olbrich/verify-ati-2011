require 'bundler/setup'
require 'watir-webdriver'
require 'rspec'

ROOT_URL = "http://localhost:8080/app/"

def location(name)
  case name
  when "home page"
    "#{ROOT_URL}"
  end
end
