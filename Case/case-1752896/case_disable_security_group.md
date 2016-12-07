# Issue after disable Security group
[Redhat Case](https://access.redhat.com/support/cases/#/case/01752896)

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

## on slot12 
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

## on slot13 

### delete vm test4 on slot3 ,then create a new vm called test5 
```sh 
[root@slot13 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa27c0dc9aff087e6, duration=3291.839s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=19,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.798s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=15,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.756s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=11,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.717s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=14,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.679s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=13,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.639s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=10,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.603s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=12,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.550s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=17,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.509s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=16,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.830s, table=0, n_packets=409, n_bytes=17178, idle_age=318, priority=10,arp,in_port=19 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.788s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=15 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.747s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=11 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.707s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=14 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.668s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=13 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.631s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=10 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.594s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=12 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.538s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=17 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.498s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=16 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3293.292s, table=0, n_packets=215, n_bytes=13266, idle_age=17, priority=2,in_port=1 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3293.213s, table=0, n_packets=0, n_bytes=0, idle_age=3293, priority=2,in_port=2 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3291.855s, table=0, n_packets=108, n_bytes=10584, idle_age=323, priority=9,in_port=19 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.810s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=15 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.766s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=11 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.729s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=14 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.688s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=13 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.649s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=10 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.612s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.566s, table=0, n_packets=355, n_bytes=62274, idle_age=163, priority=9,in_port=17 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.518s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=16 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3292.045s, table=0, n_packets=526, n_bytes=37768, idle_age=216, priority=3,in_port=2,dl_vlan=3099 actions=mod_vlan_vid:2,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3292.022s, table=0, n_packets=71, n_bytes=4544, idle_age=77, priority=3,in_port=2,dl_vlan=4004 actions=mod_vlan_vid:3,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.968s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=3,in_port=2,dl_vlan=4010 actions=mod_vlan_vid:1,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3293.407s, table=0, n_packets=0, n_bytes=0, idle_age=3293, priority=0 actions=NORMAL
 cookie=0x0, duration=1266.651s, table=2, n_packets=0, n_bytes=0, idle_age=1266, priority=1,arp,in_port=19 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3293.403s, table=23, n_packets=0, n_bytes=0, idle_age=3293, priority=0 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3291.843s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=19,icmp_type=136,nd_target=fe80::f816:3eff:feeb:7181 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.805s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=15,icmp_type=136,nd_target=fe80::f816:3eff:fe61:1bcf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.761s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=11,icmp_type=136,nd_target=fe80::f816:3eff:fe94:a0ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.723s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=14,icmp_type=136,nd_target=fe80::f816:3eff:fe87:531f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.683s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=13,icmp_type=136,nd_target=fe80::f816:3eff:fec0:930c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.643s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=10,icmp_type=136,nd_target=fe80::f816:3eff:fead:ccf6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.608s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=12,icmp_type=136,nd_target=fe80::f816:3eff:fe12:27cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.555s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=17,icmp_type=136,nd_target=fe80::f816:3eff:fe1c:6be1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.513s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=16,icmp_type=136,nd_target=fe80::f816:3eff:fef2:b39e actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.835s, table=24, n_packets=3, n_bytes=126, idle_age=1545, priority=2,arp,in_port=19,arp_spa=192.168.22.12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.792s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=15,arp_spa=192.168.21.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.751s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=11,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.712s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=14,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.674s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=13,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.635s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=10,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.599s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=12,arp_spa=192.168.21.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.543s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=17,arp_spa=192.168.22.7 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.502s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=16,arp_spa=192.168.22.6 actions=resubmit(,25)
 cookie=0x0, duration=1592.867s, table=24, n_packets=0, n_bytes=0, idle_age=1592, priority=2,arp,in_port=16,arp_spa=192.168.23.12 actions=resubmit(,25)
 cookie=0x0, duration=1279.080s, table=24, n_packets=10, n_bytes=420, idle_age=318, priority=2,arp,in_port=19,arp_spa=192.168.23.12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3293.400s, table=24, n_packets=396, n_bytes=16632, idle_age=1280, priority=0 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3291.881s, table=25, n_packets=121, n_bytes=11130, idle_age=318, priority=2,in_port=19,dl_src=fa:16:3e:eb:71:81 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.820s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=15,dl_src=fa:16:3e:61:1b:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.776s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=11,dl_src=fa:16:3e:94:a0:ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.738s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=14,dl_src=fa:16:3e:87:53:1f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.695s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=13,dl_src=fa:16:3e:c0:93:0c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.658s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=10,dl_src=fa:16:3e:ad:cc:f6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.622s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=12,dl_src=fa:16:3e:12:27:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.580s, table=25, n_packets=355, n_bytes=62274, idle_age=163, priority=2,in_port=17,dl_src=fa:16:3e:1c:6b:e1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.527s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=16,dl_src=fa:16:3e:f2:b3:9e actions=NORMAL
[root@slot13 ~]# ovs-ofctl show br-int 
OFPT_FEATURES_REPLY (xid=0x2): dpid:00006e9ababd4e4c
n_tables:254, n_buffers:256
capabilities: FLOW_STATS TABLE_STATS PORT_STATS QUEUE_STATS ARP_MATCH_IP
actions: output enqueue set_vlan_vid set_vlan_pcp strip_vlan mod_dl_src mod_dl_dst mod_nw_src mod_nw_dst mod_nw_tos mod_tp_src mod_tp_dst
 1(int-br-ex): addr:36:b3:1c:a3:ca:78
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 2(int-br-phynet0): addr:e2:62:1a:1a:c0:11
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 10(tap0192cdd5-8b): addr:fe:16:3e:ad:cc:f6
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 11(tapbb02fc07-75): addr:fe:16:3e:94:a0:ed
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 12(tap71ca4827-2a): addr:fe:16:3e:12:27:cf
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 13(tapa44491ac-89): addr:fe:16:3e:c0:93:0c
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 14(tapfe81779c-28): addr:fe:16:3e:87:53:1f
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 15(tap3dd9d769-55): addr:fe:16:3e:61:1b:cf
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 16(tap6e107bfb-a0): addr:fe:16:3e:f2:b3:9e
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 17(tap3330a0be-05): addr:fe:16:3e:1c:6b:e1
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 20(tapcad344da-c9): addr:fe:16:3e:f1:4e:d5
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 LOCAL(br-int): addr:6e:9a:ba:bd:4e:4c
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
OFPT_GET_CONFIG_REPLY (xid=0x4): frags=normal miss_send_len=0

now the port 19 is absent, it appears port 20 


```

### issue screenshot 
![Screenshot of issue](http://image18-c.poco.cn/mypoco/myphoto/20161207/12/560211420161207124340023.png?1920x1080_130)


### flow table of br-int on slot13 
```sh
[root@slot13 ~]# ovs-ofctl add-flow br-int "table=24,priority=10,arp,actions=NORMAL"
[root@slot13 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa27c0dc9aff087e6, duration=7771.308s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=15,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.266s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=11,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.227s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=14,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.189s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=13,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.149s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=10,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.113s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=12,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.060s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=17,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.019s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=16,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=518.057s, table=0, n_packets=0, n_bytes=0, idle_age=518, priority=10,icmp6,in_port=20,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.298s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=15 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.257s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=11 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.217s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=14 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.178s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=13 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.141s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=10 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.104s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=12 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.048s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=17 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.008s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=16 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=518.049s, table=0, n_packets=9, n_bytes=378, idle_age=79, priority=10,arp,in_port=20 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7772.802s, table=0, n_packets=562, n_bytes=36498, idle_age=4, priority=2,in_port=1 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=7772.723s, table=0, n_packets=0, n_bytes=0, idle_age=7772, priority=2,in_port=2 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=7771.320s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=15 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.276s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=11 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.239s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=14 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.198s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=13 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.159s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=10 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.122s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.076s, table=0, n_packets=827, n_bytes=145554, idle_age=1, priority=9,in_port=17 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.028s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=16 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=518.065s, table=0, n_packets=54, n_bytes=9288, idle_age=93, priority=9,in_port=20 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.555s, table=0, n_packets=3076, n_bytes=295610, idle_age=79, priority=3,in_port=2,dl_vlan=3099 actions=mod_vlan_vid:2,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.532s, table=0, n_packets=163, n_bytes=10612, idle_age=155, priority=3,in_port=2,dl_vlan=4004 actions=mod_vlan_vid:3,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.478s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=3,in_port=2,dl_vlan=4010 actions=mod_vlan_vid:1,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7772.917s, table=0, n_packets=0, n_bytes=0, idle_age=7772, priority=0 actions=NORMAL
 cookie=0x0, duration=5746.161s, table=2, n_packets=0, n_bytes=0, idle_age=5746, priority=1,arp,in_port=19 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7772.913s, table=23, n_packets=0, n_bytes=0, idle_age=7772, priority=0 actions=drop
 cookie=0x0, duration=5.713s, table=24, n_packets=0, n_bytes=0, idle_age=5, priority=10,arp actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.315s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=15,icmp_type=136,nd_target=fe80::f816:3eff:fe61:1bcf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.271s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=11,icmp_type=136,nd_target=fe80::f816:3eff:fe94:a0ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.233s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=14,icmp_type=136,nd_target=fe80::f816:3eff:fe87:531f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.193s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=13,icmp_type=136,nd_target=fe80::f816:3eff:fec0:930c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.153s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=10,icmp_type=136,nd_target=fe80::f816:3eff:fead:ccf6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.118s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=12,icmp_type=136,nd_target=fe80::f816:3eff:fe12:27cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.065s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=17,icmp_type=136,nd_target=fe80::f816:3eff:fe1c:6be1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.023s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=16,icmp_type=136,nd_target=fe80::f816:3eff:fef2:b39e actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=518.061s, table=24, n_packets=0, n_bytes=0, idle_age=518, priority=2,icmp6,in_port=20,icmp_type=136,nd_target=fe80::f816:3eff:fef1:4ed5 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.302s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=15,arp_spa=192.168.21.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.261s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=11,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.222s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=14,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.184s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=13,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.145s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=10,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.109s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=12,arp_spa=192.168.21.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.053s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=17,arp_spa=192.168.22.7 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.012s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=16,arp_spa=192.168.22.6 actions=resubmit(,25)
 cookie=0x0, duration=6072.377s, table=24, n_packets=0, n_bytes=0, idle_age=6072, priority=2,arp,in_port=16,arp_spa=192.168.23.12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=518.053s, table=24, n_packets=3, n_bytes=126, idle_age=89, priority=2,arp,in_port=20,arp_spa=192.168.22.15 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7772.910s, table=24, n_packets=402, n_bytes=16884, idle_age=79, priority=0 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=7771.330s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=15,dl_src=fa:16:3e:61:1b:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.286s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=11,dl_src=fa:16:3e:94:a0:ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.248s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=14,dl_src=fa:16:3e:87:53:1f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.205s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=13,dl_src=fa:16:3e:c0:93:0c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.168s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=10,dl_src=fa:16:3e:ad:cc:f6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.132s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=12,dl_src=fa:16:3e:12:27:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.090s, table=25, n_packets=827, n_bytes=145554, idle_age=1, priority=2,in_port=17,dl_src=fa:16:3e:1c:6b:e1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.037s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=16,dl_src=fa:16:3e:f2:b3:9e actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=518.073s, table=25, n_packets=57, n_bytes=9414, idle_age=89, priority=2,in_port=20,dl_src=fa:16:3e:f1:4e:d5 actions=NORMAL
[root@slot13 ~]# 

[root@slot5 tmp]# nova list | grep test
| 4fc3952d-979b-4087-8a38-77e5ae1e2ff7 | test1 | ACTIVE | -          | Running     | OSS_Service=192.168.22.10 |
| 066c3e24-3bcc-49a3-b411-f2edf9edcf0b | test2 | ACTIVE | -          | Running     | OSS_Service=192.168.22.11 |
| ebe53260-ca4d-41d0-b640-0bd526aa1859 | test5 | ACTIVE | -          | Running     | OSS_Service=192.168.22.14 |
| 898bbf05-36bb-4709-86c3-6619c7fedfe7 | test6 | ACTIVE | -          | Running     | OSS_Service=192.168.22.15 |

[root@slot5 tmp]# neutron net-show OSS_Service
+---------------------------+--------------------------------------+
| Field                     | Value                                |
+---------------------------+--------------------------------------+
| admin_state_up            | True                                 |
| availability_zone_hints   |                                      |
| availability_zones        | nova                                 |
| created_at                | 2016-12-06T13:21:25                  |
| description               |                                      |
| id                        | 8b982c9e-8a24-4091-a53a-fb8d673f798b |
| ipv4_address_scope        |                                      |
| ipv6_address_scope        |                                      |
| is_default                | False                                |
| mtu                       | 1500                                 |
| name                      | OSS_Service                          |
| port_security_enabled     | True                                 |
| provider:network_type     | vlan                                 |
| provider:physical_network | Date_OVS_vlan_phynet0                |
| provider:segmentation_id  | 3099                                 |
| qos_policy_id             |                                      |
| router:external           | True                                 |
| shared                    | True                                 |
| status                    | ACTIVE                               |
| subnets                   | d6762185-1fbf-4f2b-ab66-73047765dc88 |
| tags                      |                                      |
| tenant_id                 | fe50aad050494868a67d8d05d5313869     |
| updated_at                | 2016-12-06T13:21:26                  |
+---------------------------+--------------------------------------+

```



### test ok 
![Screenshot of solution](http://image18-c.poco.cn/mypoco/myphoto/20161207/12/560211420161207124646076.png?1920x1080_130)


# Solution

"
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

## on slot13 

### delete vm test4 on slot3 ,then create a new vm called test5 
```sh 
[root@slot13 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa27c0dc9aff087e6, duration=3291.839s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=19,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.798s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=15,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.756s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=11,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.717s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=14,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.679s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=13,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.639s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=10,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.603s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=12,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.550s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=17,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.509s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,icmp6,in_port=16,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.830s, table=0, n_packets=409, n_bytes=17178, idle_age=318, priority=10,arp,in_port=19 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.788s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=15 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.747s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=11 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.707s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=14 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.668s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=13 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.631s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=10 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.594s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=12 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.538s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=17 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3291.498s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=10,arp,in_port=16 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=3293.292s, table=0, n_packets=215, n_bytes=13266, idle_age=17, priority=2,in_port=1 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3293.213s, table=0, n_packets=0, n_bytes=0, idle_age=3293, priority=2,in_port=2 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3291.855s, table=0, n_packets=108, n_bytes=10584, idle_age=323, priority=9,in_port=19 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.810s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=15 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.766s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=11 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.729s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=14 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.688s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=13 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.649s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=10 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.612s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.566s, table=0, n_packets=355, n_bytes=62274, idle_age=163, priority=9,in_port=17 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.518s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=9,in_port=16 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3292.045s, table=0, n_packets=526, n_bytes=37768, idle_age=216, priority=3,in_port=2,dl_vlan=3099 actions=mod_vlan_vid:2,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3292.022s, table=0, n_packets=71, n_bytes=4544, idle_age=77, priority=3,in_port=2,dl_vlan=4004 actions=mod_vlan_vid:3,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.968s, table=0, n_packets=0, n_bytes=0, idle_age=3291, priority=3,in_port=2,dl_vlan=4010 actions=mod_vlan_vid:1,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3293.407s, table=0, n_packets=0, n_bytes=0, idle_age=3293, priority=0 actions=NORMAL
 cookie=0x0, duration=1266.651s, table=2, n_packets=0, n_bytes=0, idle_age=1266, priority=1,arp,in_port=19 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3293.403s, table=23, n_packets=0, n_bytes=0, idle_age=3293, priority=0 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3291.843s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=19,icmp_type=136,nd_target=fe80::f816:3eff:feeb:7181 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.805s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=15,icmp_type=136,nd_target=fe80::f816:3eff:fe61:1bcf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.761s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=11,icmp_type=136,nd_target=fe80::f816:3eff:fe94:a0ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.723s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=14,icmp_type=136,nd_target=fe80::f816:3eff:fe87:531f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.683s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=13,icmp_type=136,nd_target=fe80::f816:3eff:fec0:930c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.643s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=10,icmp_type=136,nd_target=fe80::f816:3eff:fead:ccf6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.608s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=12,icmp_type=136,nd_target=fe80::f816:3eff:fe12:27cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.555s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=17,icmp_type=136,nd_target=fe80::f816:3eff:fe1c:6be1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.513s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,icmp6,in_port=16,icmp_type=136,nd_target=fe80::f816:3eff:fef2:b39e actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.835s, table=24, n_packets=3, n_bytes=126, idle_age=1545, priority=2,arp,in_port=19,arp_spa=192.168.22.12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.792s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=15,arp_spa=192.168.21.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.751s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=11,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.712s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=14,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.674s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=13,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.635s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=10,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.599s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=12,arp_spa=192.168.21.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.543s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=17,arp_spa=192.168.22.7 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3291.502s, table=24, n_packets=0, n_bytes=0, idle_age=3291, priority=2,arp,in_port=16,arp_spa=192.168.22.6 actions=resubmit(,25)
 cookie=0x0, duration=1592.867s, table=24, n_packets=0, n_bytes=0, idle_age=1592, priority=2,arp,in_port=16,arp_spa=192.168.23.12 actions=resubmit(,25)
 cookie=0x0, duration=1279.080s, table=24, n_packets=10, n_bytes=420, idle_age=318, priority=2,arp,in_port=19,arp_spa=192.168.23.12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=3293.400s, table=24, n_packets=396, n_bytes=16632, idle_age=1280, priority=0 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=3291.881s, table=25, n_packets=121, n_bytes=11130, idle_age=318, priority=2,in_port=19,dl_src=fa:16:3e:eb:71:81 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.820s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=15,dl_src=fa:16:3e:61:1b:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.776s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=11,dl_src=fa:16:3e:94:a0:ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.738s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=14,dl_src=fa:16:3e:87:53:1f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.695s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=13,dl_src=fa:16:3e:c0:93:0c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.658s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=10,dl_src=fa:16:3e:ad:cc:f6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.622s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=12,dl_src=fa:16:3e:12:27:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.580s, table=25, n_packets=355, n_bytes=62274, idle_age=163, priority=2,in_port=17,dl_src=fa:16:3e:1c:6b:e1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=3291.527s, table=25, n_packets=0, n_bytes=0, idle_age=3291, priority=2,in_port=16,dl_src=fa:16:3e:f2:b3:9e actions=NORMAL
[root@slot13 ~]# ovs-ofctl show br-int 
OFPT_FEATURES_REPLY (xid=0x2): dpid:00006e9ababd4e4c
n_tables:254, n_buffers:256
capabilities: FLOW_STATS TABLE_STATS PORT_STATS QUEUE_STATS ARP_MATCH_IP
actions: output enqueue set_vlan_vid set_vlan_pcp strip_vlan mod_dl_src mod_dl_dst mod_nw_src mod_nw_dst mod_nw_tos mod_tp_src mod_tp_dst
 1(int-br-ex): addr:36:b3:1c:a3:ca:78
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 2(int-br-phynet0): addr:e2:62:1a:1a:c0:11
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 10(tap0192cdd5-8b): addr:fe:16:3e:ad:cc:f6
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 11(tapbb02fc07-75): addr:fe:16:3e:94:a0:ed
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 12(tap71ca4827-2a): addr:fe:16:3e:12:27:cf
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 13(tapa44491ac-89): addr:fe:16:3e:c0:93:0c
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 14(tapfe81779c-28): addr:fe:16:3e:87:53:1f
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 15(tap3dd9d769-55): addr:fe:16:3e:61:1b:cf
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 16(tap6e107bfb-a0): addr:fe:16:3e:f2:b3:9e
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 17(tap3330a0be-05): addr:fe:16:3e:1c:6b:e1
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 20(tapcad344da-c9): addr:fe:16:3e:f1:4e:d5
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 LOCAL(br-int): addr:6e:9a:ba:bd:4e:4c
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
OFPT_GET_CONFIG_REPLY (xid=0x4): frags=normal miss_send_len=0

now the port 19 is absent, it appears port 20 


```

### issue screenshot 
![Screenshot of issue](http://image18-c.poco.cn/mypoco/myphoto/20161207/12/560211420161207124340023.png?1920x1080_130)


### flow table of br-int on slot13 
```sh
[root@slot13 ~]# ovs-ofctl add-flow br-int "table=24,priority=10,arp,actions=NORMAL"
[root@slot13 ~]# ovs-ofctl dump-flows br-int 
NXST_FLOW reply (xid=0x4):
 cookie=0xa27c0dc9aff087e6, duration=7771.308s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=15,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.266s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=11,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.227s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=14,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.189s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=13,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.149s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=10,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.113s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=12,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.060s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=17,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.019s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,icmp6,in_port=16,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=518.057s, table=0, n_packets=0, n_bytes=0, idle_age=518, priority=10,icmp6,in_port=20,icmp_type=136 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.298s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=15 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.257s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=11 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.217s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=14 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.178s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=13 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.141s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=10 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.104s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=12 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.048s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=17 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7771.008s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=10,arp,in_port=16 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=518.049s, table=0, n_packets=9, n_bytes=378, idle_age=79, priority=10,arp,in_port=20 actions=resubmit(,24)
 cookie=0xa27c0dc9aff087e6, duration=7772.802s, table=0, n_packets=562, n_bytes=36498, idle_age=4, priority=2,in_port=1 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=7772.723s, table=0, n_packets=0, n_bytes=0, idle_age=7772, priority=2,in_port=2 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=7771.320s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=15 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.276s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=11 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.239s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=14 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.198s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=13 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.159s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=10 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.122s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.076s, table=0, n_packets=827, n_bytes=145554, idle_age=1, priority=9,in_port=17 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.028s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=9,in_port=16 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=518.065s, table=0, n_packets=54, n_bytes=9288, idle_age=93, priority=9,in_port=20 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.555s, table=0, n_packets=3076, n_bytes=295610, idle_age=79, priority=3,in_port=2,dl_vlan=3099 actions=mod_vlan_vid:2,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.532s, table=0, n_packets=163, n_bytes=10612, idle_age=155, priority=3,in_port=2,dl_vlan=4004 actions=mod_vlan_vid:3,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.478s, table=0, n_packets=0, n_bytes=0, idle_age=7771, priority=3,in_port=2,dl_vlan=4010 actions=mod_vlan_vid:1,NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7772.917s, table=0, n_packets=0, n_bytes=0, idle_age=7772, priority=0 actions=NORMAL
 cookie=0x0, duration=5746.161s, table=2, n_packets=0, n_bytes=0, idle_age=5746, priority=1,arp,in_port=19 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7772.913s, table=23, n_packets=0, n_bytes=0, idle_age=7772, priority=0 actions=drop
 cookie=0x0, duration=5.713s, table=24, n_packets=0, n_bytes=0, idle_age=5, priority=10,arp actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.315s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=15,icmp_type=136,nd_target=fe80::f816:3eff:fe61:1bcf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.271s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=11,icmp_type=136,nd_target=fe80::f816:3eff:fe94:a0ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.233s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=14,icmp_type=136,nd_target=fe80::f816:3eff:fe87:531f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.193s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=13,icmp_type=136,nd_target=fe80::f816:3eff:fec0:930c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.153s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=10,icmp_type=136,nd_target=fe80::f816:3eff:fead:ccf6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.118s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=12,icmp_type=136,nd_target=fe80::f816:3eff:fe12:27cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.065s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=17,icmp_type=136,nd_target=fe80::f816:3eff:fe1c:6be1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.023s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,icmp6,in_port=16,icmp_type=136,nd_target=fe80::f816:3eff:fef2:b39e actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=518.061s, table=24, n_packets=0, n_bytes=0, idle_age=518, priority=2,icmp6,in_port=20,icmp_type=136,nd_target=fe80::f816:3eff:fef1:4ed5 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.302s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=15,arp_spa=192.168.21.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.261s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=11,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.222s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=14,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.184s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=13,arp_spa=192.168.22.3 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.145s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=10,arp_spa=192.168.22.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.109s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=12,arp_spa=192.168.21.2 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.053s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=17,arp_spa=192.168.22.7 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7771.012s, table=24, n_packets=0, n_bytes=0, idle_age=7771, priority=2,arp,in_port=16,arp_spa=192.168.22.6 actions=resubmit(,25)
 cookie=0x0, duration=6072.377s, table=24, n_packets=0, n_bytes=0, idle_age=6072, priority=2,arp,in_port=16,arp_spa=192.168.23.12 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=518.053s, table=24, n_packets=3, n_bytes=126, idle_age=89, priority=2,arp,in_port=20,arp_spa=192.168.22.15 actions=resubmit(,25)
 cookie=0xa27c0dc9aff087e6, duration=7772.910s, table=24, n_packets=402, n_bytes=16884, idle_age=79, priority=0 actions=drop
 cookie=0xa27c0dc9aff087e6, duration=7771.330s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=15,dl_src=fa:16:3e:61:1b:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.286s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=11,dl_src=fa:16:3e:94:a0:ed actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.248s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=14,dl_src=fa:16:3e:87:53:1f actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.205s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=13,dl_src=fa:16:3e:c0:93:0c actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.168s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=10,dl_src=fa:16:3e:ad:cc:f6 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.132s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=12,dl_src=fa:16:3e:12:27:cf actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.090s, table=25, n_packets=827, n_bytes=145554, idle_age=1, priority=2,in_port=17,dl_src=fa:16:3e:1c:6b:e1 actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=7771.037s, table=25, n_packets=0, n_bytes=0, idle_age=7771, priority=2,in_port=16,dl_src=fa:16:3e:f2:b3:9e actions=NORMAL
 cookie=0xa27c0dc9aff087e6, duration=518.073s, table=25, n_packets=57, n_bytes=9414, idle_age=89, priority=2,in_port=20,dl_src=fa:16:3e:f1:4e:d5 actions=NORMAL
[root@slot13 ~]# 

[root@slot5 tmp]# nova list | grep test
| 4fc3952d-979b-4087-8a38-77e5ae1e2ff7 | test1 | ACTIVE | -          | Running     | OSS_Service=192.168.22.10 |
| 066c3e24-3bcc-49a3-b411-f2edf9edcf0b | test2 | ACTIVE | -          | Running     | OSS_Service=192.168.22.11 |
| ebe53260-ca4d-41d0-b640-0bd526aa1859 | test5 | ACTIVE | -          | Running     | OSS_Service=192.168.22.14 |
| 898bbf05-36bb-4709-86c3-6619c7fedfe7 | test6 | ACTIVE | -          | Running     | OSS_Service=192.168.22.15 |

[root@slot5 tmp]# neutron net-show OSS_Service
+---------------------------+--------------------------------------+
| Field                     | Value                                |
+---------------------------+--------------------------------------+
| admin_state_up            | True                                 |
| availability_zone_hints   |                                      |
| availability_zones        | nova                                 |
| created_at                | 2016-12-06T13:21:25                  |
| description               |                                      |
| id                        | 8b982c9e-8a24-4091-a53a-fb8d673f798b |
| ipv4_address_scope        |                                      |
| ipv6_address_scope        |                                      |
| is_default                | False                                |
| mtu                       | 1500                                 |
| name                      | OSS_Service                          |
| port_security_enabled     | True                                 |
| provider:network_type     | vlan                                 |
| provider:physical_network | Date_OVS_vlan_phynet0                |
| provider:segmentation_id  | 3099                                 |
| qos_policy_id             |                                      |
| router:external           | True                                 |
| shared                    | True                                 |
| status                    | ACTIVE                               |
| subnets                   | d6762185-1fbf-4f2b-ab66-73047765dc88 |
| tags                      |                                      |
| tenant_id                 | fe50aad050494868a67d8d05d5313869     |
| updated_at                | 2016-12-06T13:21:26                  |
+---------------------------+--------------------------------------+

```



### test ok 
![Screenshot of solution](http://image18-c.poco.cn/mypoco/myphoto/20161207/12/560211420161207124646076.png?1920x1080_130)


# Solution

on each compute node , run the following command:

```sh
ovs-ofctl add-flow br-int "table=24,priority=10,arp,actions=NORMAL"
```







