**opertions record** 
====================================
***

# check environment and start introspection

```bash
[stack@director ~]$ 
[stack@director ~]$ heat stack-list 
WARNING (shell) "heat stack-list" is deprecated, please use "openstack stack list" instead
+----+------------+--------------+---------------+--------------+
| id | stack_name | stack_status | creation_time | updated_time |
+----+------------+--------------+---------------+--------------+
+----+------------+--------------+---------------+--------------+
[stack@director ~]$ 
[stack@director ~]$ openstack baremetal configure boot
[stack@director ~]$ ironic node-list
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| 3e57d7ca-eac9-4b8e-8808-f8019c97a508 | None | None          | power off   | available          | False       |
| 22c20294-b127-42da-aac9-63a1b23609e0 | None | None          | power off   | available          | False       |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
[stack@director ~]$ ironic node-show 3e57d7ca-eac9-4b8e-8808-f8019c97a508
+------------------------+-----------------------------------------------------------------+
| Property               | Value                                                           |
+------------------------+-----------------------------------------------------------------+
| chassis_uuid           |                                                                 |
| clean_step             | {}                                                              |
| console_enabled        | False                                                           |
| created_at             | 2016-11-30T21:41:20+00:00                                       |
| driver                 | pxe_ipmitool                                                    |
| driver_info            | {u'ipmi_password': u'******', u'ipmi_address': u'172.23.85.77', |
|                        | u'ipmi_username': u'root', u'deploy_kernel':                    |
|                        | u'1c66f6ac-e452-403e-a210-ee4cc010df00', u'deploy_ramdisk':     |
|                        | u'5edb0858-b012-4f87-bf52-3be275594410'}                        |
| driver_internal_info   | {u'is_whole_disk_image': False}                                 |
| extra                  | {u'hardware_swift_object': u'extra_hardware-3e57d7ca-           |
|                        | eac9-4b8e-8808-f8019c97a508'}                                   |
| inspection_finished_at | None                                                            |
| inspection_started_at  | None                                                            |
| instance_info          | {}                                                              |
| instance_uuid          | None                                                            |
| last_error             | None                                                            |
| maintenance            | False                                                           |
| maintenance_reason     | None                                                            |
| name                   | None                                                            |
| power_state            | power off                                                       |
| properties             | {u'cpu_arch': u'x86_64', u'root_device': {u'serial':            |
|                        | u'5000cca071225b78'}, u'cpus': u'40', u'capabilities':          |
|                        | u'profile:control,boot_option:local', u'memory_mb': u'262144',  |
|                        | u'local_gb': u'837'}                                            |
| provision_state        | available                                                       |
| provision_updated_at   | 2016-12-01T07:11:38+00:00                                       |
| raid_config            |                                                                 |
| reservation            | None                                                            |
| target_power_state     | None                                                            |
| target_provision_state | None                                                            |
| target_raid_config     |                                                                 |
| updated_at             | 2016-12-01T08:49:15+00:00                                       |
| uuid                   | 3e57d7ca-eac9-4b8e-8808-f8019c97a508                            |
+------------------------+-----------------------------------------------------------------+
[stack@director ~]$ openstack baremetal introspection bulk start 
Setting nodes for introspection to manageable...
Starting introspection of node: 3e57d7ca-eac9-4b8e-8808-f8019c97a508
Starting introspection of node: 22c20294-b127-42da-aac9-63a1b23609e0
Waiting for introspection to finish...
^CTraceback (most recent call last):
  File "/bin/openstack", line 10, in <module>
    sys.exit(main())
  File "/usr/lib/python2.7/site-packages/openstackclient/shell.py", line 441, in main
    return OpenStackShell().run(argv)
  File "/usr/lib/python2.7/site-packages/openstackclient/shell.py", line 118, in run
    ret_val = super(OpenStackShell, self).run(argv)
  File "/usr/lib/python2.7/site-packages/cliff/app.py", line 226, in run
    result = self.run_subcommand(remainder)
  File "/usr/lib/python2.7/site-packages/openstackclient/shell.py", line 153, in run_subcommand
    ret_value = super(OpenStackShell, self).run_subcommand(argv)
  File "/usr/lib/python2.7/site-packages/cliff/app.py", line 346, in run_subcommand
    result = cmd.run(parsed_args)
  File "/usr/lib/python2.7/site-packages/cliff/command.py", line 55, in run
    self.take_action(parsed_args)
  File "/usr/lib/python2.7/site-packages/tripleoclient/v1/baremetal.py", line 229, in take_action
    inspector_client, node_uuids):
  File "/usr/lib/python2.7/site-packages/tripleoclient/utils.py", line 402, in wait_for_node_introspection
    time.sleep(sleep)
KeyboardInterrupt
[stack@director ~]$ ironic node-list
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| 3e57d7ca-eac9-4b8e-8808-f8019c97a508 | None | None          | power on    | manageable         | False       |
| 22c20294-b127-42da-aac9-63a1b23609e0 | None | None          | power on    | manageable         | False       |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
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
[stack@director ~]$ 
```

