```bash 

[root@director ~]# ovs-vsctl show 
90898546-cc35-420b-9e0f-1f07469a0726
    Bridge br-int
        fail_mode: secure
        Port int-br-ctlplane
            Interface int-br-ctlplane
                type: patch
                options: {peer=phy-br-ctlplane}
        Port br-int
            Interface br-int
                type: internal
        Port "tap3e5b5783-26"
            tag: 10
            Interface "tap3e5b5783-26"
                type: internal
    Bridge br-ctlplane
        fail_mode: secure
        Port "enp129s0f0"
            Interface "enp129s0f0"
        Port br-ctlplane
            Interface br-ctlplane
                type: internal
        Port phy-br-ctlplane
            Interface phy-br-ctlplane
                type: patch
                options: {peer=int-br-ctlplane}
    ovs_version: "2.4.0"

 


[root@director ~]# ovs-ofctl dump-flows br-int
NXST_FLOW reply (xid=0x4):
 cookie=0xa559d2777a5b6547, duration=54260.142s, table=0, n_packets=14362, n_bytes=1015055, idle_age=30, priority=2,in_port=1 actions=drop
 cookie=0xa559d2777a5b6547, duration=54260.243s, table=0, n_packets=0, n_bytes=0, idle_age=54260, priority=0 actions=NORMAL
 cookie=0xa559d2777a5b6547, duration=54260.238s, table=23, n_packets=0, n_bytes=0, idle_age=54260, priority=0 actions=drop
 cookie=0xa559d2777a5b6547, duration=54260.233s, table=24, n_packets=0, n_bytes=0, idle_age=54260, priority=0 actions=drop
[root@director ~]# 
[root@director ~]# ovs-ofctl dump-flows br-ctlplane
NXST_FLOW reply (xid=0x4):
 cookie=0xbd7eed024a605b4b, duration=54294.767s, table=0, n_packets=0, n_bytes=0, idle_age=54294, priority=2,in_port=2 actions=drop
 cookie=0xbd7eed024a605b4b, duration=54294.813s, table=0, n_packets=4357160, n_bytes=6304103040, idle_age=2, priority=0 actions=NORMAL
[root@director ~]# ovs-ofctl show br-ctlplane 
OFPT_FEATURES_REPLY (xid=0x2): dpid:00007ca23efc3fa1
n_tables:254, n_buffers:256
capabilities: FLOW_STATS TABLE_STATS PORT_STATS QUEUE_STATS ARP_MATCH_IP
actions: output enqueue set_vlan_vid set_vlan_pcp strip_vlan mod_dl_src mod_dl_dst mod_nw_src mod_nw_dst mod_nw_tos mod_tp_src mod_tp_dst
 1(enp129s0f0): addr:7c:a2:3e:fc:3f:a1
     config:     0
     state:      0
     current:    10GB-FD FIBER
     advertised: 10GB-FD FIBER
     supported:  10GB-FD FIBER
     speed: 10000 Mbps now, 10000 Mbps max
 2(phy-br-ctlplane): addr:6a:2b:1a:a1:33:73
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 LOCAL(br-ctlplane): addr:7c:a2:3e:fc:3f:a1
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
OFPT_GET_CONFIG_REPLY (xid=0x4): frags=normal miss_send_len=0
[root@director ~]# ovs-ofctl show br-int
OFPT_FEATURES_REPLY (xid=0x2): dpid:0000723caf7e2142
n_tables:254, n_buffers:256
capabilities: FLOW_STATS TABLE_STATS PORT_STATS QUEUE_STATS ARP_MATCH_IP
actions: output enqueue set_vlan_vid set_vlan_pcp strip_vlan mod_dl_src mod_dl_dst mod_nw_src mod_nw_dst mod_nw_tos mod_tp_src mod_tp_dst
 1(int-br-ctlplane): addr:9e:41:45:61:e6:21
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 12(tap3e5b5783-26): addr:00:00:00:00:00:00
     config:     PORT_DOWN
     state:      LINK_DOWN
     speed: 0 Mbps now, 0 Mbps max
 LOCAL(br-int): addr:72:3c:af:7e:21:42
     config:     PORT_DOWN
     state:      LINK_DOWN
     speed: 0 Mbps now, 0 Mbps max
OFPT_GET_CONFIG_REPLY (xid=0x4): frags=normal miss_send_len=0
```


