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

package "curl"
package "git-core"
include_recipe "build-essential"
 
%w(libyaml-dev libreadline5-dev zlib1g-dev libssl-dev libxml2-dev libxslt1-dev).each do |pkg|
  package pkg
end

bash 'install ruby' do
  user 'root'
  code <<-EOC
    wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
    tar xvfz ruby-1.9.3-preview1.tar.gz
    cd ruby-1.9.3-preview1 && ./configure --disable-install-doc && make -j2 && make install
  EOC
  not_if "ruby -v | grep 1.9.3dev"
end

gem 'chef'
gem 'bundler'