# begin deploy 
```bash 
[stack@director ~]$ cat two-deploy.sh 



time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             \
-e ~/templates/my-overcloud/environments/network-isolation.yaml                   \
-e ~/templates/network-environment.yaml \
-e ~/templates/userdata.yaml \
-e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       \
--control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     \
--control-scale 1    --compute-scale 1  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   \
--neutron-network-type vlan    --neutron-disable-tunneling   \
--neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  \
--neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      \
--ntp-server   172.23.85.106   --libvirt-type  kvm





#-e ~/templates/scheduler_hints_env.yaml \
[stack@director ~]$ time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             \
> -e ~/templates/my-overcloud/environments/network-isolation.yaml                   \
> -e ~/templates/network-environment.yaml \
> -e ~/templates/userdata.yaml \
> -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       \
> --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     \
> --control-scale 1    --compute-scale 1  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   \
> --neutron-network-type vlan    --neutron-disable-tunneling   \
> --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  \
> --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      \
> --ntp-server   172.23.85.106   --libvirt-type  kvm
Deploying templates in the directory /home/stack/templates/my-overcloud
2016-12-01 09:07:14 [overcloud]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:14 [HeatAuthEncryptionKey]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:14 [Networks]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:14 [VipConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:14 [PcsdPassword]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:14 [MysqlClusterUniquePart]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:14 [MysqlRootPassword]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:14 [overcloud-VipConfig-mj7jp5dnu5mn]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:14 [VipConfigImpl]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:14 [overcloud-Networks-mrce2po6eepc]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:14 [StorageNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [HorizonSecret]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [RabbitCookie]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [HeatAuthEncryptionKey]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [VipConfig]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [MysqlRootPassword]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [PcsdPassword]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [MysqlClusterUniquePart]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [RabbitCookie]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [HorizonSecret]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [VipConfigImpl]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [overcloud-VipConfig-mj7jp5dnu5mn]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:15 [ManagementNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [TenantNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [ExternalNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [StorageMgmtNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [InternalNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [overcloud-Networks-mrce2po6eepc-ManagementNetwork-7igvquydbuoc]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:15 [overcloud-Networks-mrce2po6eepc-ManagementNetwork-7igvquydbuoc]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:15 [overcloud-Networks-mrce2po6eepc-StorageMgmtNetwork-nt2z7zel43xa]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:15 [StorageMgmtNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [overcloud-Networks-mrce2po6eepc-StorageNetwork-5xxwh22lzgi7]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:15 [StorageNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [StorageNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:15 [StorageSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [overcloud-Networks-mrce2po6eepc-TenantNetwork-fkvt3r6j6uqe]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:15 [TenantNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:15 [overcloud-Networks-mrce2po6eepc-ExternalNetwork-wnzl3yhncsyq]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:15 [ExternalNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:16 [ManagementNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:16 [overcloud-Networks-mrce2po6eepc-InternalNetwork-ndzfyun2pvwu]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:16 [InternalApiNetwork]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:16 [InternalApiNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:16 [InternalApiSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:16 [StorageMgmtNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:16 [StorageMgmtSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:16 [StorageSubnet]: CREATE_COMPLETE state changed
2016-12-01 09:07:16 [overcloud-Networks-mrce2po6eepc-StorageNetwork-5xxwh22lzgi7]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:16 [TenantNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:16 [TenantSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:16 [ExternalNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:16 [ExternalSubnet]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:17 [StorageNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:17 [TenantSubnet]: CREATE_COMPLETE state changed
2016-12-01 09:07:17 [overcloud-Networks-mrce2po6eepc-TenantNetwork-fkvt3r6j6uqe]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:18 [TenantNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:18 [InternalApiSubnet]: CREATE_COMPLETE state changed
2016-12-01 09:07:18 [overcloud-Networks-mrce2po6eepc-InternalNetwork-ndzfyun2pvwu]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:18 [StorageMgmtSubnet]: CREATE_COMPLETE state changed
2016-12-01 09:07:18 [overcloud-Networks-mrce2po6eepc-StorageMgmtNetwork-nt2z7zel43xa]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:18 [ExternalSubnet]: CREATE_COMPLETE state changed
2016-12-01 09:07:18 [overcloud-Networks-mrce2po6eepc-ExternalNetwork-wnzl3yhncsyq]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:19 [StorageMgmtNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:19 [ExternalNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:19 [InternalNetwork]: CREATE_COMPLETE state changed
2016-12-01 09:07:19 [overcloud-Networks-mrce2po6eepc]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:20 [Networks]: CREATE_COMPLETE state changed
2016-12-01 09:07:20 [ControlVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:20 [CephStorage]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:20 [ObjectStorage]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:20 [overcloud-CephStorage-47ro3m233ivj]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:20 [overcloud-CephStorage-47ro3m233ivj]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:21 [overcloud-ObjectStorage-q4d6fjkn5fgg]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:21 [overcloud-ObjectStorage-q4d6fjkn5fgg]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:22 [ControlVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 09:07:22 [CephStorage]: CREATE_COMPLETE state changed
2016-12-01 09:07:22 [ObjectStorage]: CREATE_COMPLETE state changed
2016-12-01 09:07:22 [InternalApiVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:22 [RedisVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:22 [StorageVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:22 [overcloud-RedisVirtualIP-laxih7svfqp4]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:22 [VipPort]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:22 [overcloud-InternalApiVirtualIP-5iwtbnzjpwgt]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:22 [InternalApiPort]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:23 [PublicVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:23 [StorageMgmtVirtualIP]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:23 [VipPort]: CREATE_COMPLETE state changed
2016-12-01 09:07:23 [overcloud-RedisVirtualIP-laxih7svfqp4]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:23 [InternalApiPort]: CREATE_COMPLETE state changed
2016-12-01 09:07:23 [overcloud-InternalApiVirtualIP-5iwtbnzjpwgt]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:23 [overcloud-StorageVirtualIP-kad3gty7bjmw]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:23 [StoragePort]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:23 [overcloud-PublicVirtualIP-nysvyqdwsjkf]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:24 [StoragePort]: CREATE_COMPLETE state changed
2016-12-01 09:07:24 [overcloud-StorageVirtualIP-kad3gty7bjmw]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:24 [overcloud-StorageMgmtVirtualIP-ggtfixtskgo6]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:24 [StorageMgmtPort]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:24 [ExternalPort]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:24 [ExternalPort]: CREATE_COMPLETE state changed
2016-12-01 09:07:24 [overcloud-PublicVirtualIP-nysvyqdwsjkf]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:25 [InternalApiVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 09:07:25 [StorageMgmtVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 09:07:25 [RedisVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 09:07:25 [StorageVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 09:07:25 [PublicVirtualIP]: CREATE_COMPLETE state changed
2016-12-01 09:07:25 [StorageMgmtPort]: CREATE_COMPLETE state changed
2016-12-01 09:07:25 [overcloud-StorageMgmtVirtualIP-ggtfixtskgo6]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:26 [VipMap]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:26 [overcloud-VipMap-fk6l754qxnpd]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:26 [overcloud-VipMap-fk6l754qxnpd]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:27 [VipMap]: CREATE_COMPLETE state changed
2016-12-01 09:07:27 [EndpointMap]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:27 [overcloud-EndpointMap-tdr3ewqd37qw]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:27 [overcloud-EndpointMap-tdr3ewqd37qw]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:28 [EndpointMap]: CREATE_COMPLETE state changed
2016-12-01 09:07:28 [Compute]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:30 [BlockStorage]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:30 [overcloud-Compute-hnpdr3ywy4be]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:30 [0]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:31 [Controller]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:31 [overcloud-BlockStorage-rwiegy7u7mq2]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:31 [overcloud-BlockStorage-rwiegy7u7mq2]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-01 09:07:33 [overcloud-Controller-5tjva2uz2ovy]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:33 [0]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:34 [BlockStorage]: CREATE_COMPLETE state changed
2016-12-01 09:07:34 [overcloud-Compute-hnpdr3ywy4be-0-yxi3zc7ldiqj]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:34 [NodeAdminUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:34 [NodeUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:34 [NovaComputeConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:34 [UpdateConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:35 [NovaComputeConfig]: CREATE_COMPLETE state changed
2016-12-01 09:07:36 [overcloud-Controller-5tjva2uz2ovy-0-bjxqvjoe2go5]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-01 09:07:36 [NodeAdminUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:36 [NodeUserData]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:36 [UpdateConfig]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:36 [UpdateConfig]: CREATE_COMPLETE state changed
2016-12-01 09:07:36 [NodeAdminUserData]: CREATE_COMPLETE state changed
2016-12-01 09:07:37 [NodeUserData]: CREATE_COMPLETE state changed
2016-12-01 09:07:37 [UserData]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:38 [NodeAdminUserData]: CREATE_COMPLETE state changed
2016-12-01 09:07:38 [NodeUserData]: CREATE_COMPLETE state changed
2016-12-01 09:07:38 [UpdateConfig]: CREATE_COMPLETE state changed
2016-12-01 09:07:38 [UserData]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:38 [UserData]: CREATE_COMPLETE state changed
2016-12-01 09:07:38 [NovaCompute]: CREATE_IN_PROGRESS state changed
2016-12-01 09:07:39 [UserData]: CREATE_COMPLETE state changed
2016-12-01 09:07:40 [Controller]: CREATE_IN_PROGRESS state changed

```

