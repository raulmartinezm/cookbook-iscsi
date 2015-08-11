# '/etc/iet/ietd.conf' 
default['iscsi']['target']['date'] = '2015-08'
default['iscsi']['target']['volume'] = '/dev/sdb'
default['iscsi']['target']['naming_auth'] = 'ST1'
default['iscsi']['target']['name'] = 'storage'
default['iscsi']['target']['type'] = 'fileio'
default['iscsi']['target']['alias'] = 'iscsi'

# '/etc/default/iscsitarget' 
default['iscsi']['target']['iscsitarget_enable'] = true
default['iscsi']['target']['iscsitarget_max_sleep'] = '3'
default['iscsi']['target']['iscsitarget_options'] = ''

# '/etc/iet/initiators.allow' 
default['iscsi']['target']['initiators_allow'] =  {'ALL' => 'ALL'}  # { 'ALL' => '192.168.33.0/24', 'iqn.2015-08.ST1:storage' => 'ALL'}