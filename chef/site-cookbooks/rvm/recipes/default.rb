#
# Cookbook Name:: rvm
# Recipe:: default

# Make sure that the package list is up to date on Ubuntu/Debian.
#include_recipe "apt" if [ 'debian', 'ubuntu' ].member? node[:platform]

# Make sure we have all we need to compile ruby implementations:
package "curl"
package "git-core"
include_recipe "build-essential"
 
%w(libreadline5-dev zlib1g-dev libssl-dev libxml2-dev libxslt1-dev).each do |pkg|
  package pkg
end

# clean up rvm stuff
# This is mostly to save inode space
execute "rvm-cleanup" do
  user "root"
  command "rvm cleanup sources"
  action :nothing
end
 
bash "installing RVM stable" do
  user "root"
  code "bash < <( curl -L https://rvm.beginrescueend.com/install/rvm )"
  not_if "which rvm"
end

bash "upgrading RVM stable" do
  user "root"
  code "rvm update ; rvm reload"
  only_if { false }
end
