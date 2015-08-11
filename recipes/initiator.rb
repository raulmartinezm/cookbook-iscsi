#
# Cookbook Name:: iscsi
# Recipe:: initiator
#
# Copyright (C) 2015 Raul Martinez
#
# All rights reserved - Do Not Redistribute
#

package 'open-iscsi'

template '/etc/iscsi/iscsid.conf' do
  source 'iscsid.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'open-iscsi' do
  supports :status => true, :restart => true, :reload => true
  action [:restart, :enable]
end