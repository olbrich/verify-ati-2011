desc "run cuke4php specs"
task :cuke4php do
  exec "cuke4php features"
end

task :default  => :cuke4php