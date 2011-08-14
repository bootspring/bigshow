set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require "bundler/capistrano"

set :user, 'vagrant'
set :application, "bigshow"
set :deploy_to, "/home/#{user}/#{application}"
set :repository,  "git@github.com:bootspring/bigshow"

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, :roles => :app do
    run "cd #{release_path} && sudo bundle exec foreman export upstart /etc/init -a #{application} -u #{user}"
  end
end

namespace :deploy do
  desc "Start the application services"
  task :start, :roles => :app do
    sudo "start #{application}"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    sudo "stop #{application}"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    run "sudo start #{application} || sudo restart #{application}"
  end
end


desc "precompile the assets"
after 'deploy:update_code' do
  run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
end

after "deploy:update", "foreman:export"
