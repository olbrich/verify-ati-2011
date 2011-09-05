#
# Cookbook Name:: vagrant_main
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "timezone"
include_recipe "mysql::server"
include_recipe "mysql::client"

include_recipe "apt"

apt_repository "dotdeb" do
  uri "http://packages.dotdeb.org"
  distribution 'stable'
  components ["all"]
  key "http://www.dotdeb.org/dotdeb.gpg"
  action :add
end

include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"

include_recipe "php"

%w{php5-mysql php5-curl php5-xdebug}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{pear.phpunit.de components.ez.no pear.symfony-project.com}.each do |channel|
  php_pear_channel channel do
    action :discover
  end
end

php_pear "PHP_CodeCoverage" do
  channel "phpunit"
  version "1.0.5"
  action :install
end

php_pear "PHPUnit" do
  channel 'phpunit'
  preferred_state 'beta' # required because some dependencies aren't stable
  version "3.5.15"
  action :install
end

php_pear "XML_Parser" do
  action :install
end

gem_package "bundler" do
  action :install
end

execute "bundle install" do
  command "cd /vagrant && bundle install"
end

link "/var/www/app" do 
  to "/vagrant/app"
end


%w{production development testing}.each do |env|
  
  mysql_database "create application_#{env} database" do
    host "localhost"
    username "root"
    password node[:mysql][:server_root_password]
    database "application_#{env}"
    action :create_db
  end

  execute "create tables in application_#{env} database" do
    command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} application_#{env} < /var/www/app/application/db/blogs.sql"
  end
  
end

web_app "app" do
  docroot "/var/www/app"
  template "app.conf.erb"
  server_name 'localhost'
end

include_recipe 'monit'
monitrc('cuke4php')
monitrc("mysql")
monitrc("apache")