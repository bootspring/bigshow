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


desc "precompile the assets"
after 'deploy:update_code' do
  run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
end