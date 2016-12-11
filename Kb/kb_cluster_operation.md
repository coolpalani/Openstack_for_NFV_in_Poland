# After stop 2 node within 3 nodes 

```sh 

[root@slot7 nova]# pcs 
[root@slot14 nova]# pcs status 


[root@slot5 nova]# pcs status 
Cluster name: tripleo_cluster
Stack: corosync
Current DC: slot5 (version 1.1.15-11.el7-e174ec8) - partition with quorum
Last updated: Thu Dec  8 16:39:52 2016		Last change: Thu Dec  8 13:58:17 2016 by root via cibadmin on slot14

3 nodes and 130 resources configured

Online: [ slot14 slot5 slot7 ]

Full list of resources:

 ip-172.19.85.11	(ocf::heartbeat:IPaddr2):	Started slot14
 ip-172.23.85.11	(ocf::heartbeat:IPaddr2):	Started slot5
 Clone Set: haproxy-clone [haproxy]
     Started: [ slot14 slot5 slot7 ]
 Master/Slave Set: galera-master [galera]
     Masters: [ slot14 slot5 slot7 ]
 Clone Set: memcached-clone [memcached]
     Started: [ slot14 slot5 slot7 ]
 ip-172.19.85.12	(ocf::heartbeat:IPaddr2):	Started slot7
 ip-172.20.85.11	(ocf::heartbeat:IPaddr2):	Started slot14
 ip-172.23.85.86	(ocf::heartbeat:IPaddr2):	Started slot5
 Clone Set: rabbitmq-clone [rabbitmq]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-core-clone [openstack-core]
     Started: [ slot14 slot5 slot7 ]
 Master/Slave Set: redis-master [redis]
     Slaves: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 ip-172.21.85.11	(ocf::heartbeat:IPaddr2):	Started slot7
 Clone Set: mongod-clone [mongod]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-aodh-evaluator-clone [openstack-aodh-evaluator]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-scheduler-clone [openstack-nova-scheduler]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-l3-agent-clone [neutron-l3-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-netns-cleanup-clone [neutron-netns-cleanup]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-ovs-cleanup-clone [neutron-ovs-cleanup]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 openstack-cinder-volume	(systemd:openstack-cinder-volume):	Stopped
 Clone Set: openstack-heat-engine-clone [openstack-heat-engine]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-api-clone [openstack-ceilometer-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-aodh-listener-clone [openstack-aodh-listener]
     Started: [ slot14 ]
     Stopped: [ slot5 slot7 ]
 Clone Set: neutron-metadata-agent-clone [neutron-metadata-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-gnocchi-metricd-clone [openstack-gnocchi-metricd]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-aodh-notifier-clone [openstack-aodh-notifier]
     Started: [ slot14 ]
     Stopped: [ slot5 slot7 ]
 Clone Set: openstack-heat-api-clone [openstack-heat-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-collector-clone [openstack-ceilometer-collector]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-glance-api-clone [openstack-glance-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-cinder-scheduler-clone [openstack-cinder-scheduler]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-api-clone [openstack-nova-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-consoleauth-clone [openstack-nova-consoleauth]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-sahara-api-clone [openstack-sahara-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-heat-api-cloudwatch-clone [openstack-heat-api-cloudwatch]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-sahara-engine-clone [openstack-sahara-engine]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-glance-registry-clone [openstack-glance-registry]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-gnocchi-statsd-clone [openstack-gnocchi-statsd]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-notification-clone [openstack-ceilometer-notification]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-cinder-api-clone [openstack-cinder-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-dhcp-agent-clone [neutron-dhcp-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-openvswitch-agent-clone [neutron-openvswitch-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-novncproxy-clone [openstack-nova-novncproxy]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: delay-clone [delay]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-server-clone [neutron-server]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-central-clone [openstack-ceilometer-central]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: httpd-clone [httpd]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-heat-api-cfn-clone [openstack-heat-api-cfn]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-conductor-clone [openstack-nova-conductor]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 ipmi-slot5	(stonith:fence_ipmilan):	Stopped
 ipmi-slot7	(stonith:fence_ipmilan):	Stopped
 ipmi-slot14	(stonith:fence_ipmilan):	Stopped

Failed Actions:
* openstack-nova-scheduler_monitor_60000 on slot5 'OCF_PENDING' (196): call=311, status=complete, exitreason='none',
    last-rc-change='Wed Dec  7 10:39:48 2016', queued=0ms, exec=0ms
* neutron-server_monitor_60000 on slot5 'OCF_PENDING' (196): call=516, status=complete, exitreason='none',
    last-rc-change='Thu Dec  8 07:55:50 2016', queued=0ms, exec=0ms


Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled
[root@slot5 nova]# systemctl -a | grep openstack 
  openstack-swift-account-auditor.service                                                                                        loaded    active   running   OpenStack Object Storage (swift) - Account Auditor
  openstack-swift-account-reaper.service                                                                                         loaded    active   running   OpenStack Object Storage (swift) - Account Reaper
  openstack-swift-account-replicator.service                                                                                     loaded    active   running   OpenStack Object Storage (swift) - Account Replicator
  openstack-swift-account.service                                                                                                loaded    active   running   OpenStack Object Storage (swift) - Account Server
  openstack-swift-container-auditor.service                                                                                      loaded    active   running   OpenStack Object Storage (swift) - Container Auditor
  openstack-swift-container-replicator.service                                                                                   loaded    active   running   OpenStack Object Storage (swift) - Container Replicator
  openstack-swift-container-updater.service                                                                                      loaded    active   running   OpenStack Object Storage (swift) - Container Updater
  openstack-swift-container.service                                                                                              loaded    active   running   OpenStack Object Storage (swift) - Container Server
  openstack-swift-object-auditor.service                                                                                         loaded    active   running   OpenStack Object Storage (swift) - Object Auditor
  openstack-swift-object-replicator.service                                                                                      loaded    active   running   OpenStack Object Storage (swift) - Object Replicator
  openstack-swift-object-updater.service                                                                                         loaded    active   running   OpenStack Object Storage (swift) - Object Updater
  openstack-swift-object.service                                                                                                 loaded    active   running   OpenStack Object Storage (swift) - Object Server
  openstack-swift-proxy.service                                                                                                  loaded    active   running   OpenStack Object Storage (swift) - Proxy Server
[root@slot5 nova]# pcs resource cleanup 
Error: Cleaning up all resources on all nodes will execute more than 100 operations in the cluster, which may negatively impact the responsiveness of the cluster. Consider specifying resource and/or node, use --force to override
[root@slot5 nova]# 
[root@slot5 nova]# 
[root@slot5 nova]# pcs resource cleanup --force 
Waiting for 1 replies from the CRMd. OK
[root@slot5 nova]# 
[root@slot5 nova]# pcs status 
Cluster name: tripleo_cluster
Stack: corosync
Current DC: slot5 (version 1.1.15-11.el7-e174ec8) - partition with quorum
Last updated: Thu Dec  8 16:40:52 2016		Last change: Thu Dec  8 13:58:17 2016 by root via cibadmin on slot14

3 nodes and 130 resources configured

Online: [ slot14 slot5 slot7 ]

Full list of resources:

 ip-172.19.85.11	(ocf::heartbeat:IPaddr2):	Stopped
 ip-172.23.85.11	(ocf::heartbeat:IPaddr2):	Stopped
 Clone Set: haproxy-clone [haproxy]
     Stopped: [ slot14 slot5 slot7 ]
 Master/Slave Set: galera-master [galera]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: memcached-clone [memcached]
     Stopped: [ slot14 slot5 slot7 ]
 ip-172.19.85.12	(ocf::heartbeat:IPaddr2):	Stopped
 ip-172.20.85.11	(ocf::heartbeat:IPaddr2):	Stopped
 ip-172.23.85.86	(ocf::heartbeat:IPaddr2):	Stopped
 Clone Set: rabbitmq-clone [rabbitmq]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-core-clone [openstack-core]
     Stopped: [ slot14 slot5 slot7 ]
 Master/Slave Set: redis-master [redis]
     Stopped: [ slot14 slot5 slot7 ]
 ip-172.21.85.11	(ocf::heartbeat:IPaddr2):	Stopped
 Clone Set: mongod-clone [mongod]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-aodh-evaluator-clone [openstack-aodh-evaluator]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-scheduler-clone [openstack-nova-scheduler]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-l3-agent-clone [neutron-l3-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-netns-cleanup-clone [neutron-netns-cleanup]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-ovs-cleanup-clone [neutron-ovs-cleanup]
     Stopped: [ slot14 slot5 slot7 ]
 openstack-cinder-volume	(systemd:openstack-cinder-volume):	Stopped
 Clone Set: openstack-heat-engine-clone [openstack-heat-engine]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-api-clone [openstack-ceilometer-api]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-aodh-listener-clone [openstack-aodh-listener]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-metadata-agent-clone [neutron-metadata-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-gnocchi-metricd-clone [openstack-gnocchi-metricd]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-aodh-notifier-clone [openstack-aodh-notifier]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-clone [openstack-heat-api]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-collector-clone [openstack-ceilometer-collector]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-glance-api-clone [openstack-glance-api]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-cinder-scheduler-clone [openstack-cinder-scheduler]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-api-clone [openstack-nova-api]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-consoleauth-clone [openstack-nova-consoleauth]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-sahara-api-clone [openstack-sahara-api]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-cloudwatch-clone [openstack-heat-api-cloudwatch]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-sahara-engine-clone [openstack-sahara-engine]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-glance-registry-clone [openstack-glance-registry]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-gnocchi-statsd-clone [openstack-gnocchi-statsd]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-notification-clone [openstack-ceilometer-notification]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-cinder-api-clone [openstack-cinder-api]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-dhcp-agent-clone [neutron-dhcp-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-openvswitch-agent-clone [neutron-openvswitch-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-novncproxy-clone [openstack-nova-novncproxy]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: delay-clone [delay]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-server-clone [neutron-server]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-central-clone [openstack-ceilometer-central]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: httpd-clone [httpd]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-cfn-clone [openstack-heat-api-cfn]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-conductor-clone [openstack-nova-conductor]
     Stopped: [ slot14 slot5 slot7 ]
 ipmi-slot5	(stonith:fence_ipmilan):	Stopped
 ipmi-slot7	(stonith:fence_ipmilan):	Stopped
 ipmi-slot14	(stonith:fence_ipmilan):	Stopped

Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled
[root@slot5 nova]# pcs status 
Cluster name: tripleo_cluster
Stack: corosync
Current DC: slot7 (version 1.1.15-11.el7-e174ec8) - partition with quorum
Last updated: Thu Dec  8 16:41:39 2016		Last change: Thu Dec  8 13:58:17 2016 by root via cibadmin on slot14

3 nodes and 130 resources configured

Online: [ slot14 slot5 slot7 ]

Full list of resources:

 ip-172.19.85.11	(ocf::heartbeat:IPaddr2):	Started slot14
 ip-172.23.85.11	(ocf::heartbeat:IPaddr2):	Started slot5
 Clone Set: haproxy-clone [haproxy]
     Started: [ slot14 slot5 slot7 ]
 Master/Slave Set: galera-master [galera]
     Masters: [ slot14 slot5 slot7 ]
 Clone Set: memcached-clone [memcached]
     Started: [ slot14 slot5 slot7 ]
 ip-172.19.85.12	(ocf::heartbeat:IPaddr2):	Started slot7
 ip-172.20.85.11	(ocf::heartbeat:IPaddr2):	Started slot14
 ip-172.23.85.86	(ocf::heartbeat:IPaddr2):	Started slot5
 Clone Set: rabbitmq-clone [rabbitmq]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-core-clone [openstack-core]
     Started: [ slot14 slot5 slot7 ]
 Master/Slave Set: redis-master [redis]
     Slaves: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 ip-172.21.85.11	(ocf::heartbeat:IPaddr2):	Started slot7
 Clone Set: mongod-clone [mongod]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-aodh-evaluator-clone [openstack-aodh-evaluator]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-scheduler-clone [openstack-nova-scheduler]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-l3-agent-clone [neutron-l3-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-netns-cleanup-clone [neutron-netns-cleanup]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-ovs-cleanup-clone [neutron-ovs-cleanup]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 openstack-cinder-volume	(systemd:openstack-cinder-volume):	Stopped
 Clone Set: openstack-heat-engine-clone [openstack-heat-engine]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-api-clone [openstack-ceilometer-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-aodh-listener-clone [openstack-aodh-listener]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-metadata-agent-clone [neutron-metadata-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-gnocchi-metricd-clone [openstack-gnocchi-metricd]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-aodh-notifier-clone [openstack-aodh-notifier]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-clone [openstack-heat-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-collector-clone [openstack-ceilometer-collector]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-glance-api-clone [openstack-glance-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-cinder-scheduler-clone [openstack-cinder-scheduler]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-api-clone [openstack-nova-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-consoleauth-clone [openstack-nova-consoleauth]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-sahara-api-clone [openstack-sahara-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-heat-api-cloudwatch-clone [openstack-heat-api-cloudwatch]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-sahara-engine-clone [openstack-sahara-engine]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-glance-registry-clone [openstack-glance-registry]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-gnocchi-statsd-clone [openstack-gnocchi-statsd]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-notification-clone [openstack-ceilometer-notification]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-cinder-api-clone [openstack-cinder-api]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-dhcp-agent-clone [neutron-dhcp-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-openvswitch-agent-clone [neutron-openvswitch-agent]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-novncproxy-clone [openstack-nova-novncproxy]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: delay-clone [delay]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: neutron-server-clone [neutron-server]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-central-clone [openstack-ceilometer-central]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: httpd-clone [httpd]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-heat-api-cfn-clone [openstack-heat-api-cfn]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 Clone Set: openstack-nova-conductor-clone [openstack-nova-conductor]
     Started: [ slot14 slot7 ]
     Stopped: [ slot5 ]
 ipmi-slot5	(stonith:fence_ipmilan):	Started slot7
 ipmi-slot7	(stonith:fence_ipmilan):	Started slot5
 ipmi-slot14	(stonith:fence_ipmilan):	Stopped

Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled
[root@slot5 nova]# pcs status | grep cinder -C 3 
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-ovs-cleanup-clone [neutron-ovs-cleanup]
     Started: [ slot14 slot5 slot7 ]
 openstack-cinder-volume	(systemd:openstack-cinder-volume):	Started slot14
 Clone Set: openstack-heat-engine-clone [openstack-heat-engine]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-api-clone [openstack-ceilometer-api]
--
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-glance-api-clone [openstack-glance-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-cinder-scheduler-clone [openstack-cinder-scheduler]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-api-clone [openstack-nova-api]
     Started: [ slot14 slot5 slot7 ]
--
     Stopped: [ slot5 ]
 Clone Set: openstack-ceilometer-notification-clone [openstack-ceilometer-notification]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-cinder-api-clone [openstack-cinder-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-dhcp-agent-clone [neutron-dhcp-agent]
     Started: [ slot14 slot5 slot7 ]
[root@slot5 nova]# cinder create 2 
+--------------------------------+--------------------------------------+
|            Property            |                Value                 |
+--------------------------------+--------------------------------------+
|          attachments           |                  []                  |
|       availability_zone        |                 nova                 |
|            bootable            |                false                 |
|      consistencygroup_id       |                 None                 |
|           created_at           |      2016-12-08T15:43:22.000000      |
|          description           |                 None                 |
|           encrypted            |                False                 |
|               id               | 7cf325e7-1166-44f2-8ba8-6f7cdf9d2e5c |
|            metadata            |                  {}                  |
|        migration_status        |                 None                 |
|          multiattach           |                False                 |
|              name              |                 None                 |
|     os-vol-host-attr:host      |    hostgroup@ipsan#StoragePool001    |
| os-vol-mig-status-attr:migstat |                 None                 |
| os-vol-mig-status-attr:name_id |                 None                 |
|  os-vol-tenant-attr:tenant_id  |   fe50aad050494868a67d8d05d5313869   |
|       replication_status       |               disabled               |
|              size              |                  2                   |
|          snapshot_id           |                 None                 |
|          source_volid          |                 None                 |
|             status             |              available               |
|           updated_at           |      2016-12-08T15:43:23.000000      |
|            user_id             |   3c446ce467ce437bbe12b224adac4a27   |
|          volume_type           |                 None                 |
+--------------------------------+--------------------------------------+
[root@slot5 nova]# cinder list 
+--------------------------------------+-----------+----------------------------------------------------+------+-------------+----------+--------------------------------------+
|                  ID                  |   Status  |                        Name                        | Size | Volume Type | Bootable |             Attached to              |
+--------------------------------------+-----------+----------------------------------------------------+------+-------------+----------+--------------------------------------+
| 1a31d1a3-3247-45d8-8dfd-524f7e421151 |   error   |                        epc                         | 110  |      -      |  false   |                                      |
| 20e02571-ea6b-4dac-b007-d3cf110e6851 |   error   |                       test3                        |  6   |   ipsan001  |  false   |                                      |
| 22116522-6bd1-4c1d-9e7e-a43526b0e624 | available |                    test1ForCSM                     | 110  |      -      |   true   |                                      |
| 24d5fccb-e6fc-4762-a31f-3591b6aa61fd |   in-use  |                     testU2000                      | 110  |      -      |   true   | 1b6711e2-0362-44fe-a75a-9f70f6929cc0 |
| 2ab73c7c-d7cb-4d2b-b03a-3fe03ba684ab |   in-use  |                       test4                        | 100  |   ipsan001  |   true   | 453ca463-662d-4806-99e4-f8e844b5227a |
| 57a20474-3c49-4233-abdf-c900c6ad1c99 |   in-use  |                      CSM_boot                      | 110  |      -      |   true   | f634ebc8-0276-42ce-9414-997e3a2c6f44 |
| 730b4199-2915-42fe-aecc-6b59785e29f9 | available |                      testSRV                       | 100  |      -      |   true   |                                      |
| 769fd500-c216-4898-8b1f-f48614ad4836 | available |                         -                          | 512  |      -      |  false   |                                      |
| 7cf325e7-1166-44f2-8ba8-6f7cdf9d2e5c | available |                         -                          |  2   |      -      |  false   |                                      |
| 9511904e-1918-456c-b38a-350960782ede | available |                         -                          |  10  |      -      |  false   |                                      |
| be916763-a953-4f35-8dd6-b2694062cc57 |   error   | Huawei_SuSE_V1R1_OpenStack_V200R002C60SPC200_vOSMU |  6   |   ipsan001  |  false   |                                      |
| c1034488-07e3-4bf1-923e-e56de8faa226 |   in-use  |                       CSM_2                        | 512  |      -      |  false   | f634ebc8-0276-42ce-9414-997e3a2c6f44 |
| dcf10a0f-66c1-431a-a4a2-24f236b5618e | available |                       test2                        | 110  |      -      |   true   |                                      |
+--------------------------------------+-----------+----------------------------------------------------+------+-------------+----------+--------------------------------------+
[root@slot5 nova]# nova list 
+--------------------------------------+-----------------------+--------+------------+-------------+-----------------------------------------------------------------------------------+
| ID                                   | Name                  | Status | Task State | Power State | Networks                                                                          |
+--------------------------------------+-----------------------+--------+------------+-------------+-----------------------------------------------------------------------------------+
| f634ebc8-0276-42ce-9414-997e3a2c6f44 | CSM                   | ACTIVE | -          | Running     | OSS_Self_Maintenance=192.168.22.4; OSS_API=192.168.0.1; OSS_Service=192.168.22.16 |
| 140272c4-c7b3-411d-aa25-08a839f90ab5 | m5                    | ERROR  | -          | NOSTATE     |                                                                                   |
| 453ca463-662d-4806-99e4-f8e844b5227a | mjj1                  | ACTIVE | -          | Running     | OSS_Service=192.168.22.31                                                         |
| 3832fab4-7b3a-4e3c-b106-0fbf0c325d75 | my1                   | ERROR  | -          | NOSTATE     |                                                                                   |
| 15820e49-71ed-481b-a006-43d7a71e8746 | test                  | ERROR  | -          | NOSTATE     |                                                                                   |
| 7d8f2a91-9354-42c5-b8b5-5040005c192a | test                  | ERROR  | -          | NOSTATE     |                                                                                   |
| 951a58ce-e0e0-4d3c-9fb7-5a4abd0aa8f4 | test-instance-sriov   | ACTIVE | -          | Running     | sriov3=192.168.13.8                                                               |
| 3f96055b-ffd6-4975-975a-785702c4722e | test-instance-sriov-1 | ACTIVE | -          | Running     | sriov3=192.168.13.9                                                               |
| 1b6711e2-0362-44fe-a75a-9f70f6929cc0 | zl                    | ACTIVE | -          | Running     | OSS_Self_Maintenance=192.168.22.32                                                |
+--------------------------------------+-----------------------+--------+------------+-------------+-----------------------------------------------------------------------------------+
[root@slot5 nova]# 



```
