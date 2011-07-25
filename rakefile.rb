require 'rubygems'
require 'rake/clean'
require 'bundler/setup'

CLOBBER.include("features/step_definitions/remote.wire")

desc "Run browser based tests using Watir"
task :browser => :clobber do
  exec "cucumber -p browser features"
end

# create the remote.wire file needed to run remote features
file "features/step_definitions/remote.wire" do
  File.open("features/step_definitions/remote.wire","w") do |f|
    f << "host: localhost\nport: 16818\n"
  end
end

desc "Run Watir tests including those that require remote cuke4php"
task :remote  => ["features/step_definitions/remote.wire"] do
  exec "cucumber -p remote features"
end


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

desc "Run Kohana Framework tests"
task :kohana do
  exec "cd app && phpunit --bootstrap=modules/unittest/bootstrap.php modules/unittest/tests.php"
end
