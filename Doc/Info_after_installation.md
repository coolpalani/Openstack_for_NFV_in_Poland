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







## hostname 

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


