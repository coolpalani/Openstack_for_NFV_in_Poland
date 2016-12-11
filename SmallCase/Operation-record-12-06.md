2016-12-06 05:49:08.576 11497 DEBUG neutron.quota.resource_registry [-] Tracking information for resource: port configured set_tracked_resource /usr/lib/python2.7/site-packages/neutron/quota/resource_registry.py:199
2016-12-06 05:49:08.576 11497 INFO neutron.plugins.ml2.managers [-] Configured type driver names: ['vxlan', 'vlan', 'flat', 'gre']
2016-12-06 05:49:08.578 11497 INFO neutron.plugins.ml2.drivers.type_flat [-] Allowable flat physical_network names: ['datacentre']
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan [-] Failed to parse network_vlan_ranges. Service terminated!
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan Traceback (most recent call last):
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan   File "/usr/lib/python2.7/site-packages/neutron/plugins/ml2/drivers/type_vlan.py", line 92, in _parse_network_vlan_ranges
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan     cfg.CONF.ml2_type_vlan.network_vlan_ranges)
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan   File "/usr/lib/python2.7/site-packages/neutron/plugins/common/utils.py", line 116, in parse_network_vlan_ranges
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan     network, vlan_range = parse_network_vlan_range(entry)
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan   File "/usr/lib/python2.7/site-packages/neutron/plugins/common/utils.py", line 103, in parse_network_vlan_range
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan     raise n_exc.NetworkVlanRangeError(vlan_range=entry, error=ex)
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan NetworkVlanRangeError: Invalid network VLAN range: 'Sriov_Vlan_phynet2:2:4090:Sriov_Vlan_phynet3:2:4090' - 'too many values to unpack'.
2016-12-06 05:49:08.580 11497 ERROR neutron.plugins.ml2.drivers.type_vlan
2016-12-06 05:49:08.581 11497 DEBUG oslo_concurrency.lockutils [-] Lock "manager" released by "neutron.manager._create_instance" :: held 0.125s inner /usr/lib/python2.7/site-packages/oslo_concurrency/lockutils.py:282




2016-12-06 07:04:00.607 4089 INFO nova.compute.resource_tracker [req-ade5f2ea-ef52-4d2d-a258-d412868a5a5f - - - - -] Final resource view: name=slot1.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=2048MB phys_disk=838GB used_disk=0GB total_vcpus=40 used_vcpus=0 pci_stats=[PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]
2016-12-06 07:04:02.869 4089 INFO nova.compute.resource_tracker [req-ade5f2ea-ef52-4d2d-a258-d412868a5a5f - - - - -] Compute_service record updated for slot1.vepc.mnc066.mcc260.3gppnetwork.org:slot1.vepc.mnc066.mcc260.3gppnetwork.org




| fault                                | {"message": "Insufficient compute resources: Claim pci failed..", "code": 500, "details": "  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 1926, in _do_build_and_run_instance |
|                                      |     filter_properties)                                                                                                                                                                                   |
|                                      |   File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2078, in _build_and_run_instance                                                                                               |
|                                      |     instance_uuid=instance.uuid, reason=e.format_message())                                                                                                                                              |
|                                      | ", "created": "2016-12-06T08:41:12Z"}                                                                                                                                                                    |
| flavor                               | m1.small (2) 





2016-12-06 14:35:20.001 11167 DEBUG nova.virt.hardware [req-c2a6d623-fb77-430f-9775-a3ef4dcd7d1d d27e186502944e06999726e454b80702 2a91aa4eedba4cf28631d6f0afb66e99 - - -] Require both a host and instance NUMA topology to fit instance on host. numa_fit_instance_to_host /usr/lib/python2.7/site-packages/nova/virt/hardware.py:1214


2016-12-06 15:38:08.723 1916 INFO nova.compute.resource_tracker [req-dd98154b-452f-4b8a-a426-37f1523cbd71 - - - - -] Final resource view: name=slot2.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=4096MB phys_disk=838GB used_disk=20GB total_vcpus=40 used_vcpus=1 

pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'),

