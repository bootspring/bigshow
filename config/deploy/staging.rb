role :web, "vagrant"
role :app, "vagrant"
role :db,  "vagrant", :primary => true
