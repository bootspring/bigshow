#
# Cookbook Name:: rvm
# Recipe:: install

ruby_version = 'ruby-1.9.3-preview1'
include_recipe "rvm::default"

bash "installing #{ruby_version}" do
  user "root"
  code "rvm install #{ruby_version}"
  not_if "rvm list | grep #{ruby_version}"
end

bash "make #{ruby_version} the default ruby" do
  user "root"
  code <<-EOS
    rvm --default #{ruby_version}
    rvm #{ruby_version}@global gem install chef
    rvm #{ruby_version}@global gem install bundler
  EOS
  not_if "rvm list | grep '=> #{ruby_version}'"
#  notifies :restart, "service[chef-client]"
  notifies :run, resources(:execute => "rvm-cleanup")
end
