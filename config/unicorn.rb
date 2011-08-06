worker_processes 3
timeout 30

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
