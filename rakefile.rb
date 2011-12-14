require 'rubygems'
require 'rake/clean'
require 'bundler/setup'

CLOBBER.include("features/step_definitions/remote.wire")


task :instrument do
  sh %Q{bundle exec vagrant ssh -c "cd /vagrant/app && php phpcoverage/src/cli/instrument.php -p phpcoverage/src -b . ./index.php" }
  sleep 1
end

task :deinstrument do
  sh %Q{bundle exec vagrant ssh -c "cd /vagrant/app && php phpcoverage/src/cli/instrument.php -p phpcoverage/src -b . -u ./index.php" }
end

desc "Run browser based tests using Watir"
task :browser => [:clobber] do
  sh "bundle exec cucumber -p browser features"
end

# create the remote.wire file needed to run remote features
file "features/step_definitions/remote.wire" do
  File.open("features/step_definitions/remote.wire","w") do |f|
    f << "host: localhost\nport: 16818\n"
  end
end

desc "Run Watir tests including those that require remote cuke4php"
task :remote  => ["features/step_definitions/remote.wire"] do
  exec "bundle exec cucumber -p remote features"
end

desc "Run tests with code coverage"
task :coverage => [:instrument, :browser] do
  Rake::Task[:deinstrument].execute
end

directory "app/application/cache"
directory "app/application/logs"

desc "Start Demo Kohana Server"
task :up => %w{app/application/cache app/application/logs} do
  # this is necessary to allow the kohana server to read files in the shared folders and be able to serve them
  sh "chmod -R 755 app"
  sh "chmod -R 777 app/application/cache"
  sh "chmod -R 777 app/application/logs"
  # sh "touch app/phpcoverage/report"
  # sh "chmod -R 777 app/phpcoverage/report"
  exec 'bundle exec vagrant up'
end
  
desc "Stop Demo Kohana server"
task :halt do
  exec "bundle exec vagrant halt"
end

desc "SSH to kohana server box"
task :ssh do
  exec "bundle exec vagrant ssh"
end

desc "Run Kohana Framework tests"
task :kohana do
  exec "cd app && phpunit --bootstrap=modules/unittest/bootstrap.php modules/unittest/tests.php"
end
