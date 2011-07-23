require 'rubygems'
require 'rake/clean'
require 'bundler/setup'

CLOBBER.include("features/step_definitions/remote.wire")

desc "Run browser based tests using Watir"
task :watir => :clobber do
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


desc "Start Demo Kohana Server"
task :up do
  # this is necessary to allow the kohana server to read files in the shared folders and be able to serve them
  sh "chmod -R 755 app"
  sh "chmod -R 777 app/application/cache"
  sh "chmod -R 777 app/application/logs"
  exec 'vagrant up'
end
  
desc "Stop Demo Kohana server"
task :halt do
  exec "vagrant halt"
end

desc "SSH to kohana server box"
task :ssh do
  exec "vagrant ssh"
end