#  now I saw the nodes boot failed from pxe  becasue it can't get ip address from director.  

```bash

[root@director httpboot]# iptables -nvL 
Chain INPUT (policy ACCEPT 264K packets, 1342M bytes)
 pkts bytes target     prot opt in     out     source               destination         
   10  5760 ironic-inspector  udp  --  br-ctlplane *       0.0.0.0/0            0.0.0.0/0            udp dpt:67
3845K   11G neutron-openvswi-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   41G nova-api-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
  107  7573 neutron-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  107  7573 neutron-openvswi-FORWARD  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  135  9561 nova-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  135  9561 nova-api-FORWARD  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 264K packets, 1342M bytes)
 pkts bytes target     prot opt in     out     source               destination         
  11M   42G neutron-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   42G neutron-openvswi-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   42G nova-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   42G nova-api-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ironic-inspector (1 references)
 pkts bytes target     prot opt in     out     source               destination         
   10  5760 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable

Chain neutron-filter-top (2 references)
 pkts bytes target     prot opt in     out     source               destination         
  67M  295G neutron-openvswi-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain neutron-openvswi-FORWARD (1 references)
 pkts bytes target     prot opt in     out     source               destination         
69475 4950K neutron-openvswi-scope  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

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
  11M   42G nova-api-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
[root@director httpboot]# iptables -D INPUT  1 
[root@director httpboot]# iptables -nvL 
Chain INPUT (policy ACCEPT 26715 packets, 135M bytes)
 pkts bytes target     prot opt in     out     source               destination         
3889K   11G neutron-openvswi-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   42G nova-api-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
  107  7573 neutron-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  107  7573 neutron-openvswi-FORWARD  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  135  9561 nova-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  135  9561 nova-api-FORWARD  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 26729 packets, 135M bytes)
 pkts bytes target     prot opt in     out     source               destination         
  11M   42G neutron-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   42G neutron-openvswi-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   42G nova-filter-top  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  11M   42G nova-api-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ironic-inspector (0 references)
 pkts bytes target     prot opt in     out     source               destination         
   10  5760 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable

Chain neutron-filter-top (2 references)
 pkts bytes target     prot opt in     out     source               destination         
  67M  295G neutron-openvswi-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain neutron-openvswi-FORWARD (1 references)
 pkts bytes target     prot opt in     out     source               destination         
69475 4950K neutron-openvswi-scope  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

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
  11M   42G nova-api-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
[root@director httpboot]# 
``` 

