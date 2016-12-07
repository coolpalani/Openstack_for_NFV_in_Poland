**Operations record**

**********

# introspection
```bash
[stack@director ~]$ heat stack-delete -y overcloud 
WARNING (shell) "heat stack-delete" is deprecated, please use "openstack stack delete" instead
Request to delete stack overcloud has been accepted.
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ ironic node-list
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| 3e57d7ca-eac9-4b8e-8808-f8019c97a508 | None | None          | power off   | available          | False       |
| 22c20294-b127-42da-aac9-63a1b23609e0 | None | None          | power off   | available          | False       |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ openstack baremetal introspection bulk start 
Setting nodes for introspection to manageable...
Starting introspection of node: 3e57d7ca-eac9-4b8e-8808-f8019c97a508
Starting introspection of node: 22c20294-b127-42da-aac9-63a1b23609e0
Waiting for introspection to finish...
Introspection for UUID 3e57d7ca-eac9-4b8e-8808-f8019c97a508 finished successfully.
Introspection for UUID 22c20294-b127-42da-aac9-63a1b23609e0 finished successfully.
Setting manageable nodes to available...
Node 3e57d7ca-eac9-4b8e-8808-f8019c97a508 has been set to available.
Node 22c20294-b127-42da-aac9-63a1b23609e0 has been set to available.
Introspection completed.
[stack@director ~]$ openstack baremetal introspection bulk status
+--------------------------------------+----------+-------+
| Node UUID                            | Finished | Error |
+--------------------------------------+----------+-------+
| 3e57d7ca-eac9-4b8e-8808-f8019c97a508 | True     | None  |
| 22c20294-b127-42da-aac9-63a1b23609e0 | True     | None  |
+--------------------------------------+----------+-------+
```
# find the nodes failed to boot from pxe because can't asssign IP address from Director 

