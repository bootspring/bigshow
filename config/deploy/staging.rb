role :web, "vagrant"
role :app, "vagrant"
role :db,  "vagrant", :primary => true
set :rails_env, 'staging'