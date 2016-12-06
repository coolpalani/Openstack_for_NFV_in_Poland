# Undercloud


```sh 

[root@director osp9_media]# ip r
default via 172.23.85.1 dev enp130s0f0 
169.254.0.0/16 dev enp129s0f0  scope link  metric 1006 
169.254.0.0/16 dev enp130s0f0  scope link  metric 1008 
169.254.0.0/16 dev br-ctlplane  scope link  metric 1013 
172.23.85.0/26 dev enp130s0f0  proto kernel  scope link  src 172.23.85.35 
172.23.85.64/26 dev br-ctlplane  proto kernel  scope link  src 172.23.85.106 
[root@director osp9_media]# ovs-vsctl show 
90898546-cc35-420b-9e0f-1f07469a0726
    Bridge br-ctlplane
        fail_mode: secure
        Port phy-br-ctlplane
            Interface phy-br-ctlplane
                type: patch
                options: {peer=int-br-ctlplane}
        Port "enp129s0f0"
            Interface "enp129s0f0"
        Port br-ctlplane
            Interface br-ctlplane
                type: internal
    Bridge br-int
        fail_mode: secure
        Port int-br-ctlplane
            Interface int-br-ctlplane
                type: patch
                options: {peer=phy-br-ctlplane}
        Port "tap82122d79-c3"
            tag: 1
            Interface "tap82122d79-c3"
                type: internal
        Port br-int
            Interface br-int
                type: internal
    ovs_version: "2.4.0"
[root@director osp9_media]# ovs-ofctl dump-flows br-int
NXST_FLOW reply (xid=0x4):
 cookie=0x8de92812fa9c6fee, duration=182897.530s, table=0, n_packets=10024, n_bytes=748463, idle_age=30, hard_age=65534, priority=3,in_port=1,vlan_tci=0x0000 actions=mod_vlan_vid:1,NORMAL
 cookie=0x8de92812fa9c6fee, duration=182901.680s, table=0, n_packets=0, n_bytes=0, idle_age=65534, hard_age=65534, priority=2,in_port=1 actions=drop
 cookie=0x8de92812fa9c6fee, duration=182901.776s, table=0, n_packets=2219, n_bytes=250140, idle_age=65534, hard_age=65534, priority=0 actions=NORMAL
 cookie=0x8de92812fa9c6fee, duration=182901.771s, table=23, n_packets=0, n_bytes=0, idle_age=65534, hard_age=65534, priority=0 actions=drop
 cookie=0x8de92812fa9c6fee, duration=182901.766s, table=24, n_packets=0, n_bytes=0, idle_age=65534, hard_age=65534, priority=0 actions=drop
[root@director osp9_media]# ovs-ofctl dump-flows br-ctlplane
NXST_FLOW reply (xid=0x4):
 cookie=0x9f056a7a247b4b9c, duration=182903.267s, table=0, n_packets=2219, n_bytes=250140, idle_age=65534, hard_age=65534, priority=4,in_port=2,dl_vlan=1 actions=strip_vlan,NORMAL
 cookie=0x9f056a7a247b4b9c, duration=182907.407s, table=0, n_packets=0, n_bytes=0, idle_age=65534, hard_age=65534, priority=2,in_port=2 actions=drop
 cookie=0x9f056a7a247b4b9c, duration=182907.447s, table=0, n_packets=18061708, n_bytes=85529824273, idle_age=1, hard_age=65534, priority=0 actions=NORMAL

```

# Overcloud 

## Network configuration 

### Network on controller node 


```sh
[root@slot5 network-scripts]# ovs-vsctl show 
60a6ce17-3a4e-4dca-af85-e0504cfd5bd0
    Bridge br-int
        fail_mode: secure
        Port "int-br-phynet0"
            Interface "int-br-phynet0"
                type: patch
                options: {peer="phy-br-phynet0"}
        Port br-int
            Interface br-int
                type: internal
        Port int-br-ex
            Interface int-br-ex
                type: patch
                options: {peer=phy-br-ex}
        Port "tap4fac51b3-0a"
            tag: 1
            Interface "tap4fac51b3-0a"
                type: internal
    Bridge "br-phynet0"
        fail_mode: secure
        Port "phy-br-phynet0"
            Interface "phy-br-phynet0"
                type: patch
                options: {peer="int-br-phynet0"}
        Port "br-phynet0"
            Interface "br-phynet0"
                type: internal
        Port "enp4s0f1"
            Interface "enp4s0f1"
    Bridge br-ex
        fail_mode: secure
        Port br-ex
            Interface br-ex
                type: internal
        Port "vlan3093"
            tag: 3093
            Interface "vlan3093"
                type: internal
        Port "vlan3090"
            tag: 3090
            Interface "vlan3090"
                type: internal
        Port phy-br-ex
            Interface phy-br-ex
                type: patch
                options: {peer=int-br-ex}
        Port "vlan3091"
            tag: 3091
            Interface "vlan3091"
                type: internal
        Port "vlan3094"
            tag: 3094
            Interface "vlan3094"
                type: internal
        Port "enp4s0f0"
            Interface "enp4s0f0"
        Port "vlan4004"
            tag: 4004
            Interface "vlan4004"
                type: internal
    ovs_version: "2.5.0"

```
### Network on compute node 

```sh
[root@slot1 ~]# ovs-vsctl show 
76c6f64a-5b79-4dd1-a25f-62bca547cd22
    Bridge br-int
        fail_mode: secure
        Port "int-br-phynet0"
            Interface "int-br-phynet0"
                type: patch
                options: {peer="phy-br-phynet0"}
        Port int-br-ex
            Interface int-br-ex
                type: patch
                options: {peer=phy-br-ex}
        Port br-int
            Interface br-int
                type: internal
    Bridge "br-phynet0"
        fail_mode: secure
        Port "phy-br-phynet0"
            Interface "phy-br-phynet0"
                type: patch
                options: {peer="int-br-phynet0"}
        Port "enp4s0f1"
            Interface "enp4s0f1"
        Port "br-phynet0"
            Interface "br-phynet0"
                type: internal
    Bridge br-ex
        fail_mode: secure
        Port "vlan3094"
            tag: 3094
            Interface "vlan3094"
                type: internal
        Port "enp4s0f0"
            Interface "enp4s0f0"
        Port "vlan3090"
            tag: 3090
            Interface "vlan3090"
                type: internal
        Port phy-br-ex
            Interface phy-br-ex
                type: patch
                options: {peer=int-br-ex}
        Port "vlan3091"
            tag: 3091
            Interface "vlan3091"
                type: internal
        Port br-ex
            Interface br-ex
                type: internal
    ovs_version: "2.5.0"



```

## Hostname 


### Undercloud

We can't access overcloud via short the overcloud nodes shortname 