PciDevicePool(count=5,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086'), 

PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'),
PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086')]


[root@slot2 nova]# ip l show enp129s0f1
7: enp129s0f1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT qlen 1000
    link/ether 7c:a2:3e:e4:69:e2 brd ff:ff:ff:ff:ff:ff
    vf 0 MAC 82:5b:04:37:6b:d6, spoof checking on, link-state auto, trust off
    vf 1 MAC ba:96:8a:76:6b:99, spoof checking on, link-state auto, trust off
    vf 2 MAC 46:db:19:98:6d:11, spoof checking on, link-state auto, trust off
    vf 3 MAC 6e:81:d1:4b:f4:dc, spoof checking on, link-state auto, trust off
    vf 4 MAC 56:42:73:76:19:66, spoof checking on, link-state auto, trust off
    vf 5 MAC 32:7e:96:6d:83:bf, spoof checking on, link-state auto, trust off
    vf 6 MAC 56:1f:e8:a2:7b:74, spoof checking on, link-state auto, trust off
    vf 7 MAC ba:79:c5:5a:e4:6d, spoof checking on, link-state auto, trust off
    vf 8 MAC 3e:de:93:ba:3b:cf, spoof checking on, link-state auto, trust off
    vf 9 MAC ea:57:24:45:80:ad, spoof checking on, link-state auto, trust off
    vf 10 MAC 1a:f4:62:62:5a:26, spoof checking on, link-state auto, trust off
    vf 11 MAC 6e:22:a7:0a:84:66, spoof checking on, link-state auto, trust off
    vf 12 MAC a2:ac:45:4e:84:f1, spoof checking on, link-state auto, trust off
    vf 13 MAC d2:4b:02:2d:b4:56, spoof checking on, link-state auto, trust off
    vf 14 MAC b6:cc:8b:a7:4e:53, spoof checking on, link-state auto, trust off
    vf 15 MAC 36:29:7e:45:ef:7d, spoof checking on, link-state auto, trust off
    vf 16 MAC 0e:89:ab:0c:a4:5f, spoof checking on, link-state auto, trust off
    vf 17 MAC 9e:ad:cd:d9:23:7e, spoof checking on, link-state auto, trust off
    vf 18 MAC 76:a1:6f:0d:28:e8, spoof checking on, link-state auto, trust off
    vf 19 MAC 7e:3b:ae:51:f1:04, spoof checking on, link-state auto, trust off
    vf 20 MAC 32:e8:cb:49:fb:c3, spoof checking on, link-state auto, trust off
    vf 21 MAC 52:0a:f0:86:82:08, spoof checking on, link-state auto, trust off
    vf 22 MAC 5a:39:1c:f1:9c:47, spoof checking on, link-state auto, trust off
    vf 23 MAC a2:c0:60:7a:74:78, spoof checking on, link-state auto, trust off
    vf 24 MAC 62:5b:3c:fa:46:eb, spoof checking on, link-state auto, trust off
    vf 25 MAC 12:0c:b5:ee:d5:58, spoof checking on, link-state auto, trust off
    vf 26 MAC c2:cc:b4:82:66:56, spoof checking on, link-state auto, trust off
    vf 27 MAC 5e:d0:2d:bb:50:74, spoof checking on, link-state auto, trust off
    vf 28 MAC 92:7d:8a:11:9c:e2, spoof checking on, link-state auto, trust off
    vf 29 MAC 12:48:c2:c0:91:25, spoof checking on, link-state auto, trust off
    vf 30 MAC 16:05:e6:36:ca:24, spoof checking on, link-state auto, trust off
    vf 31 MAC e2:04:37:df:b5:b0, spoof checking on, link-state auto, trust off
    vf 32 MAC 92:92:2a:fb:da:1a, spoof checking on, link-state auto, trust off
    vf 33 MAC ae:37:41:13:f0:74, spoof checking on, link-state auto, trust off
    vf 34 MAC 0e:28:24:a5:fb:3d, spoof checking on, link-state auto, trust off
    vf 35 MAC 9e:4e:3b:27:98:5c, spoof checking on, link-state auto, trust off
    vf 36 MAC b2:a0:ee:00:84:1a, spoof checking on, link-state auto, trust off
    vf 37 MAC 12:88:9b:94:2f:b7, spoof checking on, link-state auto, trust off
    vf 38 MAC ee:6b:25:4d:bd:fb, spoof checking on, link-state auto, trust off
    vf 39 MAC 0a:82:39:16:80:4a, spoof checking on, link-state auto, trust off
    vf 40 MAC 02:73:75:fb:c9:b7, spoof checking on, link-state auto, trust off
    vf 41 MAC f6:93:dd:85:11:4b, spoof checking on, link-state auto, trust off
    vf 42 MAC 86:de:7e:a8:03:bc, spoof checking on, link-state auto, trust off
    vf 43 MAC 5e:c8:66:4e:b2:e1, spoof checking on, link-state auto, trust off
    vf 44 MAC 0a:72:57:8c:bc:4e, spoof checking on, link-state auto, trust off
    vf 45 MAC 06:72:7b:00:84:59, spoof checking on, link-state auto, trust off
    vf 46 MAC ae:64:45:e6:8d:b6, spoof checking on, link-state auto, trust off
    vf 47 MAC 4e:f7:d0:ab:64:f1, spoof checking on, link-state auto, trust off
    vf 48 MAC fa:7c:3e:45:60:8a, spoof checking on, link-state auto, trust off
    vf 49 MAC ba:7c:26:00:ac:af, spoof checking on, link-state auto, trust off
    vf 50 MAC 9e:d3:67:03:bb:b2, spoof checking on, link-state auto, trust off
    vf 51 MAC fe:19:e8:91:d9:18, spoof checking on, link-state auto, trust off
    vf 52 MAC 16:2b:7d:f9:48:95, spoof checking on, link-state auto, trust off
    vf 53 MAC 46:a7:4b:2e:8a:0c, spoof checking on, link-state auto, trust off
    vf 54 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 55 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 56 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 57 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 58 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 59 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 60 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 61 MAC 00:00:00:00:00:00, spoof checking on, link-state auto, trust off
    vf 62 MAC 0a:38:82:eb:30:5f, spoof checking on, link-state auto, trust off

[root@slot5 nova]# neutron port-show fe598d8e-dba1-4d66-b18a-365e6e749777
+-----------------------+-------------------------------------------------------------------------------------+
| Field                 | Value                                                                               |
+-----------------------+-------------------------------------------------------------------------------------+
| admin_state_up        | True                                                                                |
| binding:host_id       | slot2.vepc.mnc066.mcc260.3gppnetwork.org                                            |
| binding:profile       | {}                                                                                  |
| binding:vif_details   | {"port_filter": false, "ovs_hybrid_plug": false}                                    |
| binding:vif_type      | ovs                                                                                 |
| binding:vnic_type     | normal                                                                              |
| created_at            | 2016-12-06T14:22:06                                                                 |
| description           |                                                                                     |
| device_id             | 3d2c842a-40b7-48e1-ae07-8ecff1bcda77                                                |
| device_owner          | compute:None                                                                        |
| dns_name              |                                                                                     |
| extra_dhcp_opts       |                                                                                     |
| fixed_ips             | {"subnet_id": "d6762185-1fbf-4f2b-ab66-73047765dc88", "ip_address": "192.168.22.5"} |
| id                    | fe598d8e-dba1-4d66-b18a-365e6e749777                                                |
| mac_address           | fa:16:3e:dc:05:de                                                                   |
| name                  |                                                                                     |
| network_id            | 8b982c9e-8a24-4091-a53a-fb8d673f798b                                                |
| port_security_enabled | True                                                                                |
| qos_policy_id         |                                                                                     |
| status                | ACTIVE                                                                              |
| tenant_id             | 2a91aa4eedba4cf28631d6f0afb66e99                                                    |
| updated_at            | 2016-12-06T14:22:09                                                                 |
+-----------------------+-------------------------------------------------------------------------------------+
[root@slot5 nova]# neutron port-show fe598d8e-dba1-4d66-b18a-365e6e749777
+-----------------------+-------------------------------------------------------------------------------------+
| Field                 | Value                                                                               |
+-----------------------+-------------------------------------------------------------------------------------+
| admin_state_up        | True                                                                                |
| binding:host_id       | slot2.vepc.mnc066.mcc260.3gppnetwork.org                                            |
| binding:profile       | {}                                                                                  |
| binding:vif_details   | {"port_filter": false, "ovs_hybrid_plug": false}                                    |
| binding:vif_type      | ovs                                                                                 |
| binding:vnic_type     | normal                                                                              |
| created_at            | 2016-12-06T14:22:06                                                                 |
| description           |                                                                                     |
| device_id             | 3d2c842a-40b7-48e1-ae07-8ecff1bcda77                                                |
| device_owner          | compute:None                                                                        |
| dns_name              |                                                                                     |
| extra_dhcp_opts       |                                                                                     |
| fixed_ips             | {"subnet_id": "d6762185-1fbf-4f2b-ab66-73047765dc88", "ip_address": "192.168.22.5"} |
| id                    | fe598d8e-dba1-4d66-b18a-365e6e749777                                                |
| mac_address           | fa:16:3e:dc:05:de                                                                   |
| name                  |                                                                                     |
| network_id            | 8b982c9e-8a24-4091-a53a-fb8d673f798b                                                |
| port_security_enabled | True                                                                                |
| qos_policy_id         |                                                                                     |
| status                | ACTIVE                                                                              |
| tenant_id             | 2a91aa4eedba4cf28631d6f0afb66e99                                                    |
| updated_at            | 2016-12-06T14:22:09                                                                 |
+-----------------------+-------------------------------------------------------------------------------------+
[root@slot5 nova]# nova list
+--------------------------------------+------+--------+------------+-------------+--------------------------+
| ID                                   | Name | Status | Task State | Power State | Networks                 |
+--------------------------------------+------+--------+------------+-------------+--------------------------+
| 1201d749-92a6-4ee3-81e4-ca3cebfdb536 | sm1  | ACTIVE | -          | Running     | OSS_Service=192.168.22.4 |
| 3d2c842a-40b7-48e1-ae07-8ecff1bcda77 | sm2  | ACTIVE | -          | Running     | OSS_Service=192.168.22.5 |
| 002f0676-0118-424e-95a6-57766558fa5b | sr2  | ERROR  | -          | NOSTATE     |                          |
| 5b6cbb27-77f8-4c4b-abd5-582b71231fbb | st1  | ERROR  | -          | NOSTATE     |                          |
| 8c50fa01-c9e8-417c-bdf0-3a7c6fe63133 | zl   | ACTIVE | -          | Running     | OSS_Service=192.168.22.6 |
+--------------------------------------+------+--------+------------+-------------+--------------------------+




| description                          | -                                                                                                                                                                                                                                                                                                                        |
| fault                                | {"message": "Exceeded maximum number of retries. Exceeded max scheduling attempts 3 for instance 2fa9171a-0a66-4183-a004-381120358ec2. Last exception: Unexpected vif_type=binding_failed", "code": 500, "details": "  File \"/usr/lib/python2.7/site-packages/nova/conductor/manager.py\", line 388, in build_instances |
|                                      |     filter_properties, instances[0].uuid)                                                                                                                                                                                                                                                                                |
|                                      |   File \"/usr/lib/python2.7/site-packages/nova/scheduler/utils.py\", line 186, in populate_retry


mod-flows SWITCH FLOW       modify actions of matching FLOWs

priority=2,arp,in_port=6,arp_spa=192.168.22.13 actions=resubmit(,25)
ovs-ofctl add-flow br-int 24  "priority=2,arp,in_port=6,arp_spa=192.168.23.13 actions=resubmit(,25)"

 cookie=0xa27c0dc9aff087e6, duration=1506.546s, table=24, n_packets=0, n_bytes=0, idle_age=1506, priority=2,arp,in_port=16,arp_spa=192.168.22.6 actions=resubmit(,25)

 priority=2,arp,in_port=6,arp_spa=192.168.22.13 actions=resubmit(,25)
ovs-ofctl add-flow br-int 24  "table=24,priority=2,arp,in_port=16,arp_spa=192.168.23.12 actions=resubmit(,25)"



ovs-ofctl add-flow br-int   "table=24,priority=2,arp,in_port=6,arp_spa=192.168.23.13 actions=resubmit(,25)"
[root@slot13 ~]# ovs-ofctl add-flow br-int  "table=24,priority=2,arp,in_port=19,arp_spa=192.168.23.12 actions=resubmit(,25)"



[root@slot12 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa263bfec6ae5be77, duration=4260.488s, table=0, n_packets=0, n_bytes=0, idle_age=4260, priority=10,icmp6,in_port=6,icmp_type=136 actions=resubmit(,24)
 cookie=0xa263bfec6ae5be77, duration=4260.482s, table=0, n_packets=1013, n_bytes=42546, idle_age=17, priority=10,arp,in_port=6 actions=resubmit(,24)
 cookie=0xa263bfec6ae5be77, duration=4263.141s, table=0, n_packets=273, n_bytes=16840, idle_age=2, priority=2,in_port=1 actions=drop
 cookie=0xa263bfec6ae5be77, duration=4263.056s, table=0, n_packets=89, n_bytes=5696, idle_age=14, priority=2,in_port=2 actions=drop
 cookie=0xa263bfec6ae5be77, duration=4260.496s, table=0, n_packets=621, n_bytes=60858, idle_age=0, priority=9,in_port=6 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=4260.534s, table=0, n_packets=1191, n_bytes=150574, idle_age=0, priority=3,in_port=2,dl_vlan=3099 actions=mod_vlan_vid:1,NORMAL
 cookie=0xa263bfec6ae5be77, duration=4263.223s, table=0, n_packets=5, n_bytes=438, idle_age=3691, priority=0 actions=NORMAL
 cookie=0x0, duration=2309.415s, table=2, n_packets=0, n_bytes=0, idle_age=2309, priority=1,arp,in_port=6 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=4263.219s, table=23, n_packets=0, n_bytes=0, idle_age=4263, priority=0 actions=drop
 cookie=0xa263bfec6ae5be77, duration=4260.492s, table=24, n_packets=0, n_bytes=0, idle_age=4260, priority=2,icmp6,in_port=6,icmp_type=136,nd_target=fe80::f816:3eff:fe51:400 actions=NORMAL
 cookie=0xa263bfec6ae5be77, duration=4260.485s, table=24, n_packets=7, n_bytes=294, idle_age=2342, priority=2,arp,in_port=6,arp_spa=192.168.22.13 actions=resubmit(,25)
 cookie=0x0, duration=414.950s, table=24, n_packets=26, n_bytes=1092, idle_age=17, priority=2,arp,in_port=6,arp_spa=192.168.23.13 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=4263.214s, table=24, n_packets=577, n_bytes=24234, idle_age=584, priority=0 actions=drop
 cookie=0xa263bfec6ae5be77, duration=4260.503s, table=25, n_packets=1057, n_bytes=79170, idle_age=0, priority=2,in_port=6,dl_src=fa:16:3e:51:04:00 actions=NORMAL

# br-int table 

```sh 
[root@slot12 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa263bfec6ae5be77, duration=6228.558s, table=0, n_packets=452, n_bytes=29504, idle_age=2, priority=2,in_port=1 actions=drop
 cookie=0xa263bfec6ae5be77, duration=6228.473s, table=0, n_packets=147, n_bytes=11424, idle_age=9, priority=2,in_port=2 actions=drop
 cookie=0xa263bfec6ae5be77, duration=6228.640s, table=0, n_packets=5, n_bytes=438, idle_age=5657, priority=0 actions=NORMAL
 cookie=0x0, duration=4274.832s, table=2, n_packets=0, n_bytes=0, idle_age=4274, priority=1,arp,in_port=6 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=6228.636s, table=23, n_packets=0, n_bytes=0, idle_age=6228, priority=0 actions=drop
 cookie=0xa263bfec6ae5be77, duration=6228.631s, table=24, n_packets=577, n_bytes=24234, idle_age=2549, priority=0 actions=drop
[root@slot12 ~]# 


[root@slot12 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa263bfec6ae5be77, duration=16.490s, table=0, n_packets=0, n_bytes=0, idle_age=16, priority=10,icmp6,in_port=7,icmp_type=136 actions=resubmit(,24)
 cookie=0xa263bfec6ae5be77, duration=16.482s, table=0, n_packets=0, n_bytes=0, idle_age=16, priority=10,arp,in_port=7 actions=resubmit(,24)
 cookie=0xa263bfec6ae5be77, duration=6322.433s, table=0, n_packets=455, n_bytes=29684, idle_age=2, priority=2,in_port=1 actions=drop
 cookie=0xa263bfec6ae5be77, duration=6322.348s, table=0, n_packets=147, n_bytes=11424, idle_age=103, priority=2,in_port=2 actions=drop
 cookie=0xa263bfec6ae5be77, duration=16.498s, table=0, n_packets=8, n_bytes=1184, idle_age=2, priority=9,in_port=7 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=16.539s, table=0, n_packets=0, n_bytes=0, idle_age=16, priority=3,in_port=2,dl_vlan=3099 actions=mod_vlan_vid:1,NORMAL
 cookie=0xa263bfec6ae5be77, duration=6322.515s, table=0, n_packets=5, n_bytes=438, idle_age=5751, priority=0 actions=NORMAL
 cookie=0x0, duration=4368.707s, table=2, n_packets=0, n_bytes=0, idle_age=4368, priority=1,arp,in_port=6 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=6322.511s, table=23, n_packets=0, n_bytes=0, idle_age=6322, priority=0 actions=drop
 cookie=0xa263bfec6ae5be77, duration=16.494s, table=24, n_packets=0, n_bytes=0, idle_age=16, priority=2,icmp6,in_port=7,icmp_type=136,nd_target=fe80::f816:3eff:feec:e19e actions=NORMAL
 cookie=0xa263bfec6ae5be77, duration=16.486s, table=24, n_packets=0, n_bytes=0, idle_age=16, priority=2,arp,in_port=7,arp_spa=192.168.22.14 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=6322.506s, table=24, n_packets=577, n_bytes=24234, idle_age=2643, priority=0 actions=drop
 cookie=0xa263bfec6ae5be77, duration=16.505s, table=25, n_packets=8, n_bytes=1184, idle_age=2, priority=2,in_port=7,dl_src=fa:16:3e:ec:e1:9e actions=NORMAL


boot vm , ping not ok


[root@slot12 ~]# ovs-ofctl add-flow br-int "table=24,priority=10,arp,actions=NORMAL"
[root@slot12 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa263bfec6ae5be77, duration=333.580s, table=0, n_packets=0, n_bytes=0, idle_age=333, priority=10,icmp6,in_port=7,icmp_type=136 actions=resubmit(,24)
 cookie=0xa263bfec6ae5be77, duration=333.572s, table=0, n_packets=0, n_bytes=0, idle_age=333, priority=10,arp,in_port=7 actions=resubmit(,24)
 cookie=0xa263bfec6ae5be77, duration=6639.523s, table=0, n_packets=477, n_bytes=31036, idle_age=6, priority=2,in_port=1 actions=drop
 cookie=0xa263bfec6ae5be77, duration=6639.438s, table=0, n_packets=153, n_bytes=11808, idle_age=25, priority=2,in_port=2 actions=drop
 cookie=0xa263bfec6ae5be77, duration=333.588s, table=0, n_packets=52, n_bytes=9336, idle_age=161, priority=9,in_port=7 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=333.629s, table=0, n_packets=47, n_bytes=7814, idle_age=12, priority=3,in_port=2,dl_vlan=3099 actions=mod_vlan_vid:1,NORMAL
 cookie=0xa263bfec6ae5be77, duration=6639.605s, table=0, n_packets=5, n_bytes=438, idle_age=6068, priority=0 actions=NORMAL
 cookie=0x0, duration=4685.797s, table=2, n_packets=0, n_bytes=0, idle_age=4685, priority=1,arp,in_port=6 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=6639.601s, table=23, n_packets=0, n_bytes=0, idle_age=6639, priority=0 actions=drop
 cookie=0x0, duration=10.840s, table=24, n_packets=0, n_bytes=0, idle_age=10, priority=10,arp actions=NORMAL
 cookie=0xa263bfec6ae5be77, duration=333.584s, table=24, n_packets=0, n_bytes=0, idle_age=333, priority=2,icmp6,in_port=7,icmp_type=136,nd_target=fe80::f816:3eff:feec:e19e actions=NORMAL
 cookie=0xa263bfec6ae5be77, duration=333.576s, table=24, n_packets=0, n_bytes=0, idle_age=333, priority=2,arp,in_port=7,arp_spa=192.168.22.14 actions=resubmit(,25)
 cookie=0xa263bfec6ae5be77, duration=6639.596s, table=24, n_packets=577, n_bytes=24234, idle_age=2960, priority=0 actions=drop
 cookie=0xa263bfec6ae5be77, duration=333.595s, table=25, n_packets=52, n_bytes=9336, idle_age=161, priority=2,in_port=7,dl_src=fa:16:3e:ec:e1:9e actions=NORMAL


ping ok.

```


