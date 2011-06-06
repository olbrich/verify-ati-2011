require 'rubygems'
require 'bundler/setup'

desc "Run browser based tests using Watir"
task :watir do
  sh "cucumber -p watir features"
end

desc "Run Kohana Framework tests"
task :kohana do
  exec "cd app && phpunit --bootstrap=modules/unittest/bootstrap.php modules/unittest/tests.php"
end
