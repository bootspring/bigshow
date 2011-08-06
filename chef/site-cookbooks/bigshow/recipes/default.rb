require_recipe 'rvm::install'

gem_package 'bundler'


service 'varnish' do
  action :stop
end

template "/etc/nginx/sites-available/bigshow" do
  source "bigshow-site.erb"
  owner "root"
  group "root"
  mode 0644
end

link '/etc/nginx/sites-enabled/bigshow' do
  to '/etc/nginx/sites-available/bigshow'
end

file '/etc/nginx/sites-enabled/default' do
  action :delete
end
