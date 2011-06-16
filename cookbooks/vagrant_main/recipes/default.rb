#
# Cookbook Name:: vagrant_main
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "php::module_mysql"
include_recipe "mysql::client"
include_recipe "mysql::server"

gem_package "mysql" do
  action :install
end

gem_package "cuke4php" do
  version "0.9.6.c"
  action :install
end

gem_package "watchr" do
  action :install
end

link "/var/www/app" do 
  to "/vagrant/app"
end


%w{production development test}.each do |env|
  
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

