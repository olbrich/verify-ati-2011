require 'rubygems'
require 'bundler/setup'

desc "Run browser based tests using Watir"
task :watir do
  sh "cucumber -p watir features"
end