# then reboot the nodes manually and try again, now they scceed to boot from pxe , the issue reproduced  , I found some erros in  the ironic-inspector.log . 

>

4331:2016-12-01 04:22:26.510 205056 DEBUG ironic_inspector.main [-] [node: MAC 7c:a2:3e:ee:88:61 BMC 172.23.85.77] Received data from the ramdisk: {u'cpu_arch': u'x86_64', u'root_disk': {u'rotational': True, u'vendor': u'HITACHI', u'name': u'/dev/sda', u'wwn_vendor_extension': None, u'wwn_with_extension': u'0x5000cca071225b78', u'model': u'HUC109090CSS600', u'wwn': u'0x5000cca071225b78', u'serial': u'5000cca071225b78', u'size': 900185481216}, u'interfaces': {u'enp129s0f2': {u'ip': None, u'mac': u'e0:97:96:14:9e:b1'}, u'enp129s0f3': {u'ip': None, u'mac': u'e0:97:96:14:9e:b2'}, u'enp129s0f0': {u'ip': None, u'mac': u'e0:97:96:14:9e:af'}, u'enp129s0f1': {u'ip': None, u'mac': u'e0:97:96:14:9e:b0'}, u'enp7s0f1': {u'ip': None, u'mac': u'7c:a2:3e:ee:88:64'}, u'enp7s0f0': {u'ip': u'172.23.85.90', u'mac': u'7c:a2:3e:ee:88:63'}, u'enp4s0f0': {u'ip': u'172.23.85.87', u'mac': u'7c:a2:3e:ee:88:61'}, u'enp4s0f1': {u'ip': u'172.23.85.89', u'mac': u'7c:a2:3e:ee:88:62'}}, u'cpus': 40, u'boot_interface': u'7c:a2:3e:ee:88:61', u'memory_mb': 262144, u'ipmi_address': u'172.23.85.77', u'inventory': {u'bmc_address': u'172.23.85.77', u'interfaces': [{u'name': u'enp4s0f1', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': u'172.23.85.89', u'mac_address': u'7c:a2:3e:ee:88:62'}, {u'name': u'enp4s0f0', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': u'172.23.85.87', u'mac_address': u'7c:a2:3e:ee:88:61'}, {u'name': u'enp7s0f0', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': u'172.23.85.90', u'mac_address': u'7c:a2:3e:ee:88:63'}, {u'name': u'enp7s0f1', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': None, u'mac_address': u'7c:a2:3e:ee:88:64'}, {u'name': u'enp129s0f2', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': None, u'mac_address': u'e0:97:96:14:9e:b1'}, {u'name': u'enp129s0f3', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': None, u'mac_address': u'e0:97:96:14:9e:b2'}, {u'name': u'enp129s0f1', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': None, u'mac_address': u'e0:97:96:14:9e:b0'}, {u'name': u'enp129s0f0', u'has_carrier': True, u'switch_port_descr': None, u'switch_chassis_descr': None, u'ipv4_address': None, u'mac_address': u'e0:97:96:14:9e:af'}], u'disks': [{u'rotational': True, u'vendor': u'HITACHI', u'name': u'/dev/sda', u'wwn_vendor_extension': None, u'wwn_with_extension': u'0x5000cca071225b78', u'model': u'HUC109090CSS600', u'wwn': u'0x5000cca071225b78', u'serial': u'5000cca071225b78', u'size': 900185481216}, {u'rotational': True, u'vendor': u'HITACHI', u'name': u'/dev/sdb', u'wwn_vendor_extension': None, u'wwn_with_extension': u'0x5000cca07122550c', u'model': u'HUC109090CSS600', u'wwn': u'0x5000cca07122550c', u'serial': u'5000cca07122550c', u'size': 900185481216}], u'system_vendor': {u'serial_number': u'210305613210F5000344', u'product_name': u'CH121 V3', u'manufacturer': u'To be filled by O.E.M.'}, u'memory': {u'physical_mb': 262144, u'total': 270084775936}, u'cpu': {u'count': 40, u'frequency': u'1388.664', u'model_name': u'Intel(R) Xeon(R) CPU E5-2660 v3 @ 2.60GHz', u'architecture': u'x86_64'}}, u'error': None, u'local_gb': 837, u'data': [[u'disk', u'logical', u'count', u'2'], [u'disk', u'sda', u'size', u'900'], [u'disk', u'sda', u'vendor', u'HITACHI'], [u'disk', u'sda', u'model', u'HUC109090CSS600'], [u'disk', u'sda', u'rev', u'A440'], [u'disk', u'sda', u'optimal_io_size', u'0'], [u'disk', u'sda', u'physical_block_size', u'512'], [u'disk', u'sda', u'rotational', u'1'], [u'disk', u'sda', u'Write Cache Enable', u'1'], [u'disk', u'sda', u'Read Cache Disable', u'0'], [u'disk', u'sda', u'wwn-id', u'wwn-0x5000cca071225b78'], [u'disk', u'sda', u'scsi-id', u'scsi-35000cca071225b78'], [u'disk', u'sdb', u'size', u'900'], [u'disk', u'sdb', u'vendor', u'HITACHI'], [u'disk', u'sdb', u'model', u'HUC109090CSS600'], [u'disk', u'sdb', u'rev', u'A440'], [u'disk', u'sdb', u'optimal_io_size', u'0'], [u'disk', u'sdb', u'physical_block_size', u'512'], [u'disk', u'sdb', u'rotational', u'1'], [u'disk', u'sdb', u'Write Cache Enable', u'1'], [u'disk', u'sdb', u'Read Cache Disable', u'0'], [u'disk', u'sdb', u'wwn-id', u'wwn-0x5000cca07122550c'], [u'disk', u'sdb', u'scsi-id', u'scsi-35000cca07122550c'], [u'system', u'product', u'serial', u'210305613210F5000344'], [u'system', u'product', u'name', u'CH121 V3 (Type1Sku0)'], [u'system', u'product', u'vendor', u'To be filled by O.E.M.'], [u'system', u'product', u'version', u'V100R003'], [u'system', u'product', u'uuid', u'2A389A46-1DD2-11B2-B137-001823E5F68B'], [u'system', u'motherboard', u'name', u'IT11SGCA1'], [u'system', u'motherboard', u'vendor', u'Huawei Technologies Co., Ltd.'], [u'system', u'motherboard', u'version', u'V100R003'], [u'system', u'motherboard', u'serial', u'022KJF10F5000288'], [u'firmware', u'bios', u'version', u'1.30'], [u'firmware', u'bios', u'date', u'02/12/2015'], [u'firmware', u'bios', u'vendor', u'Insyde Corp.'], [u'memory', u'total', u'size', u'274877906944'], [u'memory', u'bank:0', u'size', u'17179869184'], [u'memory', u'bank:0', u'clock', u'2133000000'], [u'memory', u'bank:0', u'description', u'DIMM DRAM Synchronous 2133 MHz
                                                                                                                                18,1          80%

4351:2016-12-01 04:22:26.525 205056 ERROR ironic_inspector.utils [-] [node: MAC 7c:a2:3e:ee:88:61 BMC 172.23.85.77] The following failures happened during running pre-processing hooks:
4352:Look up error: Could not find a node for attributes {'bmc_address': u'172.23.85.77', 'mac': [u'7c:a2:3e:ee:88:61']}
4353:2016-12-01 04:22:26.525 205056 DEBUG ironic_inspector.main [-] Returning error to client: The following failures happened during running pre-processing hooks:
4354:Look up error: Could not find a node for attributes {'bmc_address': u'172.23.85.77', 'mac': [u'7c:a2:3e:ee:88:61']} error_response /usr/lib/python2.7/site-packages/ironic_inspector/main.py:64



























