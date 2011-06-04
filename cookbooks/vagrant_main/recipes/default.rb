#
# Cookbook Name:: vagrant_main
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "php"
include_recipe "mysql::client"
include_recipe "mysql::server"

gem_package "mysql" do
  action :install
end

mysql_database "create application_production database" do
  host "localhost"
  username "root"
  password node[:mysql][:server_root_password]
  database "application_production"
  action :create_db
end

mysql_database "create application_test database" do
  host "localhost"
  username "root"
  password node[:mysql][:server_root_password]
  database "application_test"
  action :create_db
end

