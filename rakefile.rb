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

file "features/step_definitions/remote.wire" do
  File.open("features/step_definitions/remote.wire","w") do |f|
    f << "host: localhost\nport: 16818\n"
  end
end

namespace :remote do
  
  task :start do
    sh "vagrant ssh -e 'cd /vagrant/app && cuke4php_server -p 16817 remote_features/ &'"
  end

  desc "default"
  task :default  => ["features/step_definitions/remote.wire"] do
    sh "cucumber -p watir features"
  end
  
end

task :remote => "remote:default"
task :default => :watir