[root@director task1]# nova list
+--------------------------------------+--------+--------+------------+-------------+------------------------+
| ID                                   | Name   | Status | Task State | Power State | Networks               |
+--------------------------------------+--------+--------+------------+-------------+------------------------+
| c8a9fdaa-116e-480b-9185-0052a645954b | slot1  | ACTIVE | -          | Running     | ctlplane=172.23.85.99  |
| 9b32a203-25c2-46a9-9a03-68ce2ac22ff6 | slot10 | ACTIVE | -          | Running     | ctlplane=172.23.85.101 |
| be778eb2-7017-4e4d-b7ec-9158f5f5d4d7 | slot11 | ACTIVE | -          | Running     | ctlplane=172.23.85.89  |
| db97b23f-3ecc-4da1-b9e3-87c0beb6b99e | slot12 | ACTIVE | -          | Running     | ctlplane=172.23.85.88  |
| 8d3dee27-c6e9-45e9-8381-90530a5dff77 | slot13 | ACTIVE | -          | Running     | ctlplane=172.23.85.96  |
| 8fc00da4-9b9b-453f-a934-72f49f9f28b9 | slot14 | ACTIVE | -          | Running     | ctlplane=172.23.85.103 |
| a040183b-e0e6-4cd2-b59f-9ac52ae39359 | slot2  | ACTIVE | -          | Running     | ctlplane=172.23.85.98  |
| b8977eda-8823-4229-aaf4-3461ea669399 | slot3  | ACTIVE | -          | Running     | ctlplane=172.23.85.94  |
| 8f83b411-b3f1-4984-8d9c-049dc02f077b | slot4  | ACTIVE | -          | Running     | ctlplane=172.23.85.102 |
| 9b39fa36-c0ee-4462-8164-3434d93a24dd | slot5  | ACTIVE | -          | Running     | ctlplane=172.23.85.92  |
| 99f5f3d7-798d-443e-b315-c0f34d24e8b5 | slot7  | ACTIVE | -          | Running     | ctlplane=172.23.85.90  |
| 784ebe51-cf8f-4554-b9c1-75d4cfde6e3d | slot9  | ACTIVE | -          | Running     | ctlplane=172.23.85.91  |
+--------------------------------------+--------+--------+------------+-------------+------------------------+

at that time , `ping slot1` is not ok. 

### Overcloud

we can use short hostname on overcloud nodes, because the hostname after installation.  

```sh
[root@slot1 ~]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

# HEAT_HOSTS_START - Do not edit manually within this section!
172.19.85.21 slot1.vepc.mnc066.mcc260.3gppnetwork.org slot1
172.23.85.99 slot1-external
172.19.85.21 slot1-internalapi
172.20.85.20 slot1-storage
172.23.85.99 slot1-storagemgmt
172.22.85.19 slot1-tenant
172.23.85.99 slot1-management

172.19.85.20 slot2.vepc.mnc066.mcc260.3gppnetwork.org slot2
172.23.85.98 slot2-external
172.19.85.20 slot2-internalapi
172.20.85.19 slot2-storage
172.23.85.98 slot2-storagemgmt
172.22.85.18 slot2-tenant
172.23.85.98 slot2-management

172.19.85.16 slot3.vepc.mnc066.mcc260.3gppnetwork.org slot3
172.23.85.94 slot3-external
172.19.85.16 slot3-internalapi
172.20.85.17 slot3-storage
172.23.85.94 slot3-storagemgmt
172.22.85.16 slot3-tenant
172.23.85.94 slot3-management

172.19.85.23 slot4.vepc.mnc066.mcc260.3gppnetwork.org slot4
172.23.85.102 slot4-external
172.19.85.23 slot4-internalapi
172.20.85.22 slot4-storage
172.23.85.102 slot4-storagemgmt
172.22.85.21 slot4-tenant
172.23.85.102 slot4-management

172.19.85.18 slot9.vepc.mnc066.mcc260.3gppnetwork.org slot9
172.23.85.91 slot9-external
172.19.85.18 slot9-internalapi
172.20.85.16 slot9-storage
172.23.85.91 slot9-storagemgmt
172.22.85.14 slot9-tenant
172.23.85.91 slot9-management

172.19.85.22 slot10.vepc.mnc066.mcc260.3gppnetwork.org slot10
172.23.85.101 slot10-external
172.19.85.22 slot10-internalapi
172.20.85.21 slot10-storage
172.23.85.101 slot10-storagemgmt
172.22.85.20 slot10-tenant
172.23.85.101 slot10-management

172.19.85.13 slot11.vepc.mnc066.mcc260.3gppnetwork.org slot11
172.23.85.89 slot11-external
172.19.85.13 slot11-internalapi
172.20.85.12 slot11-storage
172.23.85.89 slot11-storagemgmt
172.22.85.11 slot11-tenant
172.23.85.89 slot11-management

172.19.85.15 slot12.vepc.mnc066.mcc260.3gppnetwork.org slot12
172.23.85.88 slot12-external
172.19.85.15 slot12-internalapi
172.20.85.14 slot12-storage
172.23.85.88 slot12-storagemgmt
172.22.85.12 slot12-tenant
172.23.85.88 slot12-management

172.19.85.14 slot13.vepc.mnc066.mcc260.3gppnetwork.org slot13
172.23.85.96 slot13-external
172.19.85.14 slot13-internalapi
172.20.85.13 slot13-storage
172.23.85.96 slot13-storagemgmt
172.22.85.13 slot13-tenant
172.23.85.96 slot13-management

172.19.85.19 slot5.vepc.mnc066.mcc260.3gppnetwork.org slot5
172.23.85.13 slot5-external
172.19.85.19 slot5-internalapi
172.20.85.18 slot5-storage
172.21.85.13 slot5-storagemgmt
172.22.85.17 slot5-tenant
172.23.85.92 slot5-management

172.19.85.17 slot7.vepc.mnc066.mcc260.3gppnetwork.org slot7
172.23.85.12 slot7-external
172.19.85.17 slot7-internalapi
172.20.85.15 slot7-storage
172.21.85.12 slot7-storagemgmt
172.22.85.15 slot7-tenant
172.23.85.90 slot7-management

172.19.85.24 slot14.vepc.mnc066.mcc260.3gppnetwork.org slot14
172.23.85.14 slot14-external
172.19.85.24 slot14-internalapi
172.20.85.23 slot14-storage
172.21.85.14 slot14-storagemgmt
172.22.85.22 slot14-tenant
172.23.85.103 slot14-management
# HEAT_HOSTS_END



```
## Cluster 

