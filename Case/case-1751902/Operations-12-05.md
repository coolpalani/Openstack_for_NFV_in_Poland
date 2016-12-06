# neutron service failed to start 

[Redhat Case]<https://access.redhat.com/support/cases/#/case/01751902>

## Symptom

```sh 

[root@slot5 haproxy]# pcs status 
Cluster name: tripleo_cluster
Stack: corosync
Current DC: slot5 (version 1.1.15-11.el7-e174ec8) - partition with quorum
Last updated: Mon Dec  5 10:21:14 2016		Last change: Sat Dec  3 04:24:47 2016 by root via cibadmin on slot5

3 nodes and 127 resources configured

Online: [ slot14 slot5 slot7 ]

Full list of resources:

 ip-172.19.85.11	(ocf::heartbeat:IPaddr2):	Started slot5
 ip-172.23.85.11	(ocf::heartbeat:IPaddr2):	Started slot7
 Clone Set: haproxy-clone [haproxy]
     Started: [ slot14 slot5 slot7 ]
 Master/Slave Set: galera-master [galera]
     Masters: [ slot14 slot5 slot7 ]
 Clone Set: memcached-clone [memcached]
     Started: [ slot14 slot5 slot7 ]
 ip-172.19.85.12	(ocf::heartbeat:IPaddr2):	Started slot5
 ip-172.20.85.11	(ocf::heartbeat:IPaddr2):	Started slot7
 ip-172.23.85.86	(ocf::heartbeat:IPaddr2):	Started slot5
 Clone Set: rabbitmq-clone [rabbitmq]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-core-clone [openstack-core]
     Started: [ slot14 slot5 slot7 ]
 Master/Slave Set: redis-master [redis]
     Masters: [ slot7 ]
     Slaves: [ slot14 slot5 ]
 ip-172.21.85.11	(ocf::heartbeat:IPaddr2):	Started slot7
 Clone Set: mongod-clone [mongod]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-aodh-evaluator-clone [openstack-aodh-evaluator]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-scheduler-clone [openstack-nova-scheduler]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-l3-agent-clone [neutron-l3-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-netns-cleanup-clone [neutron-netns-cleanup]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-ovs-cleanup-clone [neutron-ovs-cleanup]
     Started: [ slot14 slot5 slot7 ]
 openstack-cinder-volume	(systemd:openstack-cinder-volume):	Started slot14
 Clone Set: openstack-heat-engine-clone [openstack-heat-engine]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-api-clone [openstack-ceilometer-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-aodh-listener-clone [openstack-aodh-listener]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-metadata-agent-clone [neutron-metadata-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-gnocchi-metricd-clone [openstack-gnocchi-metricd]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-aodh-notifier-clone [openstack-aodh-notifier]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-clone [openstack-heat-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-collector-clone [openstack-ceilometer-collector]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-glance-api-clone [openstack-glance-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-cinder-scheduler-clone [openstack-cinder-scheduler]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-api-clone [openstack-nova-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-consoleauth-clone [openstack-nova-consoleauth]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-sahara-api-clone [openstack-sahara-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-cloudwatch-clone [openstack-heat-api-cloudwatch]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-sahara-engine-clone [openstack-sahara-engine]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-glance-registry-clone [openstack-glance-registry]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-gnocchi-statsd-clone [openstack-gnocchi-statsd]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-notification-clone [openstack-ceilometer-notification]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-cinder-api-clone [openstack-cinder-api]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-dhcp-agent-clone [neutron-dhcp-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: neutron-openvswitch-agent-clone [neutron-openvswitch-agent]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-novncproxy-clone [openstack-nova-novncproxy]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: delay-clone [delay]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-server-clone [neutron-server]
     Stopped: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-central-clone [openstack-ceilometer-central]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: httpd-clone [httpd]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-cfn-clone [openstack-heat-api-cfn]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-conductor-clone [openstack-nova-conductor]
     Started: [ slot14 slot5 slot7 ]

Failed Actions:
* neutron-server_start_0 on slot7 'not running' (7): call=271, status=complete, exitreason='none',
    last-rc-change='Mon Dec  5 10:06:22 2016', queued=0ms, exec=34441ms
* neutron-server_start_0 on slot5 'not running' (7): call=270, status=complete, exitreason='none',
    last-rc-change='Mon Dec  5 10:06:22 2016', queued=0ms, exec=34433ms
* neutron-server_start_0 on slot14 'not running' (7): call=264, status=complete, exitreason='none',
    last-rc-change='Mon Dec  5 10:06:22 2016', queued=0ms, exec=34441ms


Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled
[root@slot5 haproxy]# 

in the /var/log/neutron/
2016-12-05 10:06:25.729 26587 WARNING keystonemiddleware.auth_token [-] Use of the auth_admin_prefix, auth_host, auth_port, auth_protocol, identity_uri, admin_token, admin_user, admin_password, and admin_tenant_name configuration options was deprecated in the Mitaka release in favor of an auth_plugin and its related options. This class may be removed in a future release.
2016-12-05 10:06:55.831 26587 ERROR neutron.service [-] Unrecoverable error: please check log for details.
2016-12-05 10:06:55.831 26587 ERROR neutron.service Traceback (most recent call last):
2016-12-05 10:06:55.831 26587 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 107, in serve_wsgi
2016-12-05 10:06:55.831 26587 ERROR neutron.service     service.start()
2016-12-05 10:06:55.831 26587 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 80, in start
2016-12-05 10:06:55.831 26587 ERROR neutron.service     self.wsgi_app = _run_wsgi(self.app_name)
2016-12-05 10:06:55.831 26587 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 312, in _run_wsgi
2016-12-05 10:06:55.831 26587 ERROR neutron.service     return run_wsgi_app(app)
2016-12-05 10:06:55.831 26587 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 318, in run_wsgi_app
2016-12-05 10:06:55.831 26587 ERROR neutron.service     workers=_get_api_workers())
2016-12-05 10:06:55.831 26587 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/wsgi.py", line 189, in start
2016-12-05 10:06:55.831 26587 ERROR neutron.service     backlog=backlog)
2016-12-05 10:06:55.831 26587 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/wsgi.py", line 168, in _get_socket
2016-12-05 10:06:55.831 26587 ERROR neutron.service     'time': CONF.retry_until_window})
2016-12-05 10:06:55.831 26587 ERROR neutron.service RuntimeError: Could not bind to 172.19.85.19:9696 after trying for 30 seconds
2016-12-05 10:06:55.831 26587 ERROR neutron.service

[root@slot5 neutron]# ip r
default via 172.23.85.1 dev vlan4004 
169.254.169.254 via 172.23.85.106 dev br-ex 
172.19.85.0/24 dev vlan3090  proto kernel  scope link  src 172.19.85.19 
172.20.85.0/24 dev vlan3091  proto kernel  scope link  src 172.20.85.18 
172.21.85.0/24 dev vlan3093  proto kernel  scope link  src 172.21.85.13 
172.22.85.0/24 dev vlan3094  proto kernel  scope link  src 172.22.85.17 
172.23.85.0/26 dev vlan4004  proto kernel  scope link  src 172.23.85.13 
172.23.85.64/26 dev br-ex  proto kernel  scope link  src 172.23.85.92 


[root@slot5 log]# pcs resource cleanup 
Broadcast message from systemd-journald@slot5.vepc.mnc066.mcc260.3gppnetwork.org (Mon 2016-12-05 11:00:43 CET):

haproxy[5732]: proxy cinder has no server available!


Broadcast message from systemd-journald@slot5.vepc.mnc066.mcc260.3gppnetwork.org (Mon 2016-12-05 11:00:44 CET):

haproxy[5732]: proxy nova_metadata has no server available!


Broadcast message from systemd-journald@slot5.vepc.mnc066.mcc260.3gppnetwork.org (Mon 2016-12-05 11:00:44 CET):

haproxy[5732]: proxy nova_osapi has no server available!


Broadcast message from systemd-journald@slot5.vepc.mnc066.mcc260.3gppnetwork.org (Mon 2016-12-05 11:00:46 CET):

haproxy[5732]: proxy nova_novncproxy has no server available!


Broadcast message from systemd-journald@slot5.vepc.mnc066.mcc260.3gppnetwork.org (Mon 2016-12-05 11:01:23 CET):

haproxy[5732]: proxy ceilometer has no server available!



Error: Cleaning up all resources on all nodes will execute more than 100 operations in the cluster, which may negatively impact the responsiveness of the cluster. Consider specifying resource and/or node, use --force to override


```
## Trouble-shooting
> 2016-12-05 10:06:55.831 26587 ERROR neutron.service RuntimeError: Could not bind to 172.19.85.19:9696 after trying for 30 seconds
It is caused by manually run "systemctl restart neutron-server" when the resource still be managed by cluster.


## Solution

1. The right way of restart cluster is :
```sh
pcs cluster stop --all 
pcs cluster start --all 

```

2. How will you trouble-shooting when one service is stopped?  

1) unmanage the service in pcs

```sh 
pcs resource unmanage neutron-server
```

2) try restarting the service with systemd if the resource is systemd resource
```sh 
systemctl restart neutron-server
```

3) if I am able to start the service out of pcs, its either a pcs itself(timeout) or other problem which was already gone when doing the start.

4) manage back the service to the pcs
```sh 
pcs resource manage neutron-server 
```

5) and testing the restart again seeing if I can reproduce.

using this you can recover most of the service, but galera. That is special one.

is database, and you need to bootstrap it.  but in general galera issue would be:
```sh
pcs resource disable galera;
crm_attribute -N overcloud-controller-2 -l reboot --name galera-bootstrap -v true
pcs resource unmanage galera
crm_resource --force-promote -r galera -V
pcs resource cleanup galera
pcs resource enable galera
pcs resource manage galera
```

if you select the overcloud-controller-2 to be the main node which holds the last data.




