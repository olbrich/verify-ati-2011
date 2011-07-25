desc "run cuke4php specs"
task :cuke4php do
  exec "cuke4php features"
end

desc "start cuke4php_server"
task :server do
  exec "cd /vagrant/app && /var/lib/gems/1.8/bin/cuke4php_server -p 16817 remote_features/ "
end

task :default  => :cuke4php