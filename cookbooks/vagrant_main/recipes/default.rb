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


%w{production development test}.each do |env|
  
  mysql_database "create application_#{env} database" do
    host "localhost"
    username "root"
    password node[:mysql][:server_root_password]
    database "application_#{env}"
    action :create_db
  end

  execute "create blogs table in application_#{env} database" do
    sql = %Q{
      CREATE TABLE IF NOT EXISTS blogs (
        id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(80) NOT NULL,
        body TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP);
    }
    command "echo \"#{sql}\" | /usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} application_#{env}"
  end
  
end

link "/var/www/app" do 
  to "/vagrant/app"
end

web_app "app" do
  docroot "/var/www/app"
  template "app.conf.erb"
  server_name 'localhost'
end

