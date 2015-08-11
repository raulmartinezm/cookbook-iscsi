#
# Cookbook Name:: iscsi
# Recipe:: target
#
# Copyright (C) 2015 Raul Martinez
#
# All rights reserved - Do Not Redistribute
#

packages = [ 'iscsitarget', 'iscsitarget-dkms' ]

packages.each do |pkg|
	package pkg 
end

# Enable iscsitarget in '/etc/default/iscsitarget'
template '/etc/default/iscsitarget' do
  source 'iscsitarget.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Add config to '/etc/iet/ietd.conf'
template '/etc/iet/ietd.conf' do
  source 'ietd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Allow access in '/etc/iet/initiators.allow'
template '/etc/iet/initiators.allow' do
  source 'initiators.allow.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables ({
  	:initiators => node['iscsi']['target']['initiators_allow'],
  	})
end

# Start service 
service 'iscsitarget' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end