![boot failed](http://image18-c.poco.cn/mypoco/myphoto/20161201/13/560211420161201134700084.png?1920x1080_130)

# check iptables

```bash 
[root@director httpboot]# iptables -nvL 
Chain INPUT (policy ACCEPT 182K packets, 845M bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ironic-inspector  udp  --  br-ctlplane *       0.0.0.0/0            0.0.0.0/0            udp dpt:67
  13M   41G neutron-openvswi-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  21M   71G nova-api-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 7512  533K neutron-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
 7512  533K neutron-openvswi-FORWARD  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
 7540  535K nova-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
 7540  535K nova-api-FORWARD  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 182K packets, 845M bytes)
 pkts bytes target     prot opt in     out     source               destination         
  16M   77G neutron-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  16M   77G neutron-openvswi-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  17M   77G nova-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  17M   77G nova-api-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ironic-inspector (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable

Chain neutron-filter-top (2 references)
 pkts bytes target     prot opt in     out     source               destination         
  73M  330G neutron-openvswi-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain neutron-openvswi-FORWARD (1 references)
 pkts bytes target     prot opt in     out     source               destination         
76880 5476K neutron-openvswi-scope  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain neutron-openvswi-INPUT (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain neutron-openvswi-OUTPUT (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain neutron-openvswi-local (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain neutron-openvswi-scope (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain neutron-openvswi-sg-chain (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain neutron-openvswi-sg-fallback (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            /* Default drop rule for unmatched traffic. */

Chain nova-api-FORWARD (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain nova-api-INPUT (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            172.23.85.106        tcp dpt:8775

Chain nova-api-OUTPUT (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain nova-api-local (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain nova-filter-top (2 references)
 pkts bytes target     prot opt in     out     source               destination         
  17M   77G nova-api-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
[root@director httpboot]# 

```








# deploy
```bash
[stack@director ~]$ 
[stack@director ~]$ ./two-deploy.sh 
Deploying templates in the directory /home/stack/templates/my-overcloud
2016-12-01 11:35:55 [overcloud]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:55 [Networks]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [HorizonSecret]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [MysqlRootPassword]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [HeatAuthEncryptionKey]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [RabbitCookie]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [VipConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [MysqlClusterUniquePart]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [PcsdPassword]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [HorizonSecret]: CREATE_COMPLETE state changed
2016-12-01 11:35:56 [MysqlRootPassword]: CREATE_COMPLETE state changed
2016-12-01 11:35:56 [HeatAuthEncryptionKey]: CREATE_COMPLETE state changed
2016-12-01 11:35:56 [RabbitCookie]: CREATE_COMPLETE state changed
2016-12-01 11:35:56 [MysqlClusterUniquePart]: CREATE_COMPLETE state changed
2016-12-01 11:35:56 [PcsdPassword]: CREATE_COMPLETE state changed
2016-12-01 11:35:56 [overcloud-VipConfig-2oeuhrs5wmue]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:56 [VipConfigImpl]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [VipConfigImpl]: CREATE_COMPLETE state changed
2016-12-01 11:35:56 [overcloud-VipConfig-2oeuhrs5wmue]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:35:56 [overcloud-Networks-pid2npz2dwsj]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:56 [ManagementNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [InternalNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [TenantNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [ExternalNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [overcloud-Networks-pid2npz2dwsj-ManagementNetwork-si5lw3hhgcdw]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:56 [overcloud-Networks-pid2npz2dwsj-ManagementNetwork-si5lw3hhgcdw]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:35:56 [overcloud-Networks-pid2npz2dwsj-InternalNetwork-yhfdbh2vzy7w]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:56 [InternalApiNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:56 [overcloud-Networks-pid2npz2dwsj-TenantNetwork-hob64qh43xat]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:56 [TenantNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [VipConfig]: CREATE_COMPLETE state changed
2016-12-01 11:35:57 [StorageMgmtNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [StorageNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [ManagementNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:57 [InternalApiNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:57 [InternalApiSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [overcloud-Networks-pid2npz2dwsj-StorageMgmtNetwork-xdyuztcjlubh]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:57 [StorageMgmtNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [StorageMgmtNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:57 [StorageMgmtSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [overcloud-Networks-pid2npz2dwsj-StorageNetwork-bd2tv3kc2tmp]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:57 [StorageNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [TenantNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:57 [TenantSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [overcloud-Networks-pid2npz2dwsj-ExternalNetwork-wr7vevn563ru]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:35:57 [ExternalNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:57 [ExternalNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:57 [ExternalSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:58 [InternalApiSubnet]: CREATE_COMPLETE state changed
2016-12-01 11:35:58 [overcloud-Networks-pid2npz2dwsj-InternalNetwork-yhfdbh2vzy7w]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:35:58 [StorageNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:58 [StorageSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 11:35:58 [TenantSubnet]: CREATE_COMPLETE state changed
2016-12-01 11:35:58 [overcloud-Networks-pid2npz2dwsj-TenantNetwork-hob64qh43xat]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:35:59 [InternalNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:59 [TenantNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:35:59 [StorageMgmtSubnet]: CREATE_COMPLETE state changed
2016-12-01 11:35:59 [overcloud-Networks-pid2npz2dwsj-StorageMgmtNetwork-xdyuztcjlubh]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:35:59 [StorageSubnet]: CREATE_COMPLETE state changed
2016-12-01 11:35:59 [overcloud-Networks-pid2npz2dwsj-StorageNetwork-bd2tv3kc2tmp]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:35:59 [ExternalSubnet]: CREATE_COMPLETE state changed
2016-12-01 11:35:59 [overcloud-Networks-pid2npz2dwsj-ExternalNetwork-wr7vevn563ru]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:00 [Networks]: CREATE_COMPLETE state changed
2016-12-01 11:36:00 [ObjectStorage]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:00 [CephStorage]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:00 [overcloud-ObjectStorage-qkcqmgjxarlj]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:00 [overcloud-ObjectStorage-qkcqmgjxarlj]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:00 [StorageNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:36:00 [ExternalNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:36:00 [StorageMgmtNetwork]: CREATE_COMPLETE state changed
2016-12-01 11:36:00 [overcloud-Networks-pid2npz2dwsj]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:01 [ControlVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:01 [overcloud-CephStorage-fgxuokdv6zvn]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:01 [overcloud-CephStorage-fgxuokdv6zvn]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:01 [ControlVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:02 [ControlVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 11:36:02 [CephStorage]: CREATE_COMPLETE state changed
2016-12-01 11:36:02 [ObjectStorage]: CREATE_COMPLETE state changed
2016-12-01 11:36:02 [RedisVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:03 [InternalApiVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:03 [overcloud-RedisVirtualIP-pg5i7ufex4cs]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:03 [VipPort]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:04 [StorageMgmtVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:04 [StorageVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:04 [VipPort]: CREATE_COMPLETE state changed
2016-12-01 11:36:04 [overcloud-RedisVirtualIP-pg5i7ufex4cs]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:04 [overcloud-InternalApiVirtualIP-hcgtlexdyfkw]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:04 [InternalApiPort]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:04 [InternalApiPort]: CREATE_COMPLETE state changed
2016-12-01 11:36:04 [overcloud-InternalApiVirtualIP-hcgtlexdyfkw]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:04 [overcloud-StorageMgmtVirtualIP-4digcqyas4ps]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:04 [StorageMgmtPort]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:05 [PublicVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:05 [overcloud-StorageVirtualIP-vucno2wlid5t]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:05 [StoragePort]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:05 [StorageMgmtPort]: CREATE_COMPLETE state changed
2016-12-01 11:36:05 [overcloud-StorageMgmtVirtualIP-4digcqyas4ps]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:05 [overcloud-PublicVirtualIP-sz54rgoq563h]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:05 [ExternalPort]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:06 [RedisVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 11:36:06 [InternalApiVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 11:36:06 [StorageMgmtVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 11:36:06 [PublicVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 11:36:06 [StoragePort]: CREATE_COMPLETE state changed
2016-12-01 11:36:06 [overcloud-StorageVirtualIP-vucno2wlid5t]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:06 [ExternalPort]: CREATE_COMPLETE state changed
2016-12-01 11:36:06 [overcloud-PublicVirtualIP-sz54rgoq563h]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:07 [StorageVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 11:36:07 [VipMap]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:07 [overcloud-VipMap-7noxpwfhqwcj]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:07 [overcloud-VipMap-7noxpwfhqwcj]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:08 [VipMap]: CREATE_COMPLETE state changed
2016-12-01 11:36:08 [EndpointMap]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:09 [overcloud-EndpointMap-xhx4rnkrctzx]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:09 [overcloud-EndpointMap-xhx4rnkrctzx]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:10 [EndpointMap]: CREATE_COMPLETE state changed
2016-12-01 11:36:10 [Compute]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:12 [BlockStorage]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:12 [Controller]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:12 [overcloud-BlockStorage-4ujvjrbizyb3]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:12 [overcloud-BlockStorage-4ujvjrbizyb3]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 11:36:12 [overcloud-Compute-kwpylldgss6i]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:12 [0]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:14 [overcloud-Controller-byd6tbpzwfrp]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:14 [0]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:15 [BlockStorage]: CREATE_COMPLETE state changed
2016-12-01 11:36:15 [overcloud-Compute-kwpylldgss6i-0-qlhjxabzvayj]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:15 [NovaComputeConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:15 [UpdateConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:15 [NodeUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:15 [NodeAdminUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:15 [UpdateConfig]: CREATE_COMPLETE state changed
2016-12-01 11:36:15 [NovaComputeConfig]: CREATE_COMPLETE state changed
2016-12-01 11:36:16 [NodeUserData]: CREATE_COMPLETE state changed
2016-12-01 11:36:17 [overcloud-Controller-byd6tbpzwfrp-0-cwjam355c4e5]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 11:36:17 [NodeAdminUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:17 [UpdateConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:17 [NodeUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:17 [UpdateConfig]: CREATE_COMPLETE state changed
2016-12-01 11:36:17 [NodeAdminUserData]: CREATE_COMPLETE state changed
2016-12-01 11:36:17 [UserData]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:18 [NodeAdminUserData]: CREATE_COMPLETE state changed
2016-12-01 11:36:19 [NodeUserData]: CREATE_COMPLETE state changed
2016-12-01 11:36:19 [UserData]: CREATE_COMPLETE state changed
2016-12-01 11:36:19 [NovaCompute]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:20 [UserData]: CREATE_IN_PROGRESS state changed
2016-12-01 11:36:21 [UserData]: CREATE_COMPLETE state changed
2016-12-01 11:36:21 [Controller]: CREATE_IN_PROGRESS state changed
```

# check state on director 
```bash 
[root@director ironic-inspector]# netstat -anlp | grep :67 
udp        0      0 0.0.0.0:67              0.0.0.0:*                           205052/dnsmasq      
[root@director ironic-inspector]# 

[root@director ironic-inspector]# ps aux 
USER        PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root          1  0.0  0.0 196008  9224 ?        Ss   Nov24   0:49 /usr/lib/systemd/systemd --switched-root --system --deserialize 21
root          2  0.0  0.0      0     0 ?        S    Nov24   0:00 [kthreadd]
root          3  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/0]
root          5  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/0:0H]
root          8  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/0]
root          9  0.0  0.0      0     0 ?        S    Nov24   0:00 [rcu_bh]
root         10  0.4  0.0      0     0 ?        S    Nov24  44:41 [rcu_sched]
root         11  0.0  0.0      0     0 ?        S    Nov24   0:02 [watchdog/0]
root         12  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/1]
root         13  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/1]
root         14  0.0  0.0      0     0 ?        S    Nov24   0:03 [ksoftirqd/1]
root         17  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/2]
root         18  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/2]
root         19  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/2]
root         22  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/3]
root         23  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/3]
root         24  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/3]
root         26  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/3:0H]
root         27  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/4]
root         28  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/4]
root         29  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/4]
root         31  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/4:0H]
root         32  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/5]
root         33  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/5]
root         34  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/5]
root         36  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/5:0H]
root         37  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/6]
root         38  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/6]
root         39  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/6]
root         41  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/6:0H]
root         42  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/7]
root         43  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/7]
root         44  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/7]
root         46  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/7:0H]
root         47  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/8]
root         48  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/8]
root         49  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/8]
root         51  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/8:0H]
root         52  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/9]
root         53  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/9]
root         54  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/9]
root         56  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/9:0H]
root         57  0.0  0.0      0     0 ?        S    Nov24   0:02 [watchdog/10]
root         58  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/10]
root         59  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/10]
root         61  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/10:0H]
root         63  0.0  0.0      0     0 ?        S    Nov24   0:02 [watchdog/11]
root         64  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/11]
root         65  0.0  0.0      0     0 ?        S    Nov24   0:03 [ksoftirqd/11]
root         67  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/11:0H]
root         68  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/12]
root         69  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/12]
root         70  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/12]
root         73  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/13]
root         74  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/13]
root         75  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/13]
root         77  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/13:0H]
root         78  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/14]
root         79  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/14]
root         80  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/14]
root         81  0.0  0.0      0     0 ?        S    Nov24   0:05 [kworker/14:0]
root         82  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/14:0H]
root         83  0.0  0.0      0     0 ?        S    Nov24   0:02 [watchdog/15]
root         84  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/15]
root         85  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/15]
root         87  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/15:0H]
root         88  0.0  0.0      0     0 ?        S    Nov24   0:02 [watchdog/16]
root         89  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/16]
root         90  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/16]
root         92  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/16:0H]
root         93  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/17]
root         94  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/17]
root         95  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/17]
root         97  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/17:0H]
root         98  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/18]
root         99  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/18]
root        100  0.0  0.0      0     0 ?        S    Nov24   0:02 [ksoftirqd/18]
root        102  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/18:0H]
root        103  0.0  0.0      0     0 ?        S    Nov24   0:02 [watchdog/19]
root        104  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/19]
root        105  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/19]
root        107  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/19:0H]
root        108  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/20]
root        109  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/20]
root        110  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/20]
root        112  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/20:0H]
root        113  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/21]
root        114  0.0  0.0      0     0 ?        S    Nov24   0:04 [migration/21]
root        115  0.0  0.0      0     0 ?        S    Nov24   0:09 [ksoftirqd/21]
root        117  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/21:0H]
root        118  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/22]
root        119  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/22]
root        120  0.0  0.0      0     0 ?        S    Nov24   0:03 [ksoftirqd/22]
root        122  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/22:0H]
root        123  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/23]
root        124  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/23]
root        125  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/23]
root        126  0.0  0.0      0     0 ?        S    Nov24   0:00 [kworker/23:0]
root        127  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/23:0H]
root        128  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/24]
root        129  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/24]
root        130  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/24]
root        132  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/24:0H]
root        133  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/25]
root        134  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/25]
root        135  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/25]
root        137  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/25:0H]
root        138  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/26]
root        139  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/26]
root        140  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/26]
root        142  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/26:0H]
root        143  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/27]
root        144  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/27]
root        145  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/27]
root        147  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/27:0H]
root        148  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/28]
root        149  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/28]
root        150  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/28]
root        152  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/28:0H]
root        153  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/29]
root        154  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/29]
root        155  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/29]
root        157  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/29:0H]
root        158  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/30]
root        159  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/30]
root        160  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/30]
root        162  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/30:0H]
root        163  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/31]
root        164  0.0  0.0      0     0 ?        S    Nov24   0:04 [migration/31]
root        165  0.0  0.0      0     0 ?        S    Nov24   0:08 [ksoftirqd/31]
root        167  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/31:0H]
root        168  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/32]
root        169  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/32]
root        170  0.0  0.0      0     0 ?        S    Nov24   0:03 [ksoftirqd/32]
root        172  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/32:0H]
root        173  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/33]
root        174  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/33]
root        175  0.0  0.0      0     0 ?        S    Nov24   0:01 [ksoftirqd/33]
root        177  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/33:0H]
root        178  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/34]
root        179  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/34]
root        180  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/34]
root        182  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/34:0H]
root        183  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/35]
root        184  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/35]
root        185  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/35]
root        187  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/35:0H]
root        188  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/36]
root        189  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/36]
root        190  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/36]
root        192  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/36:0H]
root        193  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/37]
root        194  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/37]
root        195  0.0  0.0      0     0 ?        S    Nov24   8:44 [ksoftirqd/37]
root        197  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/37:0H]
root        198  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/38]
root        199  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/38]
root        200  0.0  0.0      0     0 ?        S    Nov24   0:00 [ksoftirqd/38]
root        201  0.0  0.0      0     0 ?        S    Nov24   0:00 [kworker/38:0]
root        202  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/38:0H]
root        203  0.0  0.0      0     0 ?        S    Nov24   0:01 [watchdog/39]
root        204  0.0  0.0      0     0 ?        S    Nov24   0:00 [migration/39]
root        205  0.0  0.0      0     0 ?        S    Nov24   0:04 [ksoftirqd/39]
root        207  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/39:0H]
root        210  0.0  0.0      0     0 ?        S<   Nov24   0:00 [khelper]
root        211  0.0  0.0      0     0 ?        S    Nov24   0:00 [kdevtmpfs]
root        212  0.0  0.0      0     0 ?        S<   Nov24   0:00 [netns]
root        213  0.0  0.0      0     0 ?        S    Nov24   0:01 [khungtaskd]
root        214  0.0  0.0      0     0 ?        S<   Nov24   0:00 [writeback]
root        215  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kintegrityd]
root        216  0.0  0.0      0     0 ?        S<   Nov24   0:00 [bioset]
root        217  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kblockd]
root        218  0.0  0.0      0     0 ?        S    Nov24   0:04 [kworker/0:1]
root        219  0.0  0.0      0     0 ?        S<   Nov24   0:00 [md]
root        220  0.0  0.0      0     0 ?        S    Nov24   0:04 [kworker/2:1]
root        226  0.0  0.0      0     0 ?        S    Nov24   0:00 [kswapd0]
root        227  0.0  0.0      0     0 ?        S    Nov24   0:00 [kswapd1]
root        228  0.0  0.0      0     0 ?        SN   Nov24   0:00 [ksmd]
root        229  0.0  0.0      0     0 ?        SN   Nov24   0:18 [khugepaged]
root        230  0.0  0.0      0     0 ?        S    Nov24   0:00 [fsnotify_mark]
root        231  0.0  0.0      0     0 ?        S<   Nov24   0:00 [crypto]
root        239  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kthrotld]
root        244  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kmpath_rdacd]
root        246  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kpsmoused]
root        248  0.0  0.0      0     0 ?        S<   Nov24   0:00 [ipv6_addrconf]
root        267  0.0  0.0      0     0 ?        S<   Nov24   0:00 [deferwq]
root        301  0.0  0.0      0     0 ?        S    Nov24   0:00 [kauditd]
root        423  0.0  0.0      0     0 ?        S    Nov24   0:05 [kworker/12:1]
root        495  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_0]
root        496  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_0]
root        497  0.0  0.0      0     0 ?        S<   Nov24   0:00 [ata_sff]
root        499  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_1]
root        500  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_1]
root        501  0.0  0.0      0     0 ?        S<   Nov24   0:00 [ixgbe]
root        502  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_wq_1]
root        504  0.0  0.0      0     0 ?        S    Nov24   0:00 [kworker/27:1]
root        509  0.0  0.0      0     0 ?        S    Nov24   0:00 [kworker/29:1]
root        529  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_2]
root        530  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_2]
root        531  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_3]
root        532  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_3]
root        533  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_4]
root        534  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_4]
root        535  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_5]
root        536  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_5]
root        537  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_6]
root        538  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_6]
root        539  0.0  0.0      0     0 ?        S    Nov24   0:00 [scsi_eh_7]
root        540  0.0  0.0      0     0 ?        S<   Nov24   0:00 [scsi_tmf_7]
root        547  0.0  0.0      0     0 ?        S    Nov24   0:00 [kworker/u481:6]
root        548  0.0  0.0      0     0 ?        S    Nov24   0:33 [kworker/u481:7]
root        554  0.0  0.0      0     0 ?        S    Nov24   0:02 [kworker/32:1]
root        594  0.0  0.0      0     0 ?        S    Nov24   0:05 [kworker/15:1]
root        597  0.0  0.0      0     0 ?        S    Nov24   0:02 [kworker/24:1]
root        601  0.0  0.0      0     0 ?        S    Nov24   0:02 [kworker/11:1]
root        603  0.0  0.0      0     0 ?        S    Nov24   0:01 [kworker/35:1]
root        605  0.0  0.0      0     0 ?        S    Nov24   0:01 [kworker/37:1]
root        607  0.0  0.0      0     0 ?        S    Nov24   0:00 [kworker/33:1]
root        609  0.0  0.0      0     0 ?        S    Nov24   0:01 [kworker/39:1]
root        702  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kdmflush]
root        703  0.0  0.0      0     0 ?        S<   Nov24   0:00 [bioset]
root        714  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kdmflush]
root        715  0.0  0.0      0     0 ?        S<   Nov24   0:00 [bioset]
root        728  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfsalloc]
root        729  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs_mru_cache]
root        730  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-buf/dm-0]
root        731  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-data/dm-0]
root        732  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-conv/dm-0]
root        733  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-cil/dm-0]
root        734  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-reclaim/dm-]
root        735  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-log/dm-0]
root        736  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-eofblocks/d]
root        737  0.0  0.0      0     0 ?        S    Nov24   2:31 [xfsaild/dm-0]
root        829  0.0  0.0 203316  4192 ?        Ss   Nov24   0:00 /usr/sbin/lvmetad -f
root        832  0.0  0.0  47532  5844 ?        Ss   Nov24   0:00 /usr/lib/systemd/systemd-udevd
root        930  0.0  0.0      0     0 ?        S<   Nov24   0:00 [edac-poller]
root       1035  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-buf/sda2]
root       1036  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-data/sda2]
root       1037  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-conv/sda2]
root       1038  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-cil/sda2]
root       1039  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-reclaim/sda]
root       1040  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-log/sda2]
root       1041  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-eofblocks/s]
root       1043  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/20:1H]
root       1044  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/3:1H]
root       1045  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kvm-irqfd-clean]
root       1046  0.0  0.0      0     0 ?        S    Nov24   0:00 [xfsaild/sda2]
root       1050  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kdmflush]
root       1051  0.0  0.0      0     0 ?        S<   Nov24   0:00 [bioset]
root       1061  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-buf/dm-2]
root       1062  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-data/dm-2]
root       1063  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-conv/dm-2]
root       1064  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-cil/dm-2]
root       1065  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-reclaim/dm-]
root       1066  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-log/dm-2]
root       1067  0.0  0.0      0     0 ?        S<   Nov24   0:00 [xfs-eofblocks/d]
root       1068  0.0  0.0      0     0 ?        S    Nov24   0:03 [xfsaild/dm-2]
root       1091  0.0  0.0  55416  1724 ?        S<sl Nov24   0:01 /sbin/auditd -n
dbus       1111  0.0  0.0  98488  2180 ?        Ssl  Nov24   0:22 /bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-acti
root       1116  0.0  0.0 436004  8800 ?        Ssl  Nov24   0:08 /usr/sbin/NetworkManager --no-daemon
root       1117  0.0  0.0  19712  1736 ?        Ss   Nov24   4:00 /usr/sbin/irqbalance --foreground
polkitd    1119  0.0  0.0 529048 13900 ?        Ssl  Nov24   0:00 /usr/lib/polkit-1/polkitd --no-debug
root       1120  0.0  0.0  24628  2180 ?        Ss   Nov24   0:07 /usr/lib/systemd/systemd-logind
chrony     1123  0.0  0.0 115848  1820 ?        S    Nov24   0:00 /usr/sbin/chronyd
root       1165  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/0:1H]
root       1196  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/11:1H]
root       1420  0.0  0.0 113340   628 ?        Ss   Nov24   0:00 /usr/bin/rhsmcertd
root       1421  0.0  0.0 553152 18980 ?        Ssl  Nov24   0:46 /usr/bin/python -Es /usr/sbin/tuned -l -P
root       1434  0.0  0.0 107912   564 ?        Ss   Nov24   0:00 rhnsd
root       1453  0.0  0.0  82468  1336 ?        Ss   Nov24   0:00 /usr/sbin/sshd
root       1525  0.0  0.0 110036   844 tty1     Ss+  Nov24   0:00 /sbin/agetty --noclear tty1 linux
root       2265  0.0  0.0  88976  2168 ?        Ss   Nov24   0:03 /usr/libexec/postfix/master -w
postfix    2305  0.0  0.0  89256  4152 ?        S    Nov24   0:00 qmgr -l -t unix -u
root       2759  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/25:1H]
root       2760  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/1:1H]
root       2761  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/4:1H]
root       2777  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/21:1H]
root       2785  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/14:1H]
root       2807  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/31:1H]
root       2816  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/17:1H]
root       2818  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/6:1H]
root       2832  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/34:1H]
root       2894  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/13:1H]
root       2895  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/15:1H]
root       2896  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/19:1H]
root       2897  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/16:1H]
root       2898  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/10:1H]
root       2899  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/37:1H]
root       2900  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/18:1H]
root       2901  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/5:1H]
root       2902  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/7:1H]
root       2905  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/9:1H]
root       2907  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/22:1H]
root       2909  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/8:1H]
root       2922  0.0  0.0 211584  2548 ?        Ssl  Nov24   0:00 /usr/sbin/rsyslogd -n
root       2929  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/39:1H]
root       2937  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/38:1H]
root       2938  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/26:1H]
root       2939  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/23:1H]
root       2972  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/30:1H]
root       2973  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/28:1H]
root       2974  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/29:1H]
root       2978  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/36:1H]
root       2979  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/35:1H]
root       2980  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/32:1H]
root       3064  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/24:1H]
root       3296  0.0  0.0      0     0 ?        S<   Nov24   0:00 [kworker/33:1H]
root       3678  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/10:0]
root      10036  0.1  0.0 168296 90492 ?        Ss   Nov25  10:19 /usr/lib/systemd/systemd-journald
root      15695  0.0  0.0      0     0 ?        S    00:00   0:00 [kworker/13:1]
root      15933  0.0  0.0      0     0 ?        S    00:00   0:00 [kworker/10:1]
root      16026  0.0  0.0      0     0 ?        S<   00:01   0:00 [kworker/2:0H]
root      21490  0.0  0.0 405176  5004 ?        Ssl  00:30   0:00 /usr/libexec/packagekitd
root      21530  0.0  0.0      0     0 ?        S    Nov25   0:01 [kworker/33:2]
apache    22214  0.0  0.0 158064  7408 ?        S    00:35   0:01 /usr/sbin/httpd -DFOREGROUND
apache    22373  0.0  0.0 158064  7400 ?        S    00:35   0:01 /usr/sbin/httpd -DFOREGROUND
root      22703  0.0  0.0  43320   704 ?        S<s  Nov25   0:00 ovsdb-server: monitoring pid 22704 (healthy)
root      22704  0.0  0.0  43752  2484 ?        S<   Nov25   1:05 ovsdb-server /etc/openvswitch/conf.db -vconsole:emer -vsyslog:err -vfile:info --
root      22719  0.0  0.0  46980   796 ?        S<s  Nov25   0:00 ovs-vswitchd: monitoring pid 22720 (healthy)
root      22720  0.6  0.0 1596248 186388 ?      S<Ll Nov25  49:35 ovs-vswitchd unix:/var/run/openvswitch/db.sock -vconsole:emer -vsyslog:err -vfil
memcach+  23762  0.0  0.0 2985840 8780 ?        Ssl  Nov25   0:19 /usr/bin/memcached -u memcached -p 11211 -m 244843 -c 8192 -l 0.0.0.0 -U 11211 -
root      24542  0.0  0.0  44592   636 ?        S    Nov25   0:04 /usr/lib64/erlang/erts-7.3.1/bin/epmd -daemon
rpc       25056  0.0  0.0  64948  1380 ?        Ss   Nov25   0:00 /sbin/rpcbind -w
root      25908  0.0  0.0 228988 14668 ?        Ss   Nov25   2:01 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25927  0.0  0.0 267884 26744 ?        S    Nov25   1:10 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25928  0.0  0.0 267900 26756 ?        S    Nov25   1:08 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25929  0.0  0.0 267908 26760 ?        S    Nov25   1:09 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25933  0.0  0.0 267920 26768 ?        S    Nov25   1:09 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25934  0.0  0.0 267928 26772 ?        S    Nov25   1:07 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25943  0.0  0.0 267940 26780 ?        S    Nov25   1:10 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25944  0.0  0.0 267948 26784 ?        S    Nov25   1:09 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      25953  0.0  0.0 267960 26792 ?        S    Nov25   1:07 /usr/bin/python /usr/bin/gunicorn --access-logfile - --max-requests 100 --gracef
root      26021  0.0  0.0      0     0 ?        S<   Nov25   0:00 [kworker/27:1H]
root      26318  0.0  0.0  27104  1072 ?        Ss   Nov25   0:00 /usr/sbin/xinetd -stayalive -pidfile /var/run/xinetd.pid
mysql     26620  0.0  0.0 113252  1576 ?        Ss   Nov25   0:00 /bin/sh /usr/bin/mysqld_safe --basedir=/usr
mysql     27131  1.2  0.4 21671140 1259496 ?    Sl   Nov25 104:22 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/li
rabbitmq  27537 10.4  0.3 24191844 961432 ?     Ssl  Nov25 844:18 /usr/lib64/erlang/erts-7.3.1/bin/beam.smp -W w -A 640 -P 1048576 -K true -- -roo
rabbitmq  28473  0.0  0.0  11536   444 ?        Ss   Nov25   0:00 inet_gethost 4
rabbitmq  28474  0.0  0.0  39392  1208 ?        S    Nov25   0:01 inet_gethost 4
root      29591  0.0  0.0      0     0 ?        S    01:13   0:00 [kworker/21:2]
root      33082  0.0  0.0 153708  5272 ?        Ss   Nov25   0:25 /usr/sbin/httpd -DFOREGROUND
root      33681  0.0  0.0      0     0 ?        S    01:37   0:00 [kworker/22:3]
root      40282  0.0  0.0 145056  5196 ?        Ss   02:15   0:00 sshd: root@pts/1
root      40285  0.0  0.0 117076  3852 pts/1    Ss   02:15   0:00 -bash
root      40430  0.0  0.0 189760  2452 pts/1    S    02:16   0:00 su - stack
stack     40431  0.0  0.0 117096  3916 pts/1    S+   02:16   0:00 -bash
root      46023  0.0  0.0      0     0 ?        S    02:50   0:00 [kworker/7:2]
root      75107  0.0  0.0 145056  5196 ?        Ss   03:42   0:00 sshd: root@pts/4
root      75110  0.0  0.0 116964  3648 pts/4    Ss   03:42   0:00 -bash
root      75187  0.0  0.0 189760  2456 pts/4    S    03:43   0:00 su - stack
stack     75188  0.0  0.0 117096  3916 pts/4    S    03:43   0:00 -bash
apache    75715  0.0  0.0 158064  7396 ?        S    03:45   0:00 /usr/sbin/httpd -DFOREGROUND
apache    75746  0.0  0.0 158064  7396 ?        S    03:45   0:00 /usr/sbin/httpd -DFOREGROUND
root      77212  0.0  0.0 145056  5196 ?        Ss   03:54   0:00 sshd: root@pts/5
root      77215  0.0  0.0 117072  3904 pts/5    Ss+  03:54   0:00 -bash
root      80545  0.0  0.0      0     0 ?        S    04:12   0:00 [kworker/26:0]
root      80591  0.0  0.0      0     0 ?        S    04:12   0:00 [kworker/23:2]
root      81304  0.0  0.0      0     0 ?        S    04:16   0:00 [kworker/9:1]
root      82484  0.0  0.0 145056  5192 ?        Ss   04:24   0:00 sshd: root@pts/6
root      82491  0.0  0.0 117076  3880 pts/6    Ss   04:24   0:00 -bash
root      82806  0.0  0.0      0     0 ?        S    04:25   0:00 [kworker/20:2]
root      83442  0.0  0.0      0     0 ?        S    04:30   0:00 [kworker/0:0]
root      85593  0.0  0.0 145056  5192 ?        Ss   04:41   0:00 sshd: root@pts/7
root      85596  0.0  0.0 116964  3640 pts/7    Ss+  04:41   0:00 -bash
root      86288  0.0  0.0      0     0 ?        S    04:45   0:00 [kworker/22:0]
root      94732  0.0  0.0      0     0 ?        S    Nov30   0:35 [kworker/u480:2]
root      95305  0.0  0.0      0     0 ?        S    05:38   0:00 [kworker/5:0]
postfix   96585  0.0  0.0  91164  3984 ?        S    05:45   0:00 pickup -l -t unix -u
root      96820  0.0  0.0      0     0 ?        S    05:47   0:00 [kworker/3:1]
apache    97124  0.0  0.0 155980  7280 ?        S    Nov30   0:03 /usr/sbin/httpd -DFOREGROUND
apache    97129  0.0  0.0 155980  7280 ?        S    Nov30   0:03 /usr/sbin/httpd -DFOREGROUND
apache    97130  0.0  0.0 155980  7280 ?        S    Nov30   0:03 /usr/sbin/httpd -DFOREGROUND
root     101301  0.0  0.0      0     0 ?        S    06:13   0:00 [kworker/8:0]
root     101302  0.0  0.0      0     0 ?        S<   06:13   0:00 [kworker/12:0H]
root     102100  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/26:2]
root     102920  0.0  0.0      0     0 ?        S    06:22   0:00 [kworker/21:1]
root     103081  0.0  0.0      0     0 ?        S    06:23   0:00 [kworker/6:2]
root     104416  0.0  0.0      0     0 ?        S    06:30   0:00 [kworker/31:0]
root     105114  0.0  0.0      0     0 ?        S    06:35   0:00 [kworker/7:0]
stack    105422  0.0  0.0 117096  2744 pts/4    S+   06:35   0:00 -bash
stack    105423  1.7  0.0 343504 52924 pts/4    S+   06:35   0:13 /usr/bin/python2 /bin/openstack overcloud deploy --templates /home/stack/templat
root     105574  0.0  0.0      0     0 ?        S    06:36   0:00 [kworker/9:0]
root     105658  0.0  0.0      0     0 ?        S<   06:37   0:00 [kworker/12:1H]
root     106486  0.0  0.0      0     0 ?        S    06:40   0:00 [kworker/u482:0]
root     107210  0.0  0.0      0     0 ?        S    06:40   0:00 [kworker/16:2]
root     107268  0.0  0.0      0     0 ?        S    06:41   0:00 [kworker/1:2]
root     107269  0.0  0.0      0     0 ?        S<   06:41   0:00 [kworker/1:0H]
root     107411  0.0  0.0      0     0 ?        S<   06:42   0:00 [kworker/2:2H]
root     107475  0.0  0.0      0     0 ?        S    06:42   0:00 [kworker/u480:1]
root     107519  0.0  0.0      0     0 ?        S    Nov30   0:01 [kworker/17:1]
root     107803  0.0  0.0      0     0 ?        S    06:43   0:00 [kworker/17:0]
root     108211  0.0  0.0      0     0 ?        S    06:43   0:00 [kworker/19:1]
root     108294  0.0  0.0      0     0 ?        S    06:43   0:00 [kworker/5:2]
root     108946  0.0  0.0      0     0 ?        S    06:44   0:00 [kworker/13:2]
root     109084  0.0  0.0      0     0 ?        S    06:44   0:00 [kworker/10:2]
root     109514  0.0  0.0      0     0 ?        S<   06:44   0:00 [kworker/12:2H]
root     109521  0.0  0.0      0     0 ?        S    06:44   0:00 [kworker/12:0]
root     109526  0.0  0.0      0     0 ?        S    06:44   0:00 [kworker/32:2]
swift    109964  3.8  0.0 259064 18992 ?        S    06:46   0:03 /usr/bin/python2 /usr/bin/swift-object-auditor /etc/swift/object-server.conf
root     110074  0.0  0.0      0     0 ?        S    06:47   0:00 [kworker/u480:0]
root     110178  0.0  0.0 151056  1852 pts/6    R+   06:48   0:00 ps aux
root     118102  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/20:0]
aodh     119250  0.0  0.0 631376  8900 ?        Sl   Nov27   0:12 /usr/sbin/httpd -DFOREGROUND
keystone 119251  1.3  0.0 1847024 132776 ?      Sl   Nov27  80:25 keystone-admin  -DFOREGROUND
keystone 119252  1.0  0.0 1126128 86840 ?       Sl   Nov27  62:42 keystone-main   -DFOREGROUND
root     124861  0.0  0.0      0     0 ?        S    Nov28   0:00 [kworker/u482:2]
root     134493  0.0  0.0      0     0 ?        S    Nov29   0:01 [kworker/13:0]
root     153274  0.0  0.0  31440   492 ?        Ss   Nov29   0:03 /usr/sbin/iscsid
root     153275  0.0  0.0  34116  5496 ?        S<Ls Nov29   0:00 /usr/sbin/iscsid
root     153278  0.0  0.0      0     0 ?        S<   Nov29   0:00 [iscsi_eh]
root     153290  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_8]
root     153291  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_8]
root     153293  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_8]
root     153301  0.0  0.0      0     0 ?        R    Nov29   0:02 [kworker/11:0]
root     153506  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_9]
root     153507  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_9]
root     153509  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_9]
root     153520  0.0  0.0      0     0 ?        S    Nov29   0:00 [kworker/36:2]
root     153624  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_10]
root     153625  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_10]
root     153627  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_10]
root     153638  0.0  0.0      0     0 ?        S    Nov29   0:00 [kworker/34:2]
root     153700  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_11]
root     153701  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_11]
root     153703  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_11]
root     153732  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_12]
root     153733  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_12]
root     153735  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_12]
root     153848  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_13]
root     153849  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_13]
root     153851  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_13]
root     154150  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_14]
root     154151  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_14]
root     154153  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_14]
root     154166  0.0  0.0      0     0 ?        S    Nov29   0:00 [kworker/28:2]
root     154167  0.0  0.0      0     0 ?        S    Nov29   0:00 [kworker/30:2]
root     154630  0.0  0.0      0     0 ?        S    Nov29   0:00 [scsi_eh_15]
root     154631  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_tmf_15]
root     154633  0.0  0.0      0     0 ?        S<   Nov29   0:00 [scsi_wq_15]
root     154669  0.0  0.0      0     0 ?        S    Nov29   0:02 [kworker/1:1]
root     156966  0.0  0.0      0     0 ?        S    Nov30   0:01 [kworker/18:1]
root     168816  0.0  0.0      0     0 ?        S    Nov29   0:02 [kworker/19:0]
root     169641  0.0  0.0      0     0 ?        S    Nov29   0:00 [kworker/4:1]
root     177637  0.0  0.0      0     0 ?        R    Nov30   0:00 [kworker/31:2]
root     195869  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/30:0]
ceilome+ 205031  0.0  0.0 361976 61328 ?        Ss   Nov30   0:07 /usr/bin/python2 /usr/bin/ceilometer-api --logfile /var/log/ceilometer/api.log
heat     205034  0.0  0.0 393816 61872 ?        Ss   Nov30   0:01 /usr/bin/python /usr/bin/heat-api-cfn
root     205035  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/38:2]
aodh     205043  0.0  0.0 321924 58996 ?        Ss   Nov30   0:05 /usr/bin/python2 /usr/bin/aodh-evaluator --logfile /var/log/aodh/evaluator.log
nobody   205052  0.0  0.0  15520   656 ?        S    Nov30   0:00 /sbin/dnsmasq --conf-file=/etc/ironic-inspector/dnsmasq.conf
ironic-+ 205056  2.1  0.0 339836 55008 ?        Ss   Nov30  15:31 /usr/bin/python2 /usr/bin/ironic-inspector --config-file /etc/ironic-inspector/i
swift    205066  0.0  0.0 244460 19472 ?        Ss   Nov30   0:08 /usr/bin/python2 /usr/bin/swift-account-replicator /etc/swift/account-server.con
swift    205067  0.0  0.0 255992 20624 ?        Ss   Nov30   0:00 /usr/bin/python2 /usr/bin/swift-account-reaper /etc/swift/account-server.conf
swift    205075  0.0  0.0 242592 17576 ?        Ss   Nov30   0:04 /usr/bin/python2 /usr/bin/swift-container-auditor /etc/swift/container-server.co
ceilome+ 205082  0.0  0.0 362260 91272 ?        Ss   Nov30   0:34 /usr/bin/python2 /usr/bin/ceilometer-polling --polling-namespaces central --logf
swift    205099  0.0  0.0 244048 18480 ?        Ss   Nov30   0:34 /usr/bin/python2 /usr/bin/swift-container-updater /etc/swift/container-server.co
swift    205109  1.2  0.0 262224 22448 ?        Ss   Nov30   9:00 /usr/bin/python2 /usr/bin/swift-container-replicator /etc/swift/container-server
swift    205110  0.7  0.0 1738116 38688 ?       Ssl  Nov30   5:26 /usr/bin/python2 /usr/bin/swift-object-replicator /etc/swift/object-server.conf
heat     205111  0.0  0.0 394840 62816 ?        Ss   Nov30   0:01 /usr/bin/python /usr/bin/heat-api
swift    205112  0.0  0.0 258060 20696 ?        Ss   Nov30   0:00 /usr/bin/python2 /usr/bin/swift-object-updater /etc/swift/object-server.conf
swift    205113  0.0  0.0 258888 21400 ?        Ss   Nov30   0:02 /usr/bin/python2 /usr/bin/swift-object-auditor /etc/swift/object-server.conf
swift    205114  0.7  0.0 257080 19824 ?        Ss   Nov30   5:20 /usr/bin/python2 /usr/bin/swift-object-server /etc/swift/object-server.conf
swift    205115  0.0  0.0 242800 17572 ?        Ss   Nov30   0:00 /usr/bin/python2 /usr/bin/swift-account-auditor /etc/swift/account-server.conf
root     205124  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/27:2]
swift    205125  0.7  0.0 258144 20168 ?        Ss   Nov30   5:22 /usr/bin/python2 /usr/bin/swift-account-server /etc/swift/account-server.conf
swift    205127  0.7  0.0 267412 21032 ?        Ss   Nov30   5:23 /usr/bin/python2 /usr/bin/swift-container-server /etc/swift/container-server.con
swift    205128  0.7  0.0 286800 37228 ?        Ss   Nov30   5:39 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
neutron  205151  0.1  0.0 348148 52044 ?        Ss   Nov30   1:00 /usr/bin/python2 /usr/bin/neutron-dhcp-agent --config-file /usr/share/neutron/ne
glance   205161  0.7  0.0 370344 88232 ?        Ss   Nov30   5:19 /usr/bin/python2 /usr/bin/glance-api
glance   205162  0.0  0.0 319564 63464 ?        Ss   Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
nova     205209  0.7  0.0 397704 93172 ?        Ss   Nov30   5:32 /usr/bin/python2 /usr/bin/nova-conductor
neutron  205238  0.9  0.0 354504 58516 ?        Ss   Nov30   6:52 /usr/bin/python2 /usr/bin/neutron-openvswitch-agent --config-file /usr/share/neu
swift    205239  0.0  0.0 260164 19880 ?        S    Nov30   0:03 /usr/bin/python2 /usr/bin/swift-account-server /etc/swift/account-server.conf
swift    205255  0.0  0.0 1733900 26400 ?       Sl   Nov30   0:00 /usr/bin/python2 /usr/bin/swift-object-server /etc/swift/object-server.conf
swift    205261  0.0  0.0 269316 20960 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-container-server /etc/swift/container-server.con
aodh     205269  0.0  0.0 388776 50120 ?        Ssl  Nov30   0:08 /usr/bin/python2 /usr/bin/aodh-notifier --logfile /var/log/aodh/notifier.log
nova     205295  0.8  0.0 441524 132120 ?       Ss   Nov30   5:52 /usr/bin/python2 /usr/bin/nova-api
ceilome+ 205321  0.0  0.0 5105256 77796 ?       Ssl  Nov30   0:34 /usr/bin/python2 /usr/bin/ceilometer-agent-notification --logfile /var/log/ceilo
aodh     205328  0.0  0.0 396112 57472 ?        Ssl  Nov30   0:08 /usr/bin/python2 /usr/bin/aodh-listener --logfile /var/log/aodh/listener.log
ceilome+ 205331  0.0  0.0 5112540 91460 ?       Ssl  Nov30   0:40 /usr/bin/python2 /usr/bin/ceilometer-collector --logfile /var/log/ceilometer/col
nova     205337  0.7  0.0 419908 113136 ?       Ss   Nov30   5:38 /usr/bin/python2 /usr/bin/nova-compute
nova     205343  0.1  0.0 409160 102468 ?       Ss   Nov30   0:57 /usr/bin/python2 /usr/bin/nova-cert
swift    205356  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205357  0.0  0.0 289020 36880 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205358  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205359  0.0  0.0 289020 36880 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205360  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205361  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205362  0.0  0.0 289020 36924 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205363  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205364  0.0  0.0 289020 36924 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205365  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205366  0.0  0.0 289020 36924 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205367  0.0  0.0 289020 36916 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205368  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205369  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205370  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205371  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205372  0.0  0.0 289020 36884 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205373  0.0  0.0 289020 36924 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205374  0.0  0.0 289020 36924 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205375  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205377  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205379  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205380  0.0  0.0 289020 36892 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205382  0.0  0.0 289020 36924 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205384  0.0  0.0 289020 36880 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205385  0.0  0.0 289020 36880 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205386  0.0  0.0 289020 36924 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205387  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205388  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205390  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205392  0.0  0.0 289020 36924 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205396  0.0  0.0 289020 36924 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205398  0.0  0.0 289020 36924 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205399  0.0  0.0 289020 36880 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205401  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205402  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205404  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205406  0.0  0.0 289020 36880 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205407  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
swift    205408  0.0  0.0 289020 36920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
nova     205427  0.1  0.0 414784 108336 ?       Ss   Nov30   1:07 /usr/bin/python2 /usr/bin/nova-scheduler
heat     205442  0.1  0.0 404000 67340 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
heat     205443  0.1  0.0 404036 67192 ?        S    Nov30   0:56 /usr/bin/python /usr/bin/heat-api
heat     205444  0.1  0.0 404032 67388 ?        S    Nov30   0:57 /usr/bin/python /usr/bin/heat-api
heat     205445  0.1  0.0 404012 67276 ?        S    Nov30   0:50 /usr/bin/python /usr/bin/heat-api
heat     205446  0.1  0.0 404072 67396 ?        S    Nov30   0:58 /usr/bin/python /usr/bin/heat-api
heat     205447  0.1  0.0 404072 67372 ?        S    Nov30   0:59 /usr/bin/python /usr/bin/heat-api
heat     205448  0.1  0.0 404112 67520 ?        S    Nov30   0:57 /usr/bin/python /usr/bin/heat-api
heat     205449  0.1  0.0 404028 67296 ?        S    Nov30   0:55 /usr/bin/python /usr/bin/heat-api
glance   205450  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205451  0.1  0.0 403628 66896 ?        S    Nov30   0:50 /usr/bin/python /usr/bin/heat-api
glance   205452  0.0  0.0 319564 60920 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205453  0.1  0.0 404092 67360 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
glance   205455  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205456  0.1  0.0 406700 69712 ?        S    Nov30   0:55 /usr/bin/python /usr/bin/heat-api
heat     205457  0.1  0.0 403964 67232 ?        S    Nov30   0:55 /usr/bin/python /usr/bin/heat-api
glance   205458  0.0  0.0 319564 60920 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205459  0.1  0.0 404000 67268 ?        S    Nov30   0:55 /usr/bin/python /usr/bin/heat-api
glance   205460  0.0  0.0 319564 60916 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
heat     205461  0.1  0.0 404004 67308 ?        S    Nov30   0:56 /usr/bin/python /usr/bin/heat-api
glance   205463  0.0  0.0 319564 60920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
heat     205464  0.1  0.0 404176 67488 ?        S    Nov30   0:57 /usr/bin/python /usr/bin/heat-api
glance   205465  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205466  0.1  0.0 407104 70432 ?        S    Nov30   0:56 /usr/bin/python /usr/bin/heat-api
glance   205470  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205471  0.1  0.0 403932 67196 ?        S    Nov30   0:56 /usr/bin/python /usr/bin/heat-api
glance   205474  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205475  0.1  0.0 403708 66988 ?        S    Nov30   0:53 /usr/bin/python /usr/bin/heat-api
glance   205476  0.0  0.0 319564 60916 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205477  0.1  0.0 403976 67312 ?        S    Nov30   0:55 /usr/bin/python /usr/bin/heat-api
heat     205478  0.1  0.0 403924 67264 ?        S    Nov30   0:57 /usr/bin/python /usr/bin/heat-api
glance   205479  0.0  0.0 319564 60916 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
heat     205482  0.1  0.0 403948 67216 ?        S    Nov30   0:59 /usr/bin/python /usr/bin/heat-api
glance   205483  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205486  0.1  0.0 403944 67208 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
glance   205487  0.0  0.0 319564 60920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
heat     205488  0.1  0.0 404068 67536 ?        S    Nov30   0:53 /usr/bin/python /usr/bin/heat-api
glance   205489  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205490  0.1  0.0 403676 66940 ?        S    Nov30   0:57 /usr/bin/python /usr/bin/heat-api
heat     205491  0.1  0.0 404876 67884 ?        S    Nov30   0:59 /usr/bin/python /usr/bin/heat-api
glance   205492  0.0  0.0 319564 60912 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
heat     205493  0.1  0.0 404024 67292 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
glance   205494  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205495  0.1  0.0 404364 67632 ?        S    Nov30   0:59 /usr/bin/python /usr/bin/heat-api
glance   205496  0.0  0.0 319564 60916 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
heat     205497  0.1  0.0 407216 70224 ?        S    Nov30   0:56 /usr/bin/python /usr/bin/heat-api
glance   205498  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205500  0.1  0.0 404128 67392 ?        S    Nov30   0:52 /usr/bin/python /usr/bin/heat-api
heat     205501  0.1  0.0 403988 67216 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
glance   205502  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205503  0.1  0.0 403980 67244 ?        S    Nov30   0:53 /usr/bin/python /usr/bin/heat-api
glance   205504  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205506  0.1  0.0 403904 67248 ?        S    Nov30   0:52 /usr/bin/python /usr/bin/heat-api
glance   205507  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205508  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205509  0.1  0.0 405032 68040 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
glance   205511  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205512  0.1  0.0 404380 67644 ?        S    Nov30   0:53 /usr/bin/python /usr/bin/heat-api
glance   205513  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205514  0.1  0.0 403564 66916 ?        S    Nov30   0:57 /usr/bin/python /usr/bin/heat-api
heat     205515  0.1  0.0 403988 67472 ?        S    Nov30   0:55 /usr/bin/python /usr/bin/heat-api
glance   205516  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205517  0.1  0.0 404068 67336 ?        S    Nov30   0:51 /usr/bin/python /usr/bin/heat-api
glance   205518  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205519  0.1  0.0 403948 67216 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
glance   205520  0.0  0.0 319564 60916 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
heat     205521  0.1  0.0 404344 67612 ?        S    Nov30   0:55 /usr/bin/python /usr/bin/heat-api
glance   205522  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
heat     205523  0.1  0.0 407068 70080 ?        S    Nov30   0:54 /usr/bin/python /usr/bin/heat-api
glance   205524  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205525  0.0  0.0 319564 60916 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
glance   205526  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205527  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205528  0.0  0.0 319564 60920 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205529  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205530  0.0  0.0 319564 60920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
glance   205531  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205533  0.0  0.0 319564 60920 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205534  0.0  0.0 319564 60920 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-registry
glance   205535  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
glance   205536  0.0  0.0 319564 60948 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-registry
root     205537  0.0  0.0 193332  2792 ?        S    Nov30   0:00 sudo neutron-rootwrap-daemon /etc/neutron/rootwrap.conf
root     205538  0.0  0.0 290852 12712 ?        Sl   Nov30   0:34 /usr/bin/python2 /usr/bin/neutron-rootwrap-daemon /etc/neutron/rootwrap.conf
glance   205563  0.0  0.0 372128 86292 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205564  0.0  0.0 372172 86148 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205566  0.0  0.0 372700 86892 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-api
glance   205568  0.0  0.0 371484 85608 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205570  0.0  0.0 372292 86448 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205572  0.0  0.0 371820 85932 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205573  0.0  0.0 372272 86412 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205575  0.0  0.0 372612 86732 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-api
glance   205577  0.0  0.0 372288 86324 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205578  0.0  0.0 372160 86160 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205580  0.0  0.0 372996 87032 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-api
glance   205581  0.0  0.0 371832 85848 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205583  0.0  0.0 372224 86252 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205585  0.0  0.0 372260 86356 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205586  0.0  0.0 372112 86160 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205588  0.0  0.0 372552 86712 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-api
glance   205589  0.0  0.0 372420 86564 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205591  0.0  0.0 372236 86452 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-api
glance   205593  0.0  0.0 372308 86364 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205594  0.0  0.0 372200 86268 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205596  0.0  0.0 372112 86196 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205598  0.0  0.0 372280 86320 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205599  0.0  0.0 371668 85640 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205600  0.0  0.0 372404 86452 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-api
glance   205602  0.0  0.0 372248 86220 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205603  0.0  0.0 372092 85936 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205604  0.0  0.0 372204 86316 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205605  0.0  0.0 372132 86116 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205606  0.0  0.0 372136 86320 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205607  0.0  0.0 372288 86448 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205608  0.0  0.0 372200 86404 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205609  0.0  0.0 371844 85940 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205610  0.0  0.0 371716 85880 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205611  0.0  0.0 372388 86488 ?        S    Nov30   0:01 /usr/bin/python2 /usr/bin/glance-api
glance   205612  0.0  0.0 371860 86040 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205613  0.0  0.0 372312 86404 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205614  0.0  0.0 372212 86204 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205615  0.0  0.0 372184 86380 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205616  0.0  0.0 372276 86384 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
glance   205617  0.0  0.0 372320 86388 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/glance-api
root     205618  0.0  0.0 193332  2784 ?        S    Nov30   0:00 sudo neutron-rootwrap /etc/neutron/rootwrap.conf ovsdb-client monitor Interface 
root     205620  0.0  0.0 207796 11600 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/neutron-rootwrap /etc/neutron/rootwrap.conf ovsdb-clie
root     205623  0.0  0.0  43392  2428 ?        S    Nov30   0:00 /bin/ovsdb-client monitor Interface name,ofport,external_ids --format=json
nova     205624  0.2  0.0 427460 117096 ?       S    Nov30   1:44 /usr/bin/python2 /usr/bin/nova-conductor
nova     205625  0.2  0.0 428600 118424 ?       S    Nov30   2:02 /usr/bin/python2 /usr/bin/nova-conductor
nova     205626  0.2  0.0 428844 118672 ?       S    Nov30   1:49 /usr/bin/python2 /usr/bin/nova-conductor
nova     205627  0.2  0.0 427320 117060 ?       S    Nov30   1:37 /usr/bin/python2 /usr/bin/nova-conductor
nova     205628  0.2  0.0 428548 118380 ?       S    Nov30   2:04 /usr/bin/python2 /usr/bin/nova-conductor
nova     205629  0.2  0.0 428676 118464 ?       S    Nov30   2:00 /usr/bin/python2 /usr/bin/nova-conductor
nova     205630  0.2  0.0 427636 117404 ?       S    Nov30   1:45 /usr/bin/python2 /usr/bin/nova-conductor
nova     205631  0.2  0.0 428332 117876 ?       S    Nov30   2:00 /usr/bin/python2 /usr/bin/nova-conductor
nova     205632  0.2  0.0 428940 118724 ?       S    Nov30   2:02 /usr/bin/python2 /usr/bin/nova-conductor
nova     205633  0.2  0.0 428760 118532 ?       S    Nov30   1:50 /usr/bin/python2 /usr/bin/nova-conductor
nova     205634  0.2  0.0 426916 116556 ?       S    Nov30   1:40 /usr/bin/python2 /usr/bin/nova-conductor
nova     205635  0.2  0.0 428548 118108 ?       S    Nov30   2:01 /usr/bin/python2 /usr/bin/nova-conductor
nova     205637  0.2  0.0 427312 117148 ?       S    Nov30   1:40 /usr/bin/python2 /usr/bin/nova-conductor
nova     205640  0.2  0.0 428452 117988 ?       S    Nov30   2:07 /usr/bin/python2 /usr/bin/nova-conductor
nova     205641  0.2  0.0 428232 117988 ?       S    Nov30   1:46 /usr/bin/python2 /usr/bin/nova-conductor
nova     205644  0.2  0.0 428628 118256 ?       S    Nov30   2:01 /usr/bin/python2 /usr/bin/nova-conductor
nova     205646  0.2  0.0 428520 118128 ?       S    Nov30   1:59 /usr/bin/python2 /usr/bin/nova-conductor
nova     205648  0.2  0.0 427112 116924 ?       S    Nov30   1:43 /usr/bin/python2 /usr/bin/nova-conductor
nova     205649  0.2  0.0 428088 117792 ?       S    Nov30   1:51 /usr/bin/python2 /usr/bin/nova-conductor
nova     205651  0.2  0.0 428648 118264 ?       S    Nov30   2:01 /usr/bin/python2 /usr/bin/nova-conductor
nova     205653  0.2  0.0 427308 117048 ?       S    Nov30   1:38 /usr/bin/python2 /usr/bin/nova-conductor
nova     205655  0.2  0.0 427056 116584 ?       S    Nov30   1:39 /usr/bin/python2 /usr/bin/nova-conductor
nova     205657  0.2  0.0 428880 118620 ?       S    Nov30   1:50 /usr/bin/python2 /usr/bin/nova-conductor
nova     205659  0.2  0.0 427176 116856 ?       S    Nov30   2:03 /usr/bin/python2 /usr/bin/nova-conductor
nova     205661  0.2  0.0 427336 116920 ?       S    Nov30   1:42 /usr/bin/python2 /usr/bin/nova-conductor
nova     205663  0.2  0.0 428740 118552 ?       S    Nov30   2:01 /usr/bin/python2 /usr/bin/nova-conductor
nova     205665  0.2  0.0 428532 118260 ?       S    Nov30   2:03 /usr/bin/python2 /usr/bin/nova-conductor
nova     205667  0.2  0.0 426536 116356 ?       S    Nov30   1:37 /usr/bin/python2 /usr/bin/nova-conductor
nova     205669  0.2  0.0 426840 116604 ?       S    Nov30   1:39 /usr/bin/python2 /usr/bin/nova-conductor
nova     205671  0.2  0.0 428600 118344 ?       S    Nov30   2:04 /usr/bin/python2 /usr/bin/nova-conductor
nova     205673  0.2  0.0 428740 118464 ?       S    Nov30   2:02 /usr/bin/python2 /usr/bin/nova-conductor
nova     205675  0.2  0.0 428580 118392 ?       S    Nov30   1:41 /usr/bin/python2 /usr/bin/nova-conductor
nova     205677  0.2  0.0 428728 118536 ?       S    Nov30   2:02 /usr/bin/python2 /usr/bin/nova-conductor
nova     205679  0.2  0.0 427436 117248 ?       S    Nov30   1:38 /usr/bin/python2 /usr/bin/nova-conductor
nova     205681  0.2  0.0 427628 117476 ?       S    Nov30   1:51 /usr/bin/python2 /usr/bin/nova-conductor
nova     205683  0.2  0.0 427240 117036 ?       S    Nov30   1:38 /usr/bin/python2 /usr/bin/nova-conductor
nova     205684  0.2  0.0 428116 117920 ?       S    Nov30   2:00 /usr/bin/python2 /usr/bin/nova-conductor
nova     205687  0.2  0.0 428412 117960 ?       S    Nov30   1:42 /usr/bin/python2 /usr/bin/nova-conductor
nova     205688  0.2  0.0 428888 118704 ?       S    Nov30   2:03 /usr/bin/python2 /usr/bin/nova-conductor
nova     205690  0.2  0.0 428680 118336 ?       S    Nov30   1:50 /usr/bin/python2 /usr/bin/nova-conductor
nova     205709  0.1  0.0 506416 171204 ?       S    Nov30   1:23 /usr/bin/python2 /usr/bin/nova-api
nova     205710  0.1  0.0 476060 163504 ?       S    Nov30   1:21 /usr/bin/python2 /usr/bin/nova-api
nova     205711  0.2  0.0 506288 171128 ?       S    Nov30   1:40 /usr/bin/python2 /usr/bin/nova-api
nova     205712  0.2  0.0 506336 170996 ?       S    Nov30   1:48 /usr/bin/python2 /usr/bin/nova-api
nova     205713  0.2  0.0 506156 170880 ?       S    Nov30   1:54 /usr/bin/python2 /usr/bin/nova-api
nova     205714  0.2  0.0 475912 163400 ?       S    Nov30   1:42 /usr/bin/python2 /usr/bin/nova-api
nova     205715  0.2  0.0 475984 163288 ?       S    Nov30   1:59 /usr/bin/python2 /usr/bin/nova-api
nova     205717  0.2  0.0 506580 171208 ?       S    Nov30   1:59 /usr/bin/python2 /usr/bin/nova-api
nova     205718  0.2  0.0 507148 171908 ?       S    Nov30   1:49 /usr/bin/python2 /usr/bin/nova-api
nova     205719  0.1  0.0 506004 170688 ?       S    Nov30   1:13 /usr/bin/python2 /usr/bin/nova-api
nova     205724  0.2  0.0 506140 170896 ?       S    Nov30   1:45 /usr/bin/python2 /usr/bin/nova-api
nova     205727  0.1  0.0 506564 171300 ?       S    Nov30   1:23 /usr/bin/python2 /usr/bin/nova-api
nova     205729  0.2  0.0 506380 171128 ?       S    Nov30   1:49 /usr/bin/python2 /usr/bin/nova-api
nova     205731  0.2  0.0 506288 171132 ?       S    Nov30   1:57 /usr/bin/python2 /usr/bin/nova-api
nova     205733  0.2  0.0 506932 171760 ?       S    Nov30   1:40 /usr/bin/python2 /usr/bin/nova-api
nova     205735  0.1  0.0 507172 171992 ?       S    Nov30   1:24 /usr/bin/python2 /usr/bin/nova-api
nova     205738  0.2  0.0 506660 171392 ?       S    Nov30   1:52 /usr/bin/python2 /usr/bin/nova-api
nova     205740  0.2  0.0 507148 171896 ?       S    Nov30   1:53 /usr/bin/python2 /usr/bin/nova-api
nova     205742  0.2  0.0 475020 162428 ?       S    Nov30   1:35 /usr/bin/python2 /usr/bin/nova-api
nova     205743  0.2  0.0 474892 162292 ?       S    Nov30   1:46 /usr/bin/python2 /usr/bin/nova-api
nova     205745  0.1  0.0 506020 170804 ?       S    Nov30   1:11 /usr/bin/python2 /usr/bin/nova-api
nova     205747  0.2  0.0 506124 170884 ?       S    Nov30   1:33 /usr/bin/python2 /usr/bin/nova-api
nova     205749  0.1  0.0 506344 171068 ?       S    Nov30   1:19 /usr/bin/python2 /usr/bin/nova-api
nova     205751  0.2  0.0 506084 170816 ?       S    Nov30   1:45 /usr/bin/python2 /usr/bin/nova-api
nova     205753  0.1  0.0 506540 171332 ?       S    Nov30   1:24 /usr/bin/python2 /usr/bin/nova-api
nova     205755  0.2  0.0 505236 169964 ?       S    Nov30   1:52 /usr/bin/python2 /usr/bin/nova-api
nova     205757  0.2  0.0 508092 172888 ?       S    Nov30   1:38 /usr/bin/python2 /usr/bin/nova-api
nova     205759  0.3  0.0 506272 170996 ?       S    Nov30   2:15 /usr/bin/python2 /usr/bin/nova-api
nova     205761  0.2  0.0 506736 171412 ?       S    Nov30   1:44 /usr/bin/python2 /usr/bin/nova-api
nova     205763  0.2  0.0 506508 171332 ?       S    Nov30   1:44 /usr/bin/python2 /usr/bin/nova-api
nova     205765  0.2  0.0 506828 171632 ?       S    Nov30   2:00 /usr/bin/python2 /usr/bin/nova-api
nova     205768  0.2  0.0 506372 171204 ?       S    Nov30   2:08 /usr/bin/python2 /usr/bin/nova-api
nova     205769  0.2  0.0 506480 171204 ?       S    Nov30   1:33 /usr/bin/python2 /usr/bin/nova-api
nova     205771  0.2  0.0 505480 170212 ?       S    Nov30   1:37 /usr/bin/python2 /usr/bin/nova-api
nova     205773  0.2  0.0 475444 162852 ?       S    Nov30   1:55 /usr/bin/python2 /usr/bin/nova-api
nova     205776  0.1  0.0 506208 170868 ?       S    Nov30   1:25 /usr/bin/python2 /usr/bin/nova-api
nova     205777  0.1  0.0 502860 167676 ?       S    Nov30   1:20 /usr/bin/python2 /usr/bin/nova-api
nova     205780  0.2  0.0 474660 162012 ?       S    Nov30   1:47 /usr/bin/python2 /usr/bin/nova-api
nova     205782  0.2  0.0 474996 162396 ?       S    Nov30   2:03 /usr/bin/python2 /usr/bin/nova-api
nova     205785  0.2  0.0 506060 170892 ?       S    Nov30   1:32 /usr/bin/python2 /usr/bin/nova-api
nova     205796  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205797  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205798  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205799  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205800  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205801  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205802  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205805  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205807  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205810  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205812  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205813  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205815  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205818  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205820  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205822  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205824  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205827  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205829  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205831  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205832  0.0  0.0 446448 133496 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205834  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205836  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205838  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205840  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205842  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205845  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205847  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205848  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205850  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205852  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205854  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205856  0.0  0.0 446456 133504 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205858  0.0  0.0 446452 133500 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205860  0.0  0.0 446456 133504 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205863  0.0  0.0 446456 133504 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205864  0.0  0.0 446456 133504 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205866  0.0  0.0 446456 133504 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205868  0.0  0.0 446456 133504 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
nova     205870  0.0  0.0 446456 133504 ?       S    Nov30   0:00 /usr/bin/python2 /usr/bin/nova-api
heat     205875  0.7  0.0 404688 72736 ?        Ss   Nov30   5:32 /usr/bin/python /usr/bin/heat-engine
heat     205885  0.6  0.0 579876 222912 ?       S    Nov30   4:21 /usr/bin/python /usr/bin/heat-engine
heat     205886  0.3  0.0 559704 202588 ?       S    Nov30   2:36 /usr/bin/python /usr/bin/heat-engine
heat     205887  0.4  0.0 577216 220144 ?       S    Nov30   3:07 /usr/bin/python /usr/bin/heat-engine
heat     205888  0.4  0.0 550940 211076 ?       S    Nov30   3:18 /usr/bin/python /usr/bin/heat-engine
heat     205889  0.3  0.0 561396 204316 ?       S    Nov30   2:33 /usr/bin/python /usr/bin/heat-engine
heat     205890  0.4  0.0 555768 198512 ?       S    Nov30   3:23 /usr/bin/python /usr/bin/heat-engine
heat     205891  0.4  0.0 537180 196840 ?       S    Nov30   3:14 /usr/bin/python /usr/bin/heat-engine
heat     205892  0.3  0.0 546020 188824 ?       S    Nov30   2:24 /usr/bin/python /usr/bin/heat-engine
heat     205893  0.3  0.0 567684 210564 ?       S    Nov30   2:33 /usr/bin/python /usr/bin/heat-engine
heat     205894  0.4  0.0 580504 223160 ?       S    Nov30   3:32 /usr/bin/python /usr/bin/heat-engine
heat     205895  0.3  0.0 565040 207880 ?       S    Nov30   2:37 /usr/bin/python /usr/bin/heat-engine
heat     205896  0.5  0.0 577996 220836 ?       S    Nov30   3:42 /usr/bin/python /usr/bin/heat-engine
heat     205897  0.3  0.0 558300 201184 ?       S    Nov30   2:29 /usr/bin/python /usr/bin/heat-engine
heat     205898  0.4  0.0 550528 210352 ?       S    Nov30   3:15 /usr/bin/python /usr/bin/heat-engine
heat     205899  0.4  0.0 600172 243068 ?       S    Nov30   3:23 /usr/bin/python /usr/bin/heat-engine
heat     205900  0.3  0.0 529724 189532 ?       S    Nov30   2:27 /usr/bin/python /usr/bin/heat-engine
heat     205901  0.3  0.0 531048 191016 ?       S    Nov30   2:27 /usr/bin/python /usr/bin/heat-engine
heat     205902  0.4  0.0 556148 198920 ?       S    Nov30   2:59 /usr/bin/python /usr/bin/heat-engine
heat     205903  0.4  0.0 567120 210128 ?       S    Nov30   3:23 /usr/bin/python /usr/bin/heat-engine
heat     205904  0.5  0.0 571160 214168 ?       S    Nov30   3:49 /usr/bin/python /usr/bin/heat-engine
heat     205905  0.4  0.0 555660 198552 ?       S    Nov30   3:26 /usr/bin/python /usr/bin/heat-engine
heat     205907  0.3  0.0 551180 194020 ?       S    Nov30   2:31 /usr/bin/python /usr/bin/heat-engine
heat     205909  0.4  0.0 593624 253728 ?       S    Nov30   3:21 /usr/bin/python /usr/bin/heat-engine
heat     205910  0.4  0.0 555960 198968 ?       S    Nov30   3:13 /usr/bin/python /usr/bin/heat-engine
heat     205911  0.4  0.0 552872 195648 ?       S    Nov30   2:54 /usr/bin/python /usr/bin/heat-engine
heat     205915  0.5  0.0 570748 213484 ?       S    Nov30   4:11 /usr/bin/python /usr/bin/heat-engine
heat     205920  0.4  0.0 565320 208248 ?       S    Nov30   2:55 /usr/bin/python /usr/bin/heat-engine
heat     205922  0.4  0.0 565816 208692 ?       S    Nov30   3:19 /usr/bin/python /usr/bin/heat-engine
heat     205927  0.4  0.0 550032 192980 ?       S    Nov30   2:52 /usr/bin/python /usr/bin/heat-engine
heat     205930  0.3  0.0 560916 203800 ?       S    Nov30   2:29 /usr/bin/python /usr/bin/heat-engine
heat     205931  0.4  0.0 563988 206748 ?       S    Nov30   3:26 /usr/bin/python /usr/bin/heat-engine
heat     205932  0.5  0.1 623336 266244 ?       S    Nov30   4:09 /usr/bin/python /usr/bin/heat-engine
heat     205934  0.3  0.0 559284 201716 ?       S    Nov30   2:22 /usr/bin/python /usr/bin/heat-engine
heat     205936  0.4  0.0 579824 222716 ?       S    Nov30   3:31 /usr/bin/python /usr/bin/heat-engine
heat     205939  0.4  0.0 551844 211648 ?       S    Nov30   3:20 /usr/bin/python /usr/bin/heat-engine
heat     205940  0.3  0.0 561772 204668 ?       S    Nov30   2:35 /usr/bin/python /usr/bin/heat-engine
heat     205942  0.5  0.0 562356 205288 ?       S    Nov30   3:35 /usr/bin/python /usr/bin/heat-engine
heat     205945  0.5  0.0 596644 239576 ?       S    Nov30   3:53 /usr/bin/python /usr/bin/heat-engine
heat     205946  0.5  0.0 572704 215544 ?       S    Nov30   4:00 /usr/bin/python /usr/bin/heat-engine
heat     205949  0.4  0.0 566460 209356 ?       S    Nov30   3:08 /usr/bin/python /usr/bin/heat-engine
ironic   206019  3.0  0.0 434552 78628 ?        Ss   Nov30  22:03 /usr/bin/python2 /usr/bin/ironic-conductor
neutron  206043  0.0  0.0 407996 79860 ?        Ss   Nov30   0:11 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206093  0.0  0.0 422740 90340 ?        S    Nov30   0:12 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206094  0.3  0.0 425548 93104 ?        S    Nov30   2:09 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206095  0.3  0.0 427068 94624 ?        S    Nov30   2:13 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206096  0.3  0.0 423980 91592 ?        S    Nov30   2:10 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206097  0.3  0.0 425568 93060 ?        S    Nov30   2:38 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206098  0.0  0.0 426752 94468 ?        S    Nov30   0:41 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206099  0.1  0.0 425796 93528 ?        S    Nov30   1:09 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206100  0.0  0.0 428948 96448 ?        S    Nov30   0:25 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206101  0.1  0.0 425936 93404 ?        S    Nov30   0:57 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206102  0.1  0.0 423936 91580 ?        S    Nov30   1:22 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206103  0.1  0.0 424240 91880 ?        S    Nov30   1:19 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206104  0.1  0.0 424600 92176 ?        S    Nov30   1:04 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206106  0.1  0.0 423572 91304 ?        S    Nov30   0:53 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206107  0.0  0.0 427188 94808 ?        S    Nov30   0:20 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206108  0.1  0.0 425652 93164 ?        S    Nov30   0:54 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206109  0.0  0.0 428452 95920 ?        S    Nov30   0:21 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206110  0.4  0.0 425068 92780 ?        S    Nov30   3:11 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206112  0.0  0.0 424592 92304 ?        S    Nov30   0:15 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206113  0.1  0.0 424508 92160 ?        S    Nov30   0:55 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206114  0.2  0.0 425524 93252 ?        S    Nov30   1:33 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206116  0.0  0.0 421248 88780 ?        S    Nov30   0:06 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206117  0.0  0.0 426764 94408 ?        S    Nov30   0:39 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206118  0.3  0.0 424748 92272 ?        S    Nov30   2:13 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206119  0.1  0.0 424464 91944 ?        S    Nov30   0:51 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206120  0.0  0.0 423132 90860 ?        S    Nov30   0:31 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206121  0.1  0.0 424268 91872 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206122  0.1  0.0 427184 94808 ?        S    Nov30   1:01 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206123  0.1  0.0 423024 90556 ?        S    Nov30   1:11 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206124  0.1  0.0 424288 91952 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206125  0.0  0.0 425060 92544 ?        S    Nov30   0:29 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206126  0.1  0.0 425116 92644 ?        S    Nov30   0:58 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206127  0.0  0.0 424468 92124 ?        S    Nov30   0:39 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206128  0.0  0.0 425644 93236 ?        S    Nov30   0:09 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206129  0.1  0.0 425224 92812 ?        S    Nov30   0:50 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206130  0.0  0.0 428196 95968 ?        S    Nov30   0:35 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206131  0.0  0.0 423660 91088 ?        S    Nov30   0:22 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206132  0.1  0.0 425232 92948 ?        S    Nov30   1:19 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206133  0.1  0.0 424724 92116 ?        S    Nov30   0:57 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206134  0.2  0.0 426088 93580 ?        S    Nov30   1:48 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206135  0.0  0.0 422056 89708 ?        S    Nov30   0:40 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206136  0.1  0.0 416712 84116 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206137  0.1  0.0 413352 80716 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206138  0.1  0.0 413360 80612 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206139  0.1  0.0 413512 80788 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206141  0.1  0.0 415068 82580 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206142  0.1  0.0 413360 80612 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206143  0.1  0.0 413352 80716 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206144  0.1  0.0 413352 80716 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206145  0.1  0.0 413360 80612 ?        S    Nov30   0:48 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206146  0.1  0.0 414856 82316 ?        S    Nov30   0:50 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206148  0.1  0.0 413352 80724 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206149  0.1  0.0 413360 80616 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206150  0.1  0.0 413364 80640 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206152  0.1  0.0 413352 80724 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206153  0.1  0.0 413352 80724 ?        S    Nov30   0:48 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206154  0.1  0.0 413352 80656 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206155  0.1  0.0 413364 80640 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206156  0.1  0.0 413352 80652 ?        S    Nov30   0:49 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206157  0.1  0.0 413360 80636 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206158  0.1  0.0 413360 80636 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206159  0.1  0.0 413348 80652 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206160  0.1  0.0 413352 80656 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206161  0.1  0.0 413364 80640 ?        S    Nov30   0:49 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206162  0.1  0.0 413368 80644 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206163  0.1  0.0 413376 80684 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206164  0.1  0.0 413380 80684 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206165  0.1  0.0 413380 80684 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206167  0.1  0.0 413384 80684 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206168  0.1  0.0 413376 80680 ?        S    Nov30   0:48 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206169  0.1  0.0 413388 80688 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206171  0.1  0.0 413380 80680 ?        S    Nov30   0:48 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206172  0.1  0.0 413380 80680 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206173  0.1  0.0 413380 80684 ?        S    Nov30   0:44 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206175  0.1  0.0 412848 80244 ?        S    Nov30   0:44 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206176  0.1  0.0 413384 80684 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206177  0.1  0.0 412832 80268 ?        S    Nov30   0:44 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206178  0.1  0.0 412844 80120 ?        S    Nov30   0:47 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206179  0.1  0.0 412840 80172 ?        S    Nov30   0:45 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206180  0.1  0.0 412864 80288 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206181  0.1  0.0 412860 80164 ?        S    Nov30   0:46 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206182  0.0  0.0 409596 77136 ?        S    Nov30   0:18 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
neutron  206183  0.0  0.0 409316 76608 ?        S    Nov30   0:12 /usr/bin/python2 /usr/bin/neutron-server --config-file /usr/share/neutron/neutro
root     206199  0.0  0.0 193332  2792 ?        S    Nov30   0:00 sudo neutron-rootwrap-daemon /etc/neutron/rootwrap.conf
root     206201  0.0  0.0 512048 13076 ?        Sl   Nov30   0:00 /usr/bin/python2 /usr/bin/neutron-rootwrap-daemon /etc/neutron/rootwrap.conf
neutron  206251  0.0  0.0 318736 38240 ?        S    Nov30   0:00 /usr/bin/python2 /bin/neutron-ns-metadata-proxy --pid_file=/var/lib/neutron/exte
nobody   206264  0.0  0.0  15548   984 ?        S    Nov30   0:00 dnsmasq --no-hosts --no-resolv --strict-order --except-interface=lo --pid-file=/
ironic   206620  0.7  0.0 372472 57664 ?        Ss   Nov30   5:21 /usr/bin/python2 /usr/bin/ironic-api
ironic   206633  0.0  0.0 381840 63240 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206634  0.8  0.0 383324 64620 ?        S    Nov30   6:08 /usr/bin/python2 /usr/bin/ironic-api
ironic   206635  1.9  0.0 383396 64872 ?        S    Nov30  13:38 /usr/bin/python2 /usr/bin/ironic-api
ironic   206636  0.0  0.0 381800 63092 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206637  0.0  0.0 382364 63584 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206638  0.0  0.0 382048 63348 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206639  0.4  0.0 383036 64468 ?        S    Nov30   3:12 /usr/bin/python2 /usr/bin/ironic-api
ironic   206640  0.4  0.0 383284 64576 ?        S    Nov30   3:14 /usr/bin/python2 /usr/bin/ironic-api
ironic   206641  0.9  0.0 387588 69180 ?        S    Nov30   7:03 /usr/bin/python2 /usr/bin/ironic-api
ironic   206642  0.0  0.0 381876 63280 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206643  0.0  0.0 381460 62844 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206644  0.2  0.0 382804 64212 ?        S    Nov30   1:27 /usr/bin/python2 /usr/bin/ironic-api
ironic   206645  1.1  0.0 383556 64824 ?        S    Nov30   8:02 /usr/bin/python2 /usr/bin/ironic-api
ironic   206646  0.0  0.0 381192 62596 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206647  0.2  0.0 383060 64480 ?        S    Nov30   1:55 /usr/bin/python2 /usr/bin/ironic-api
ironic   206648  0.0  0.0 382016 63216 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206649  0.0  0.0 381768 63072 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206650  0.0  0.0 381720 62940 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206651  0.0  0.0 381756 63164 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206652  2.2  0.0 387772 69284 ?        S    Nov30  15:54 /usr/bin/python2 /usr/bin/ironic-api
ironic   206653  0.0  0.0 382004 63264 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206654  0.2  0.0 383088 64436 ?        R    Nov30   1:39 /usr/bin/python2 /usr/bin/ironic-api
ironic   206655  0.0  0.0 383060 64460 ?        S    Nov30   0:22 /usr/bin/python2 /usr/bin/ironic-api
ironic   206656  0.0  0.0 381532 62884 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206657  0.0  0.0 381872 63108 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206658  1.9  0.0 383824 65164 ?        S    Nov30  13:51 /usr/bin/python2 /usr/bin/ironic-api
ironic   206659  1.8  0.0 383104 64612 ?        S    Nov30  12:56 /usr/bin/python2 /usr/bin/ironic-api
ironic   206660  1.8  0.0 383356 64668 ?        S    Nov30  12:57 /usr/bin/python2 /usr/bin/ironic-api
ironic   206661  0.0  0.0 381812 63140 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206662  0.0  0.0 381844 63176 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206663  0.0  0.0 381812 63008 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206664  2.1  0.0 388168 69668 ?        S    Nov30  15:39 /usr/bin/python2 /usr/bin/ironic-api
ironic   206665  1.0  0.0 383324 64696 ?        S    Nov30   7:51 /usr/bin/python2 /usr/bin/ironic-api
ironic   206666  1.8  0.0 383196 64716 ?        S    Nov30  12:55 /usr/bin/python2 /usr/bin/ironic-api
ironic   206667  0.0  0.0 381828 63036 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206668  1.0  0.0 387660 69156 ?        S    Nov30   7:25 /usr/bin/python2 /usr/bin/ironic-api
ironic   206669  1.9  0.0 383416 64820 ?        S    Nov30  14:05 /usr/bin/python2 /usr/bin/ironic-api
ironic   206670  0.0  0.0 381256 62744 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206671  0.0  0.0 381656 62836 ?        S    Nov30   0:00 /usr/bin/python2 /usr/bin/ironic-api
ironic   206672  1.7  0.0 387508 68960 ?        S    Nov30  12:32 /usr/bin/python2 /usr/bin/ironic-api
root     209666  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/16:0]
root     216252  0.0  0.0      0     0 ?        S<   Nov30   0:00 [loop0]
root     217205  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/15:2]
root     217227  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/14:1]
root     217268  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/36:1]
root     217270  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/18:0]
root     217545  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/2:2]
root     217575  0.0  0.0 126256  1732 ?        Ss   Nov30   0:01 /usr/sbin/crond -n
root     217665  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/37:0]
root     217903  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/39:2]
root     218092  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/19:2]
root     218275  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/24:0]
root     218350  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/3:2]
root     218353  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/34:0]
root     218394  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/5:1]
root     218467  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/6:0]
root     218522  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/25:2]
root     218661  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/4:2]
root     218865  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/32:0]
root     218986  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/29:0]
root     219000  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/28:0]
root     219017  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/35:2]
root     219531  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/25:3]
root     221973  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/8:2]
root     226066  0.0  0.0      0     0 ?        S    Nov30   0:00 [kworker/12:2]
apache   235624  0.0  0.0 158064  7408 ?        S    Nov30   0:01 /usr/sbin/httpd -DFOREGROUND
apache   235626  0.0  0.0 158064  7408 ?        S    Nov30   0:01 /usr/sbin/httpd -DFOREGROUND
apache   235627  0.0  0.0 158064  7384 ?        S    Nov30   0:01 /usr/sbin/httpd -DFOREGROUND
[root@director ironic-inspector]# 

[root@director ironic-inspector]# openstack-service status 
MainPID=205151 Id=neutron-dhcp-agent.service ActiveState=active
MainPID=205238 Id=neutron-openvswitch-agent.service ActiveState=active
MainPID=206043 Id=neutron-server.service ActiveState=active
MainPID=205043 Id=openstack-aodh-evaluator.service ActiveState=active
MainPID=205328 Id=openstack-aodh-listener.service ActiveState=active
MainPID=205269 Id=openstack-aodh-notifier.service ActiveState=active
MainPID=205031 Id=openstack-ceilometer-api.service ActiveState=active
MainPID=205082 Id=openstack-ceilometer-central.service ActiveState=active
MainPID=205331 Id=openstack-ceilometer-collector.service ActiveState=active
MainPID=205321 Id=openstack-ceilometer-notification.service ActiveState=active
MainPID=205161 Id=openstack-glance-api.service ActiveState=active
MainPID=205162 Id=openstack-glance-registry.service ActiveState=active
MainPID=205034 Id=openstack-heat-api-cfn.service ActiveState=active
MainPID=205111 Id=openstack-heat-api.service ActiveState=active
MainPID=205875 Id=openstack-heat-engine.service ActiveState=active
MainPID=206620 Id=openstack-ironic-api.service ActiveState=active
MainPID=206019 Id=openstack-ironic-conductor.service ActiveState=active
MainPID=205052 Id=openstack-ironic-inspector-dnsmasq.service ActiveState=active
MainPID=205056 Id=openstack-ironic-inspector.service ActiveState=active
MainPID=205295 Id=openstack-nova-api.service ActiveState=active
MainPID=205343 Id=openstack-nova-cert.service ActiveState=active
MainPID=205337 Id=openstack-nova-compute.service ActiveState=active
MainPID=205209 Id=openstack-nova-conductor.service ActiveState=active
MainPID=205427 Id=openstack-nova-scheduler.service ActiveState=active
MainPID=205115 Id=openstack-swift-account-auditor.service ActiveState=active
MainPID=205067 Id=openstack-swift-account-reaper.service ActiveState=active
MainPID=205066 Id=openstack-swift-account-replicator.service ActiveState=active
MainPID=205125 Id=openstack-swift-account.service ActiveState=active
MainPID=205075 Id=openstack-swift-container-auditor.service ActiveState=active
MainPID=205109 Id=openstack-swift-container-replicator.service ActiveState=active
MainPID=205099 Id=openstack-swift-container-updater.service ActiveState=active
MainPID=205127 Id=openstack-swift-container.service ActiveState=active
MainPID=205113 Id=openstack-swift-object-auditor.service ActiveState=active
MainPID=205110 Id=openstack-swift-object-replicator.service ActiveState=active
MainPID=205112 Id=openstack-swift-object-updater.service ActiveState=active
MainPID=205114 Id=openstack-swift-object.service ActiveState=active
MainPID=205128 Id=openstack-swift-proxy.service ActiveState=active
[root@director ironic-inspector]# 

[root@director httpboot]# sosreport

sosreport (version 3.3)

This command will collect diagnostic and configuration information from
this Red Hat Enterprise Linux system and installed applications.

An archive containing the collected information will be generated in
/var/tmp/sos.1CP9Xx and may be provided to a Red Hat support
representative.

Any information provided to Red Hat will be treated in accordance with
the published support policies at:

  https://access.redhat.com/support/

The generated archive may contain data considered sensitive and its
content should be reviewed by the originating organization before being
passed to any third party.

No changes will be made to system configuration.

Press ENTER to continue, or CTRL-C to quit.

Please enter your first initial and last name [director.vepc.mnc066.mcc260.3gppnetwork.org]: 
Please enter the case id that you are generating this report for []: 

 Setting up archive ...
 Setting up plugins ...
 Running plugins. Please wait ...

  Running 117/117: yum...               ..        
Creating compressed archive...

Your sosreport has been generated and saved in:
  /var/tmp/sosreport-director.vepc.mnc066.mcc260.3gppnetwork.org-20161201064051.tar.xz

The checksum is: 3a49f4d16870b2cc8a2aab80de9a9c47

Please send this file to your support representative.





```