```bash 
[root@slot5 cinder]# pcs status 
Cluster name: tripleo_cluster
Stack: corosync
Current DC: slot14 (version 1.1.15-11.el7-e174ec8) - partition with quorum
Last updated: Mon Dec  5 14:44:02 2016		Last change: Mon Dec  5 13:59:18 2016 by root via cibadmin on slot7

3 nodes and 127 resources configured

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
     Masters: [ slot5 ]
     Slaves: [ slot14 slot7 ]
 ip-172.21.85.11	(ocf::heartbeat:IPaddr2):	Started slot7
 Clone Set: mongod-clone [mongod]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-aodh-evaluator-clone [openstack-aodh-evaluator]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-scheduler-clone [openstack-nova-scheduler]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-l3-agent-clone [neutron-l3-agent]
     Started: [ slot14 slot5 slot7 ]
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
     Started: [ slot14 slot5 slot7 ]
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
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-openvswitch-agent-clone [neutron-openvswitch-agent]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-novncproxy-clone [openstack-nova-novncproxy]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: delay-clone [delay]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: neutron-server-clone [neutron-server]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-ceilometer-central-clone [openstack-ceilometer-central]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: httpd-clone [httpd]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-heat-api-cfn-clone [openstack-heat-api-cfn]
     Started: [ slot14 slot5 slot7 ]
 Clone Set: openstack-nova-conductor-clone [openstack-nova-conductor]
     Started: [ slot14 slot5 slot7 ]

Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled
[root@slot5 cinder]# 



[root@slot5 cinder]# pcs property show
Cluster Properties:
 cluster-infrastructure: corosync
 cluster-name: tripleo_cluster
 dc-version: 1.1.15-11.el7-e174ec8
 have-watchdog: false
 last-lrm-refresh: 1480940797
 maintenance-mode: false
 redis_REPL_INFO: slot5
 stonith-enabled: false
Node Attributes:
 slot14: rmq-node-attr-last-known-rabbitmq=rabbit@slot14
 slot5: rmq-node-attr-last-known-rabbitmq=rabbit@slot5
 slot7: rmq-node-attr-last-known-rabbitmq=rabbit@slot7

[root@slot5 cinder]# pcs constraint show 
Location Constraints:
Ordering Constraints:
  start ip-172.19.85.11 then start haproxy-clone (kind:Optional)
  start ip-172.23.85.86 then start haproxy-clone (kind:Optional)
  start ip-172.23.85.11 then start haproxy-clone (kind:Optional)
  start ip-172.21.85.11 then start haproxy-clone (kind:Optional)
  start ip-172.19.85.12 then start haproxy-clone (kind:Optional)
  start ip-172.20.85.11 then start haproxy-clone (kind:Optional)
  start memcached-clone then start openstack-core-clone (kind:Mandatory)
  start rabbitmq-clone then start openstack-core-clone (kind:Mandatory)
  promote galera-master then start openstack-core-clone (kind:Mandatory)
  start openstack-core-clone then start openstack-gnocchi-metricd-clone (kind:Mandatory)
  start neutron-l3-agent-clone then start neutron-metadata-agent-clone (kind:Mandatory)
  start openstack-core-clone then start openstack-nova-consoleauth-clone (kind:Mandatory)
  start haproxy-clone then start openstack-core-clone (kind:Mandatory)
  start neutron-ovs-cleanup-clone then start neutron-netns-cleanup-clone (kind:Mandatory)
  start openstack-ceilometer-notification-clone then start openstack-heat-api-clone (kind:Mandatory)
  start openstack-aodh-evaluator-clone then start openstack-aodh-listener-clone (kind:Mandatory)
  start openstack-core-clone then start openstack-sahara-api-clone (kind:Mandatory)
  start openstack-heat-api-cloudwatch-clone then start openstack-heat-engine-clone (kind:Mandatory)
  start openstack-core-clone then start openstack-glance-registry-clone (kind:Mandatory)
  start openstack-glance-registry-clone then start openstack-glance-api-clone (kind:Mandatory)
  start openstack-ceilometer-collector-clone then start openstack-ceilometer-api-clone (kind:Mandatory)
  start openstack-cinder-scheduler-clone then start openstack-cinder-volume (kind:Mandatory)
  start openstack-cinder-api-clone then start openstack-cinder-scheduler-clone (kind:Mandatory)
  start openstack-core-clone then start openstack-cinder-api-clone (kind:Mandatory)
  start openstack-nova-novncproxy-clone then start openstack-nova-api-clone (kind:Mandatory)
  start openstack-nova-consoleauth-clone then start openstack-nova-novncproxy-clone (kind:Mandatory)
  promote redis-master then start openstack-aodh-evaluator-clone (kind:Mandatory) (Options: require-all=false)
  start openstack-nova-api-clone then start openstack-nova-scheduler-clone (kind:Mandatory)
  start delay-clone then start openstack-aodh-evaluator-clone (kind:Mandatory)
  start openstack-ceilometer-api-clone then start delay-clone (kind:Mandatory)
  promote redis-master then start openstack-ceilometer-central-clone (kind:Mandatory) (Options: require-all=false)
  start openstack-core-clone then start openstack-ceilometer-notification-clone (kind:Mandatory)
  start openstack-core-clone then start openstack-ceilometer-central-clone (kind:Mandatory)
  start mongod-clone then start openstack-ceilometer-central-clone (kind:Mandatory)
  start openstack-ceilometer-central-clone then start openstack-ceilometer-collector-clone (kind:Mandatory)
  start openstack-sahara-api-clone then start openstack-sahara-engine-clone (kind:Mandatory)
  start openstack-core-clone then start httpd-clone (kind:Mandatory)
  start neutron-netns-cleanup-clone then start neutron-openvswitch-agent-clone (kind:Mandatory)
  start neutron-server-clone then start neutron-openvswitch-agent-clone (kind:Mandatory)
  start openstack-heat-api-clone then start openstack-heat-api-cfn-clone (kind:Mandatory)
  start openstack-heat-api-cfn-clone then start openstack-heat-api-cloudwatch-clone (kind:Mandatory)
  start openstack-core-clone then start neutron-server-clone (kind:Mandatory)
  start openstack-aodh-evaluator-clone then start openstack-aodh-notifier-clone (kind:Mandatory)
  start openstack-nova-scheduler-clone then start openstack-nova-conductor-clone (kind:Mandatory)
  start neutron-dhcp-agent-clone then start neutron-l3-agent-clone (kind:Mandatory)
  start neutron-openvswitch-agent-clone then start neutron-dhcp-agent-clone (kind:Mandatory)
  start openstack-gnocchi-metricd-clone then start openstack-gnocchi-statsd-clone (kind:Mandatory)
Colocation Constraints:
  ip-172.19.85.11 with haproxy-clone (score:INFINITY)
  ip-172.23.85.86 with haproxy-clone (score:INFINITY)
  ip-172.19.85.12 with haproxy-clone (score:INFINITY)
  ip-172.21.85.11 with haproxy-clone (score:INFINITY)
  ip-172.20.85.11 with haproxy-clone (score:INFINITY)
  ip-172.23.85.11 with haproxy-clone (score:INFINITY)
  neutron-netns-cleanup-clone with neutron-ovs-cleanup-clone (score:INFINITY)
  openstack-aodh-listener-clone with openstack-aodh-evaluator-clone (score:INFINITY)
  openstack-ceilometer-api-clone with openstack-ceilometer-collector-clone (score:INFINITY)
  openstack-heat-engine-clone with openstack-heat-api-cloudwatch-clone (score:INFINITY)
  openstack-glance-api-clone with openstack-glance-registry-clone (score:INFINITY)
  openstack-cinder-scheduler-clone with openstack-cinder-api-clone (score:INFINITY)
  openstack-cinder-volume with openstack-cinder-scheduler-clone (score:INFINITY)
  openstack-nova-api-clone with openstack-nova-novncproxy-clone (score:INFINITY)
  openstack-nova-novncproxy-clone with openstack-nova-consoleauth-clone (score:INFINITY)
  neutron-metadata-agent-clone with neutron-l3-agent-clone (score:INFINITY)
  openstack-nova-scheduler-clone with openstack-nova-api-clone (score:INFINITY)
  openstack-aodh-evaluator-clone with delay-clone (score:INFINITY)
  delay-clone with openstack-ceilometer-api-clone (score:INFINITY)
  neutron-openvswitch-agent-clone with neutron-netns-cleanup-clone (score:INFINITY)
  openstack-heat-api-cloudwatch-clone with openstack-heat-api-cfn-clone (score:INFINITY)
  openstack-heat-api-cfn-clone with openstack-heat-api-clone (score:INFINITY)
  openstack-gnocchi-statsd-clone with openstack-gnocchi-metricd-clone (score:INFINITY)
  openstack-nova-conductor-clone with openstack-nova-scheduler-clone (score:INFINITY)
  neutron-l3-agent-clone with neutron-dhcp-agent-clone (score:INFINITY)
  neutron-dhcp-agent-clone with neutron-openvswitch-agent-clone (score:INFINITY)
  openstack-aodh-notifier-clone with openstack-aodh-evaluator-clone (score:INFINITY)
Ticket Constraints:

[root@slot5 cinder]# pcs config show 
Cluster Name: tripleo_cluster
Corosync Nodes:
 slot5 slot7 slot14
Pacemaker Nodes:
 slot14 slot5 slot7

Resources:
 Resource: ip-172.19.85.11 (class=ocf provider=heartbeat type=IPaddr2)
  Attributes: ip=172.19.85.11 cidr_netmask=32
  Operations: start interval=0s timeout=20s (ip-172.19.85.11-start-interval-0s)
              stop interval=0s timeout=20s (ip-172.19.85.11-stop-interval-0s)
              monitor interval=10s timeout=20s (ip-172.19.85.11-monitor-interval-10s)
 Resource: ip-172.23.85.11 (class=ocf provider=heartbeat type=IPaddr2)
  Attributes: ip=172.23.85.11 cidr_netmask=32
  Operations: start interval=0s timeout=20s (ip-172.23.85.11-start-interval-0s)
              stop interval=0s timeout=20s (ip-172.23.85.11-stop-interval-0s)
              monitor interval=10s timeout=20s (ip-172.23.85.11-monitor-interval-10s)
 Clone: haproxy-clone
  Resource: haproxy (class=systemd type=haproxy)
   Operations: start interval=0s timeout=200s (haproxy-start-interval-0s)
               stop interval=0s timeout=200s (haproxy-stop-interval-0s)
               monitor interval=60s (haproxy-monitor-interval-60s)
 Master: galera-master
  Meta Attrs: ordered=true master-max=3 
  Resource: galera (class=ocf provider=heartbeat type=galera)
   Attributes: additional_parameters=--open-files-limit=16384 enable_creation=true wsrep_cluster_address=gcomm://slot5,slot7,slot14
   Operations: start interval=0s timeout=120 (galera-start-interval-0s)
               stop interval=0s timeout=120 (galera-stop-interval-0s)
               monitor interval=20 timeout=30 (galera-monitor-interval-20)
               monitor interval=10 role=Master timeout=30 (galera-monitor-interval-10)
               monitor interval=30 role=Slave timeout=30 (galera-monitor-interval-30)
               demote interval=0s timeout=120 (galera-demote-interval-0s)
               promote interval=0s on-fail=block timeout=300s (galera-promote-interval-0s)
 Clone: memcached-clone
  Meta Attrs: interleave=true 
  Resource: memcached (class=systemd type=memcached)
   Operations: start interval=0s timeout=200s (memcached-start-interval-0s)
               stop interval=0s timeout=200s (memcached-stop-interval-0s)
               monitor interval=60s (memcached-monitor-interval-60s)
 Resource: ip-172.19.85.12 (class=ocf provider=heartbeat type=IPaddr2)
  Attributes: ip=172.19.85.12 cidr_netmask=32
  Operations: start interval=0s timeout=20s (ip-172.19.85.12-start-interval-0s)
              stop interval=0s timeout=20s (ip-172.19.85.12-stop-interval-0s)
              monitor interval=10s timeout=20s (ip-172.19.85.12-monitor-interval-10s)
 Resource: ip-172.20.85.11 (class=ocf provider=heartbeat type=IPaddr2)
  Attributes: ip=172.20.85.11 cidr_netmask=32
  Operations: start interval=0s timeout=20s (ip-172.20.85.11-start-interval-0s)
              stop interval=0s timeout=20s (ip-172.20.85.11-stop-interval-0s)
              monitor interval=10s timeout=20s (ip-172.20.85.11-monitor-interval-10s)
 Resource: ip-172.23.85.86 (class=ocf provider=heartbeat type=IPaddr2)
  Attributes: ip=172.23.85.86 cidr_netmask=32
  Operations: start interval=0s timeout=20s (ip-172.23.85.86-start-interval-0s)
              stop interval=0s timeout=20s (ip-172.23.85.86-stop-interval-0s)
              monitor interval=10s timeout=20s (ip-172.23.85.86-monitor-interval-10s)
 Clone: rabbitmq-clone
  Meta Attrs: interleave=true ordered=true 
  Resource: rabbitmq (class=ocf provider=heartbeat type=rabbitmq-cluster)
   Attributes: set_policy="ha-all ^(?!amq\.).* {"ha-mode":"all"}"
   Meta Attrs: notify=true 
   Operations: start interval=0s timeout=100 (rabbitmq-start-interval-0s)
               stop interval=0s timeout=90 (rabbitmq-stop-interval-0s)
               monitor interval=10 timeout=40 (rabbitmq-monitor-interval-10)
 Clone: openstack-core-clone
  Meta Attrs: interleave=true 
  Resource: openstack-core (class=ocf provider=heartbeat type=Dummy)
   Operations: start interval=0s timeout=20 (openstack-core-start-interval-0s)
               stop interval=0s timeout=20 (openstack-core-stop-interval-0s)
               monitor interval=10 timeout=20 (openstack-core-monitor-interval-10)
 Master: redis-master
  Meta Attrs: interleave=true ordered=true notify=true 
  Resource: redis (class=ocf provider=heartbeat type=redis)
   Attributes: wait_last_known_master=true
   Operations: start interval=0s timeout=120 (redis-start-interval-0s)
               stop interval=0s timeout=120 (redis-stop-interval-0s)
               monitor interval=45 timeout=60 (redis-monitor-interval-45)
               monitor interval=20 role=Master timeout=60 (redis-monitor-interval-20)
               monitor interval=60 role=Slave timeout=60 (redis-monitor-interval-60)
               promote interval=0s timeout=120 (redis-promote-interval-0s)
               demote interval=0s timeout=120 (redis-demote-interval-0s)
 Resource: ip-172.21.85.11 (class=ocf provider=heartbeat type=IPaddr2)
  Attributes: ip=172.21.85.11 cidr_netmask=32
  Operations: start interval=0s timeout=20s (ip-172.21.85.11-start-interval-0s)
              stop interval=0s timeout=20s (ip-172.21.85.11-stop-interval-0s)
              monitor interval=10s timeout=20s (ip-172.21.85.11-monitor-interval-10s)
 Clone: mongod-clone
  Resource: mongod (class=systemd type=mongod)
   Operations: start interval=0s timeout=370s (mongod-start-interval-0s)
               stop interval=0s timeout=200s (mongod-stop-interval-0s)
               monitor interval=60s (mongod-monitor-interval-60s)
 Clone: openstack-aodh-evaluator-clone
  Meta Attrs: interleave=true 
  Resource: openstack-aodh-evaluator (class=systemd type=openstack-aodh-evaluator)
   Operations: start interval=0s timeout=200s (openstack-aodh-evaluator-start-interval-0s)
               stop interval=0s timeout=200s (openstack-aodh-evaluator-stop-interval-0s)
               monitor interval=60s (openstack-aodh-evaluator-monitor-interval-60s)
 Clone: openstack-nova-scheduler-clone
  Meta Attrs: interleave=true 
  Resource: openstack-nova-scheduler (class=systemd type=openstack-nova-scheduler)
   Operations: start interval=0s timeout=200s (openstack-nova-scheduler-start-interval-0s)
               stop interval=0s timeout=200s (openstack-nova-scheduler-stop-interval-0s)
               monitor interval=60s (openstack-nova-scheduler-monitor-interval-60s)
 Clone: neutron-l3-agent-clone
  Meta Attrs: interleave=true 
  Resource: neutron-l3-agent (class=systemd type=neutron-l3-agent)
   Operations: start interval=0s timeout=200s (neutron-l3-agent-start-interval-0s)
               stop interval=0s timeout=200s (neutron-l3-agent-stop-interval-0s)
               monitor interval=60s (neutron-l3-agent-monitor-interval-60s)
 Clone: neutron-netns-cleanup-clone
  Meta Attrs: interleave=true 
  Resource: neutron-netns-cleanup (class=ocf provider=neutron type=NetnsCleanup)
   Operations: start interval=0s timeout=40 (neutron-netns-cleanup-start-interval-0s)
               stop interval=0s timeout=300 (neutron-netns-cleanup-stop-interval-0s)
               monitor interval=10 timeout=20 (neutron-netns-cleanup-monitor-interval-10)
 Clone: neutron-ovs-cleanup-clone
  Meta Attrs: interleave=true 
  Resource: neutron-ovs-cleanup (class=ocf provider=neutron type=OVSCleanup)
   Operations: start interval=0s timeout=40 (neutron-ovs-cleanup-start-interval-0s)
               stop interval=0s timeout=300 (neutron-ovs-cleanup-stop-interval-0s)
               monitor interval=10 timeout=20 (neutron-ovs-cleanup-monitor-interval-10)
 Resource: openstack-cinder-volume (class=systemd type=openstack-cinder-volume)
  Operations: start interval=0s timeout=200s (openstack-cinder-volume-start-interval-0s)
              stop interval=0s timeout=200s (openstack-cinder-volume-stop-interval-0s)
              monitor interval=60s (openstack-cinder-volume-monitor-interval-60s)
 Clone: openstack-heat-engine-clone
  Meta Attrs: interleave=true 
  Resource: openstack-heat-engine (class=systemd type=openstack-heat-engine)
   Operations: start interval=0s timeout=200s (openstack-heat-engine-start-interval-0s)
               stop interval=0s timeout=200s (openstack-heat-engine-stop-interval-0s)
               monitor interval=60s (openstack-heat-engine-monitor-interval-60s)
 Clone: openstack-ceilometer-api-clone
  Meta Attrs: interleave=true 
  Resource: openstack-ceilometer-api (class=systemd type=openstack-ceilometer-api)
   Operations: start interval=0s timeout=200s (openstack-ceilometer-api-start-interval-0s)
               stop interval=0s timeout=200s (openstack-ceilometer-api-stop-interval-0s)
               monitor interval=60s (openstack-ceilometer-api-monitor-interval-60s)
 Clone: openstack-aodh-listener-clone
  Meta Attrs: interleave=true 
  Resource: openstack-aodh-listener (class=systemd type=openstack-aodh-listener)
   Operations: start interval=0s timeout=200s (openstack-aodh-listener-start-interval-0s)
               stop interval=0s timeout=200s (openstack-aodh-listener-stop-interval-0s)
               monitor interval=60s (openstack-aodh-listener-monitor-interval-60s)
 Clone: neutron-metadata-agent-clone
  Meta Attrs: interleave=true 
  Resource: neutron-metadata-agent (class=systemd type=neutron-metadata-agent)
   Operations: start interval=0s timeout=200s (neutron-metadata-agent-start-interval-0s)
               stop interval=0s timeout=200s (neutron-metadata-agent-stop-interval-0s)
               monitor interval=60s (neutron-metadata-agent-monitor-interval-60s)
 Clone: openstack-gnocchi-metricd-clone
  Meta Attrs: interleave=true 
  Resource: openstack-gnocchi-metricd (class=systemd type=openstack-gnocchi-metricd)
   Operations: start interval=0s timeout=200s (openstack-gnocchi-metricd-start-interval-0s)
               stop interval=0s timeout=200s (openstack-gnocchi-metricd-stop-interval-0s)
               monitor interval=60s (openstack-gnocchi-metricd-monitor-interval-60s)
 Clone: openstack-aodh-notifier-clone
  Meta Attrs: interleave=true 
  Resource: openstack-aodh-notifier (class=systemd type=openstack-aodh-notifier)
   Operations: start interval=0s timeout=200s (openstack-aodh-notifier-start-interval-0s)
               stop interval=0s timeout=200s (openstack-aodh-notifier-stop-interval-0s)
               monitor interval=60s (openstack-aodh-notifier-monitor-interval-60s)
 Clone: openstack-heat-api-clone
  Meta Attrs: interleave=true 
  Resource: openstack-heat-api (class=systemd type=openstack-heat-api)
   Operations: start interval=0s timeout=200s (openstack-heat-api-start-interval-0s)
               stop interval=0s timeout=200s (openstack-heat-api-stop-interval-0s)
               monitor interval=60s (openstack-heat-api-monitor-interval-60s)
 Clone: openstack-ceilometer-collector-clone
  Meta Attrs: interleave=true 
  Resource: openstack-ceilometer-collector (class=systemd type=openstack-ceilometer-collector)
   Operations: start interval=0s timeout=200s (openstack-ceilometer-collector-start-interval-0s)
               stop interval=0s timeout=200s (openstack-ceilometer-collector-stop-interval-0s)
               monitor interval=60s (openstack-ceilometer-collector-monitor-interval-60s)
 Clone: openstack-glance-api-clone
  Meta Attrs: interleave=true 
  Resource: openstack-glance-api (class=systemd type=openstack-glance-api)
   Operations: start interval=0s timeout=200s (openstack-glance-api-start-interval-0s)
               stop interval=0s timeout=200s (openstack-glance-api-stop-interval-0s)
               monitor interval=60s (openstack-glance-api-monitor-interval-60s)
 Clone: openstack-cinder-scheduler-clone
  Meta Attrs: interleave=true 
  Resource: openstack-cinder-scheduler (class=systemd type=openstack-cinder-scheduler)
   Operations: start interval=0s timeout=200s (openstack-cinder-scheduler-start-interval-0s)
               stop interval=0s timeout=200s (openstack-cinder-scheduler-stop-interval-0s)
               monitor interval=60s (openstack-cinder-scheduler-monitor-interval-60s)
 Clone: openstack-nova-api-clone
  Meta Attrs: interleave=true 
  Resource: openstack-nova-api (class=systemd type=openstack-nova-api)
   Operations: start interval=0s timeout=200s (openstack-nova-api-start-interval-0s)
               stop interval=0s timeout=200s (openstack-nova-api-stop-interval-0s)
               monitor interval=60s (openstack-nova-api-monitor-interval-60s)
 Clone: openstack-nova-consoleauth-clone
  Meta Attrs: interleave=true 
  Resource: openstack-nova-consoleauth (class=systemd type=openstack-nova-consoleauth)
   Operations: start interval=0s timeout=200s (openstack-nova-consoleauth-start-interval-0s)
               stop interval=0s timeout=200s (openstack-nova-consoleauth-stop-interval-0s)
               monitor interval=60s (openstack-nova-consoleauth-monitor-interval-60s)
 Clone: openstack-sahara-api-clone
  Meta Attrs: interleave=true 
  Resource: openstack-sahara-api (class=systemd type=openstack-sahara-api)
   Operations: start interval=0s timeout=200s (openstack-sahara-api-start-interval-0s)
               stop interval=0s timeout=200s (openstack-sahara-api-stop-interval-0s)
               monitor interval=60s (openstack-sahara-api-monitor-interval-60s)
 Clone: openstack-heat-api-cloudwatch-clone
  Meta Attrs: interleave=true 
  Resource: openstack-heat-api-cloudwatch (class=systemd type=openstack-heat-api-cloudwatch)
   Operations: start interval=0s timeout=200s (openstack-heat-api-cloudwatch-start-interval-0s)
               stop interval=0s timeout=200s (openstack-heat-api-cloudwatch-stop-interval-0s)
               monitor interval=60s (openstack-heat-api-cloudwatch-monitor-interval-60s)
 Clone: openstack-sahara-engine-clone
  Meta Attrs: interleave=true 
  Resource: openstack-sahara-engine (class=systemd type=openstack-sahara-engine)
   Operations: start interval=0s timeout=200s (openstack-sahara-engine-start-interval-0s)
               stop interval=0s timeout=200s (openstack-sahara-engine-stop-interval-0s)
               monitor interval=60s (openstack-sahara-engine-monitor-interval-60s)
 Clone: openstack-glance-registry-clone
  Meta Attrs: interleave=true 
  Resource: openstack-glance-registry (class=systemd type=openstack-glance-registry)
   Operations: start interval=0s timeout=200s (openstack-glance-registry-start-interval-0s)
               stop interval=0s timeout=200s (openstack-glance-registry-stop-interval-0s)
               monitor interval=60s (openstack-glance-registry-monitor-interval-60s)
 Clone: openstack-gnocchi-statsd-clone
  Meta Attrs: interleave=true 
  Resource: openstack-gnocchi-statsd (class=systemd type=openstack-gnocchi-statsd)
   Operations: start interval=0s timeout=200s (openstack-gnocchi-statsd-start-interval-0s)
               stop interval=0s timeout=200s (openstack-gnocchi-statsd-stop-interval-0s)
               monitor interval=60s (openstack-gnocchi-statsd-monitor-interval-60s)
 Clone: openstack-ceilometer-notification-clone
  Meta Attrs: interleave=true 
  Resource: openstack-ceilometer-notification (class=systemd type=openstack-ceilometer-notification)
   Operations: start interval=0s timeout=200s (openstack-ceilometer-notification-start-interval-0s)
               stop interval=0s timeout=200s (openstack-ceilometer-notification-stop-interval-0s)
               monitor interval=60s (openstack-ceilometer-notification-monitor-interval-60s)
 Clone: openstack-cinder-api-clone
  Meta Attrs: interleave=true 
  Resource: openstack-cinder-api (class=systemd type=openstack-cinder-api)
   Operations: start interval=0s timeout=200s (openstack-cinder-api-start-interval-0s)
               stop interval=0s timeout=200s (openstack-cinder-api-stop-interval-0s)
               monitor interval=60s (openstack-cinder-api-monitor-interval-60s)
 Clone: neutron-dhcp-agent-clone
  Meta Attrs: interleave=true 
  Resource: neutron-dhcp-agent (class=systemd type=neutron-dhcp-agent)
   Operations: start interval=0s timeout=200s (neutron-dhcp-agent-start-interval-0s)
               stop interval=0s timeout=200s (neutron-dhcp-agent-stop-interval-0s)
               monitor interval=60s (neutron-dhcp-agent-monitor-interval-60s)
 Clone: neutron-openvswitch-agent-clone
  Meta Attrs: interleave=true 
  Resource: neutron-openvswitch-agent (class=systemd type=neutron-openvswitch-agent)
   Operations: start interval=0s timeout=200s (neutron-openvswitch-agent-start-interval-0s)
               stop interval=0s timeout=200s (neutron-openvswitch-agent-stop-interval-0s)
               monitor interval=60s (neutron-openvswitch-agent-monitor-interval-60s)
 Clone: openstack-nova-novncproxy-clone
  Meta Attrs: interleave=true 
  Resource: openstack-nova-novncproxy (class=systemd type=openstack-nova-novncproxy)
   Operations: start interval=0s timeout=200s (openstack-nova-novncproxy-start-interval-0s)
               stop interval=0s timeout=200s (openstack-nova-novncproxy-stop-interval-0s)
               monitor interval=60s (openstack-nova-novncproxy-monitor-interval-60s)
 Clone: delay-clone
  Meta Attrs: interleave=true 
  Resource: delay (class=ocf provider=heartbeat type=Delay)
   Attributes: startdelay=10
   Operations: start interval=0s timeout=30 (delay-start-interval-0s)
               stop interval=0s timeout=30 (delay-stop-interval-0s)
               monitor interval=10 timeout=30 (delay-monitor-interval-10)
 Clone: neutron-server-clone
  Meta Attrs: interleave=true 
  Resource: neutron-server (class=systemd type=neutron-server)
   Operations: start interval=0s timeout=200s (neutron-server-start-interval-0s)
               stop interval=0s timeout=200s (neutron-server-stop-interval-0s)
               monitor interval=60s (neutron-server-monitor-interval-60s)
 Clone: openstack-ceilometer-central-clone
  Meta Attrs: interleave=true 
  Resource: openstack-ceilometer-central (class=systemd type=openstack-ceilometer-central)
   Operations: start interval=0s timeout=200s (openstack-ceilometer-central-start-interval-0s)
               stop interval=0s timeout=200s (openstack-ceilometer-central-stop-interval-0s)
               monitor interval=60s (openstack-ceilometer-central-monitor-interval-60s)
 Clone: httpd-clone
  Meta Attrs: interleave=true 
  Resource: httpd (class=systemd type=httpd)
   Operations: start interval=0s timeout=200s (httpd-start-interval-0s)
               stop interval=0s timeout=200s (httpd-stop-interval-0s)
               monitor interval=60s (httpd-monitor-interval-60s)
 Clone: openstack-heat-api-cfn-clone
  Meta Attrs: interleave=true 
  Resource: openstack-heat-api-cfn (class=systemd type=openstack-heat-api-cfn)
   Operations: start interval=0s timeout=200s (openstack-heat-api-cfn-start-interval-0s)
               stop interval=0s timeout=200s (openstack-heat-api-cfn-stop-interval-0s)
               monitor interval=60s (openstack-heat-api-cfn-monitor-interval-60s)
 Clone: openstack-nova-conductor-clone
  Meta Attrs: interleave=true 
  Resource: openstack-nova-conductor (class=systemd type=openstack-nova-conductor)
   Operations: start interval=0s timeout=200s (openstack-nova-conductor-start-interval-0s)
               stop interval=0s timeout=200s (openstack-nova-conductor-stop-interval-0s)
               monitor interval=60s (openstack-nova-conductor-monitor-interval-60s)

Stonith Devices:
Fencing Levels:

Location Constraints:
Ordering Constraints:
  start ip-172.19.85.11 then start haproxy-clone (kind:Optional) (id:order-ip-172.19.85.11-haproxy-clone-Optional)
  start ip-172.23.85.86 then start haproxy-clone (kind:Optional) (id:order-ip-172.23.85.86-haproxy-clone-Optional)
  start ip-172.23.85.11 then start haproxy-clone (kind:Optional) (id:order-ip-172.23.85.11-haproxy-clone-Optional)
  start ip-172.21.85.11 then start haproxy-clone (kind:Optional) (id:order-ip-172.21.85.11-haproxy-clone-Optional)
  start ip-172.19.85.12 then start haproxy-clone (kind:Optional) (id:order-ip-172.19.85.12-haproxy-clone-Optional)
  start ip-172.20.85.11 then start haproxy-clone (kind:Optional) (id:order-ip-172.20.85.11-haproxy-clone-Optional)
  start memcached-clone then start openstack-core-clone (kind:Mandatory) (id:order-memcached-clone-openstack-core-clone-mandatory)
  start rabbitmq-clone then start openstack-core-clone (kind:Mandatory) (id:order-rabbitmq-clone-openstack-core-clone-mandatory)
  promote galera-master then start openstack-core-clone (kind:Mandatory) (id:order-galera-master-openstack-core-clone-mandatory)
  start openstack-core-clone then start openstack-gnocchi-metricd-clone (kind:Mandatory) (id:order-openstack-core-clone-openstack-gnocchi-metricd-clone-mandatory)
  start neutron-l3-agent-clone then start neutron-metadata-agent-clone (kind:Mandatory) (id:order-neutron-l3-agent-clone-neutron-metadata-agent-clone-mandatory)
  start openstack-core-clone then start openstack-nova-consoleauth-clone (kind:Mandatory) (id:order-openstack-core-clone-openstack-nova-consoleauth-clone-mandatory)
  start haproxy-clone then start openstack-core-clone (kind:Mandatory) (id:order-haproxy-clone-openstack-core-clone-mandatory)
  start neutron-ovs-cleanup-clone then start neutron-netns-cleanup-clone (kind:Mandatory) (id:order-neutron-ovs-cleanup-clone-neutron-netns-cleanup-clone-mandatory)
  start openstack-ceilometer-notification-clone then start openstack-heat-api-clone (kind:Mandatory) (id:order-openstack-ceilometer-notification-clone-openstack-heat-api-clone-mandatory)
  start openstack-aodh-evaluator-clone then start openstack-aodh-listener-clone (kind:Mandatory) (id:order-openstack-aodh-evaluator-clone-openstack-aodh-listener-clone-mandatory)
  start openstack-core-clone then start openstack-sahara-api-clone (kind:Mandatory) (id:order-openstack-core-clone-openstack-sahara-api-clone-mandatory)
  start openstack-heat-api-cloudwatch-clone then start openstack-heat-engine-clone (kind:Mandatory) (id:order-openstack-heat-api-cloudwatch-clone-openstack-heat-engine-clone-mandatory)
  start openstack-core-clone then start openstack-glance-registry-clone (kind:Mandatory) (id:order-openstack-core-clone-openstack-glance-registry-clone-mandatory)
  start openstack-glance-registry-clone then start openstack-glance-api-clone (kind:Mandatory) (id:order-openstack-glance-registry-clone-openstack-glance-api-clone-mandatory)
  start openstack-ceilometer-collector-clone then start openstack-ceilometer-api-clone (kind:Mandatory) (id:order-openstack-ceilometer-collector-clone-openstack-ceilometer-api-clone-mandatory)
  start openstack-cinder-scheduler-clone then start openstack-cinder-volume (kind:Mandatory) (id:order-openstack-cinder-scheduler-clone-openstack-cinder-volume-mandatory)
  start openstack-cinder-api-clone then start openstack-cinder-scheduler-clone (kind:Mandatory) (id:order-openstack-cinder-api-clone-openstack-cinder-scheduler-clone-mandatory)
  start openstack-core-clone then start openstack-cinder-api-clone (kind:Mandatory) (id:order-openstack-core-clone-openstack-cinder-api-clone-mandatory)
  start openstack-nova-novncproxy-clone then start openstack-nova-api-clone (kind:Mandatory) (id:order-openstack-nova-novncproxy-clone-openstack-nova-api-clone-mandatory)
  start openstack-nova-consoleauth-clone then start openstack-nova-novncproxy-clone (kind:Mandatory) (id:order-openstack-nova-consoleauth-clone-openstack-nova-novncproxy-clone-mandatory)
  promote redis-master then start openstack-aodh-evaluator-clone (kind:Mandatory) (Options: require-all=false) (id:order-redis-master-openstack-aodh-evaluator-clone-mandatory)
  start openstack-nova-api-clone then start openstack-nova-scheduler-clone (kind:Mandatory) (id:order-openstack-nova-api-clone-openstack-nova-scheduler-clone-mandatory)
  start delay-clone then start openstack-aodh-evaluator-clone (kind:Mandatory) (id:order-delay-clone-openstack-aodh-evaluator-clone-mandatory)
  start openstack-ceilometer-api-clone then start delay-clone (kind:Mandatory) (id:order-openstack-ceilometer-api-clone-delay-clone-mandatory)
  promote redis-master then start openstack-ceilometer-central-clone (kind:Mandatory) (Options: require-all=false) (id:order-redis-master-openstack-ceilometer-central-clone-mandatory)
  start openstack-core-clone then start openstack-ceilometer-notification-clone (kind:Mandatory) (id:order-openstack-core-clone-openstack-ceilometer-notification-clone-mandatory)
  start openstack-core-clone then start openstack-ceilometer-central-clone (kind:Mandatory) (id:order-openstack-core-clone-openstack-ceilometer-central-clone-mandatory)
  start mongod-clone then start openstack-ceilometer-central-clone (kind:Mandatory) (id:order-mongod-clone-openstack-ceilometer-central-clone-mandatory)
  start openstack-ceilometer-central-clone then start openstack-ceilometer-collector-clone (kind:Mandatory) (id:order-openstack-ceilometer-central-clone-openstack-ceilometer-collector-clone-mandatory)
  start openstack-sahara-api-clone then start openstack-sahara-engine-clone (kind:Mandatory) (id:order-openstack-sahara-api-clone-openstack-sahara-engine-clone-mandatory)
  start openstack-core-clone then start httpd-clone (kind:Mandatory) (id:order-openstack-core-clone-httpd-clone-mandatory)
  start neutron-netns-cleanup-clone then start neutron-openvswitch-agent-clone (kind:Mandatory) (id:order-neutron-netns-cleanup-clone-neutron-openvswitch-agent-clone-mandatory)
  start neutron-server-clone then start neutron-openvswitch-agent-clone (kind:Mandatory) (id:order-neutron-server-clone-neutron-openvswitch-agent-clone-mandatory)
  start openstack-heat-api-clone then start openstack-heat-api-cfn-clone (kind:Mandatory) (id:order-openstack-heat-api-clone-openstack-heat-api-cfn-clone-mandatory)
  start openstack-heat-api-cfn-clone then start openstack-heat-api-cloudwatch-clone (kind:Mandatory) (id:order-openstack-heat-api-cfn-clone-openstack-heat-api-cloudwatch-clone-mandatory)
  start openstack-core-clone then start neutron-server-clone (kind:Mandatory) (id:order-openstack-core-clone-neutron-server-clone-mandatory)
  start openstack-aodh-evaluator-clone then start openstack-aodh-notifier-clone (kind:Mandatory) (id:order-openstack-aodh-evaluator-clone-openstack-aodh-notifier-clone-mandatory)
  start openstack-nova-scheduler-clone then start openstack-nova-conductor-clone (kind:Mandatory) (id:order-openstack-nova-scheduler-clone-openstack-nova-conductor-clone-mandatory)
  start neutron-dhcp-agent-clone then start neutron-l3-agent-clone (kind:Mandatory) (id:order-neutron-dhcp-agent-clone-neutron-l3-agent-clone-mandatory)
  start neutron-openvswitch-agent-clone then start neutron-dhcp-agent-clone (kind:Mandatory) (id:order-neutron-openvswitch-agent-clone-neutron-dhcp-agent-clone-mandatory)
  start openstack-gnocchi-metricd-clone then start openstack-gnocchi-statsd-clone (kind:Mandatory) (id:order-openstack-gnocchi-metricd-clone-openstack-gnocchi-statsd-clone-mandatory)
Colocation Constraints:
  ip-172.19.85.11 with haproxy-clone (score:INFINITY) (id:colocation-ip-172.19.85.11-haproxy-clone-INFINITY)
  ip-172.23.85.86 with haproxy-clone (score:INFINITY) (id:colocation-ip-172.23.85.86-haproxy-clone-INFINITY)
  ip-172.19.85.12 with haproxy-clone (score:INFINITY) (id:colocation-ip-172.19.85.12-haproxy-clone-INFINITY)
  ip-172.21.85.11 with haproxy-clone (score:INFINITY) (id:colocation-ip-172.21.85.11-haproxy-clone-INFINITY)
  ip-172.20.85.11 with haproxy-clone (score:INFINITY) (id:colocation-ip-172.20.85.11-haproxy-clone-INFINITY)
  ip-172.23.85.11 with haproxy-clone (score:INFINITY) (id:colocation-ip-172.23.85.11-haproxy-clone-INFINITY)
  neutron-netns-cleanup-clone with neutron-ovs-cleanup-clone (score:INFINITY) (id:colocation-neutron-netns-cleanup-clone-neutron-ovs-cleanup-clone-INFINITY)
  openstack-aodh-listener-clone with openstack-aodh-evaluator-clone (score:INFINITY) (id:colocation-openstack-aodh-listener-clone-openstack-aodh-evaluator-clone-INFINITY)
  openstack-ceilometer-api-clone with openstack-ceilometer-collector-clone (score:INFINITY) (id:colocation-openstack-ceilometer-api-clone-openstack-ceilometer-collector-clone-INFINITY)
  openstack-heat-engine-clone with openstack-heat-api-cloudwatch-clone (score:INFINITY) (id:colocation-openstack-heat-engine-clone-openstack-heat-api-cloudwatch-clone-INFINITY)
  openstack-glance-api-clone with openstack-glance-registry-clone (score:INFINITY) (id:colocation-openstack-glance-api-clone-openstack-glance-registry-clone-INFINITY)
  openstack-cinder-scheduler-clone with openstack-cinder-api-clone (score:INFINITY) (id:colocation-openstack-cinder-scheduler-clone-openstack-cinder-api-clone-INFINITY)
  openstack-cinder-volume with openstack-cinder-scheduler-clone (score:INFINITY) (id:colocation-openstack-cinder-volume-openstack-cinder-scheduler-clone-INFINITY)
  openstack-nova-api-clone with openstack-nova-novncproxy-clone (score:INFINITY) (id:colocation-openstack-nova-api-clone-openstack-nova-novncproxy-clone-INFINITY)
  openstack-nova-novncproxy-clone with openstack-nova-consoleauth-clone (score:INFINITY) (id:colocation-openstack-nova-novncproxy-clone-openstack-nova-consoleauth-clone-INFINITY)
  neutron-metadata-agent-clone with neutron-l3-agent-clone (score:INFINITY) (id:colocation-neutron-metadata-agent-clone-neutron-l3-agent-clone-INFINITY)
  openstack-nova-scheduler-clone with openstack-nova-api-clone (score:INFINITY) (id:colocation-openstack-nova-scheduler-clone-openstack-nova-api-clone-INFINITY)
  openstack-aodh-evaluator-clone with delay-clone (score:INFINITY) (id:colocation-openstack-aodh-evaluator-clone-delay-clone-INFINITY)
  delay-clone with openstack-ceilometer-api-clone (score:INFINITY) (id:colocation-delay-clone-openstack-ceilometer-api-clone-INFINITY)
  neutron-openvswitch-agent-clone with neutron-netns-cleanup-clone (score:INFINITY) (id:colocation-neutron-openvswitch-agent-clone-neutron-netns-cleanup-clone-INFINITY)
  openstack-heat-api-cloudwatch-clone with openstack-heat-api-cfn-clone (score:INFINITY) (id:colocation-openstack-heat-api-cloudwatch-clone-openstack-heat-api-cfn-clone-INFINITY)
  openstack-heat-api-cfn-clone with openstack-heat-api-clone (score:INFINITY) (id:colocation-openstack-heat-api-cfn-clone-openstack-heat-api-clone-INFINITY)
  openstack-gnocchi-statsd-clone with openstack-gnocchi-metricd-clone (score:INFINITY) (id:colocation-openstack-gnocchi-statsd-clone-openstack-gnocchi-metricd-clone-INFINITY)
  openstack-nova-conductor-clone with openstack-nova-scheduler-clone (score:INFINITY) (id:colocation-openstack-nova-conductor-clone-openstack-nova-scheduler-clone-INFINITY)
  neutron-l3-agent-clone with neutron-dhcp-agent-clone (score:INFINITY) (id:colocation-neutron-l3-agent-clone-neutron-dhcp-agent-clone-INFINITY)
  neutron-dhcp-agent-clone with neutron-openvswitch-agent-clone (score:INFINITY) (id:colocation-neutron-dhcp-agent-clone-neutron-openvswitch-agent-clone-INFINITY)
  openstack-aodh-notifier-clone with openstack-aodh-evaluator-clone (score:INFINITY) (id:colocation-openstack-aodh-notifier-clone-openstack-aodh-evaluator-clone-INFINITY)
Ticket Constraints:

Alerts:
 No alerts defined

Resources Defaults:
 resource-stickiness: INFINITY
Operations Defaults:
 No defaults set

Cluster Properties:
 cluster-infrastructure: corosync
 cluster-name: tripleo_cluster
 dc-version: 1.1.15-11.el7-e174ec8
 have-watchdog: false
 last-lrm-refresh: 1480940797
 maintenance-mode: false
 redis_REPL_INFO: slot5
 stonith-enabled: false
Node Attributes:
 slot14: rmq-node-attr-last-known-rabbitmq=rabbit@slot14
 slot5: rmq-node-attr-last-known-rabbitmq=rabbit@slot5
 slot7: rmq-node-attr-last-known-rabbitmq=rabbit@slot7

Quorum:
  Options:


```



