default['iscsi']['initiator']['node_startup'] = 'manual'
default['iscsi']['initiator']['leading_login'] = 'No'

# Timeouts
default['iscsi']['initiator']['replacement_timeout'] = 120
default['iscsi']['initiator']['login_timeout'] = 15
default['iscsi']['initiator']['logout_timeout'] = 15
default['iscsi']['initiator']['noop_out_interval'] = 5
default['iscsi']['initiator']['noop_out_timeout'] = 5
default['iscsi']['initiator']['abort_timeout'] = 15
default['iscsi']['initiator']['lu_reset_timeout'] = 30
default['iscsi']['initiator']['tgt_reset_timeout'] = 30

# Retry
default['iscsi']['initiator']['initial_login_retry_max'] = 8

# session and device queue depth
default['iscsi']['initiator']['cmds_max'] = 128
default['iscsi']['initiator']['queue_depth'] = 32

# MISC SYSTEM PERFORMANCE SETTINGS
default['iscsi']['initiator']['xmit_thread_priority'] = -20

# iSCSI settings
default['iscsi']['initiator']['InitialR2T'] = 'No'
default['iscsi']['initiator']['ImmediateData'] = 'Yes'
default['iscsi']['initiator']['FirstBurstLength'] = 262144
default['iscsi']['initiator']['MaxBurstLength'] = 'Yes'
default['iscsi']['initiator']['MaxRecvDataSegmentLength'] = 262144
default['iscsi']['initiator']['MaxXmitDataSegmentLength'] = 0
default['iscsi']['initiator']['MaxRecvDataSegmentLength'] = 32768
default['iscsi']['initiator']['nr_sessions'] = 1

# Workarounds
default['iscsi']['initiator']['FastAbort'] = 'Yes'