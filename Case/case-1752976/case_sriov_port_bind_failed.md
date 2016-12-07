# Issues in SRIOV
[Redhat Case](https://access.redhat.com/support/cases/#/case/01752976)

## Symptom


```sh 


[root@slot5 neutron]# mysql  -e"select *  from nova.pci_devices " > /tmp/pci_devices_in_mysql.txt
[root@slot5 neutron]# vim /tmp/pci_devices_in_mysql.txt  
[root@slot5 neutron]# nova list
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| ID                                   | Name  | Status | Task State | Power State | Networks                  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| 7e792a78-7958-4e0d-8daa-ab495721d92b | br3   | ERROR  | -          | NOSTATE     |                           |
| 49a2b1b6-7314-440a-ab71-ee75683cf416 | tesss | ACTIVE | -          | Running     | OSS_Service=192.168.22.7  |
| 4fc3952d-979b-4087-8a38-77e5ae1e2ff7 | test1 | ACTIVE | -          | Running     | OSS_Service=192.168.22.10 |
| 066c3e24-3bcc-49a3-b411-f2edf9edcf0b | test2 | ACTIVE | -          | Running     | OSS_Service=192.168.22.11 |
| ebe53260-ca4d-41d0-b640-0bd526aa1859 | test5 | ACTIVE | -          | Running     | OSS_Service=192.168.22.14 |
| 898bbf05-36bb-4709-86c3-6619c7fedfe7 | test6 | ACTIVE | -          | Running     | OSS_Service=192.168.22.15 |
| 8c50fa01-c9e8-417c-bdf0-3a7c6fe63133 | zl    | ACTIVE | -          | Running     | OSS_Service=192.168.22.6  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
[root@slot5 neutron]# 
[root@slot5 neutron]# neutron net-info sriov1
Unknown command [u'net-info', u'sriov1']
[root@slot5 neutron]# neutron net-show sriov1
+---------------------------+--------------------------------------+
| Field                     | Value                                |
+---------------------------+--------------------------------------+
| admin_state_up            | True                                 |
| availability_zone_hints   |                                      |
| availability_zones        | nova                                 |
| created_at                | 2016-12-06T11:01:15                  |
| description               |                                      |
| id                        | 31d3864e-506f-4665-98f2-7645844e53ab |
| ipv4_address_scope        |                                      |
| ipv6_address_scope        |                                      |
| mtu                       | 1500                                 |
| name                      | sriov1                               |
| port_security_enabled     | True                                 |
| provider:network_type     | vlan                                 |
| provider:physical_network | Sriov_Vlan_phynet1                   |
| provider:segmentation_id  | 4002                                 |
| qos_policy_id             |                                      |
| router:external           | False                                |
| shared                    | False                                |
| status                    | ACTIVE                               |
| subnets                   | a3654f03-6104-443c-b432-ddc09a169236 |
| tags                      |                                      |
| tenant_id                 | 2a91aa4eedba4cf28631d6f0afb66e99     |
| updated_at                | 2016-12-06T11:01:15                  |
+---------------------------+--------------------------------------+
[root@slot5 neutron]# neutron  subnet-show a3654f03-6104-443c-b432-ddc09a169236
+-------------------+----------------------------------------------------+
| Field             | Value                                              |
+-------------------+----------------------------------------------------+
| allocation_pools  | {"start": "192.168.11.2", "end": "192.168.11.254"} |
| cidr              | 192.168.11.0/24                                    |
| created_at        | 2016-12-06T11:01:41                                |
| description       |                                                    |
| dns_nameservers   |                                                    |
| enable_dhcp       | True                                               |
| gateway_ip        | 192.168.11.1                                       |
| host_routes       |                                                    |
| id                | a3654f03-6104-443c-b432-ddc09a169236               |
| ip_version        | 4                                                  |
| ipv6_address_mode |                                                    |
| ipv6_ra_mode      |                                                    |
| name              |                                                    |
| network_id        | 31d3864e-506f-4665-98f2-7645844e53ab               |
| subnetpool_id     |                                                    |
| tenant_id         | 2a91aa4eedba4cf28631d6f0afb66e99                   |
| updated_at        | 2016-12-06T11:01:41                                |
+-------------------+----------------------------------------------------+
[root@slot5 neutron]# neutron port-list | grep 192.168.11
| 29f02e84-710b-49b0-ac03-26fc44a1d171 |      | fa:16:3e:45:c8:8f | {"subnet_id": "a3654f03-6104-443c-b432-ddc09a169236", "ip_address": "192.168.11.4"}  |
| 448ff64c-be87-48ed-98d3-1b67b135567e | vf1  | fa:16:3e:40:ea:ed | {"subnet_id": "a3654f03-6104-443c-b432-ddc09a169236", "ip_address": "192.168.11.5"}  |
| 66a7f237-d4b4-4b91-9300-c9cf71eaa353 |      | fa:16:3e:f3:84:c1 | {"subnet_id": "a3654f03-6104-443c-b432-ddc09a169236", "ip_address": "192.168.11.2"}  |
| ad925e06-6e39-463e-b540-18a7ab4cdbde |      | fa:16:3e:d1:89:46 | {"subnet_id": "a3654f03-6104-443c-b432-ddc09a169236", "ip_address": "192.168.11.3"}  |
[root@slot5 neutron]# neutron port-show 448ff64c-be87-48ed-98d3-1b67b135567e
+-----------------------+-------------------------------------------------------------------------------------+
| Field                 | Value                                                                               |
+-----------------------+-------------------------------------------------------------------------------------+
| admin_state_up        | True                                                                                |
| binding:host_id       |                                                                                     |
| binding:profile       | {}                                                                                  |
| binding:vif_details   | {}                                                                                  |
| binding:vif_type      | unbound                                                                             |
| binding:vnic_type     | direct                                                                              |
| created_at            | 2016-12-06T11:02:48                                                                 |
| description           |                                                                                     |
| device_id             |                                                                                     |
| device_owner          |                                                                                     |
| dns_name              |                                                                                     |
| extra_dhcp_opts       |                                                                                     |
| fixed_ips             | {"subnet_id": "a3654f03-6104-443c-b432-ddc09a169236", "ip_address": "192.168.11.5"} |
| id                    | 448ff64c-be87-48ed-98d3-1b67b135567e                                                |
| mac_address           | fa:16:3e:40:ea:ed                                                                   |
| name                  | vf1                                                                                 |
| network_id            | 31d3864e-506f-4665-98f2-7645844e53ab                                                |
| port_security_enabled | True                                                                                |
| qos_policy_id         |                                                                                     |
| status                | DOWN                                                                                |
| tenant_id             | 2a91aa4eedba4cf28631d6f0afb66e99                                                    |
| updated_at            | 2016-12-07T01:12:22                                                                 |
+-----------------------+-------------------------------------------------------------------------------------+
[root@slot5 neutron]# neutron port-create sriov1  --binding:vnic_type direct --name vf2
Created a new port:
+-----------------------+-------------------------------------------------------------------------------------+
| Field                 | Value                                                                               |
+-----------------------+-------------------------------------------------------------------------------------+
| admin_state_up        | True                                                                                |
| binding:host_id       |                                                                                     |
| binding:profile       | {}                                                                                  |
| binding:vif_details   | {}                                                                                  |
| binding:vif_type      | unbound                                                                             |
| binding:vnic_type     | direct                                                                              |
| created_at            | 2016-12-07T06:28:57                                                                 |
| description           |                                                                                     |
| device_id             |                                                                                     |
| device_owner          |                                                                                     |
| dns_name              |                                                                                     |
| extra_dhcp_opts       |                                                                                     |
| fixed_ips             | {"subnet_id": "a3654f03-6104-443c-b432-ddc09a169236", "ip_address": "192.168.11.6"} |
| id                    | 10ee0d8f-901e-45a8-8b2d-fbbfe46028ba                                                |
| mac_address           | fa:16:3e:5c:04:84                                                                   |
| name                  | vf2                                                                                 |
| network_id            | 31d3864e-506f-4665-98f2-7645844e53ab                                                |
| port_security_enabled | True                                                                                |
| qos_policy_id         |                                                                                     |
| status                | DOWN                                                                                |
| tenant_id             | 2a91aa4eedba4cf28631d6f0afb66e99                                                    |
| updated_at            | 2016-12-07T06:28:57                                                                 |
+-----------------------+-------------------------------------------------------------------------------------+
[root@slot5 neutron]# nova boot --image rhel7.3 --flavor m1.small --nic port-id=10ee0d8f-901e-45a8-8b2d-fbbfe46028ba  --availability-zone nova:slot1.vepc.mnc066.mcc260.3gppnetwork.org br4 
+--------------------------------------+------------------------------------------------+
| Property                             | Value                                          |
+--------------------------------------+------------------------------------------------+
| OS-DCF:diskConfig                    | MANUAL                                         |
| OS-EXT-AZ:availability_zone          | nova                                           |
| OS-EXT-SRV-ATTR:host                 | -                                              |
| OS-EXT-SRV-ATTR:hostname             | br4                                            |
| OS-EXT-SRV-ATTR:hypervisor_hostname  | -                                              |
| OS-EXT-SRV-ATTR:instance_name        | instance-00000089                              |
| OS-EXT-SRV-ATTR:kernel_id            |                                                |
| OS-EXT-SRV-ATTR:launch_index         | 0                                              |
| OS-EXT-SRV-ATTR:ramdisk_id           |                                                |
| OS-EXT-SRV-ATTR:reservation_id       | r-rd3p1d8c                                     |
| OS-EXT-SRV-ATTR:root_device_name     | -                                              |
| OS-EXT-SRV-ATTR:user_data            | -                                              |
| OS-EXT-STS:power_state               | 0                                              |
| OS-EXT-STS:task_state                | scheduling                                     |
| OS-EXT-STS:vm_state                  | building                                       |
| OS-SRV-USG:launched_at               | -                                              |
| OS-SRV-USG:terminated_at             | -                                              |
| accessIPv4                           |                                                |
| accessIPv6                           |                                                |
| adminPass                            | M4bW38VkvKcF                                   |
| config_drive                         |                                                |
| created                              | 2016-12-07T06:30:21Z                           |
| description                          | -                                              |
| flavor                               | m1.small (2)                                   |
| hostId                               |                                                |
| host_status                          |                                                |
| id                                   | 699d9335-f5ad-47da-b2eb-caad00846882           |
| image                                | rhel7.3 (67b2092f-9b08-4c4d-8045-6e61fb070ff0) |
| key_name                             | -                                              |
| locked                               | False                                          |
| metadata                             | {}                                             |
| name                                 | br4                                            |
| os-extended-volumes:volumes_attached | []                                             |
| progress                             | 0                                              |
| security_groups                      | default                                        |
| status                               | BUILD                                          |
| tenant_id                            | 2a91aa4eedba4cf28631d6f0afb66e99               |
| updated                              | 2016-12-07T06:30:22Z                           |
| user_id                              | d27e186502944e06999726e454b80702               |
+--------------------------------------+------------------------------------------------+
[root@slot5 neutron]#  neutron port-create sriov1  --binding:vnic_type direct --name vf5 
Created a new port:
+-----------------------+-------------------------------------------------------------------------------------+
| Field                 | Value                                                                               |
+-----------------------+-------------------------------------------------------------------------------------+
| admin_state_up        | True                                                                                |
| binding:host_id       |                                                                                     |
| binding:profile       | {}                                                                                  |
| binding:vif_details   | {}                                                                                  |
| binding:vif_type      | unbound                                                                             |
| binding:vnic_type     | direct                                                                              |
| created_at            | 2016-12-07T06:30:37                                                                 |
| description           |                                                                                     |
| device_id             |                                                                                     |
| device_owner          |                                                                                     |
| dns_name              |                                                                                     |
| extra_dhcp_opts       |                                                                                     |
| fixed_ips             | {"subnet_id": "a3654f03-6104-443c-b432-ddc09a169236", "ip_address": "192.168.11.7"} |
| id                    | 21d9fab1-ada9-4be1-89fe-068c2f818c13                                                |
| mac_address           | fa:16:3e:b0:6a:08                                                                   |
| name                  | vf5                                                                                 |
| network_id            | 31d3864e-506f-4665-98f2-7645844e53ab                                                |
| port_security_enabled | True                                                                                |
| qos_policy_id         |                                                                                     |
| status                | DOWN                                                                                |
| tenant_id             | 2a91aa4eedba4cf28631d6f0afb66e99                                                    |
| updated_at            | 2016-12-07T06:30:38                                                                 |
+-----------------------+-------------------------------------------------------------------------------------+
[root@slot5 neutron]#  nova boot --image rhel7.3 --flavor m1.small --nic port-id=21d9fab1-ada9-4be1-89fe-068c2f818c13 br5
+--------------------------------------+------------------------------------------------+
| Property                             | Value                                          |
+--------------------------------------+------------------------------------------------+
| OS-DCF:diskConfig                    | MANUAL                                         |
| OS-EXT-AZ:availability_zone          |                                                |
| OS-EXT-SRV-ATTR:host                 | -                                              |
| OS-EXT-SRV-ATTR:hostname             | br5                                            |
| OS-EXT-SRV-ATTR:hypervisor_hostname  | -                                              |
| OS-EXT-SRV-ATTR:instance_name        | instance-0000008c                              |
| OS-EXT-SRV-ATTR:kernel_id            |                                                |
| OS-EXT-SRV-ATTR:launch_index         | 0                                              |
| OS-EXT-SRV-ATTR:ramdisk_id           |                                                |
| OS-EXT-SRV-ATTR:reservation_id       | r-4f0y50dl                                     |
| OS-EXT-SRV-ATTR:root_device_name     | -                                              |
| OS-EXT-SRV-ATTR:user_data            | -                                              |
| OS-EXT-STS:power_state               | 0                                              |
| OS-EXT-STS:task_state                | scheduling                                     |
| OS-EXT-STS:vm_state                  | building                                       |
| OS-SRV-USG:launched_at               | -                                              |
| OS-SRV-USG:terminated_at             | -                                              |
| accessIPv4                           |                                                |
| accessIPv6                           |                                                |
| adminPass                            | g3ZLu6QeV95s                                   |
| config_drive                         |                                                |
| created                              | 2016-12-07T06:31:07Z                           |
| description                          | -                                              |
| flavor                               | m1.small (2)                                   |
| hostId                               |                                                |
| host_status                          |                                                |
| id                                   | 8ad4dc47-32ee-4bf3-9718-6382df30f8bb           |
| image                                | rhel7.3 (67b2092f-9b08-4c4d-8045-6e61fb070ff0) |
| key_name                             | -                                              |
| locked                               | False                                          |
| metadata                             | {}                                             |
| name                                 | br5                                            |
| os-extended-volumes:volumes_attached | []                                             |
| progress                             | 0                                              |
| security_groups                      | default                                        |
| status                               | BUILD                                          |
| tenant_id                            | 2a91aa4eedba4cf28631d6f0afb66e99               |
| updated                              | 2016-12-07T06:31:07Z                           |
| user_id                              | d27e186502944e06999726e454b80702               |
+--------------------------------------+------------------------------------------------+
[root@slot5 neutron]# nova list
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| ID                                   | Name  | Status | Task State | Power State | Networks                  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| 7e792a78-7958-4e0d-8daa-ab495721d92b | br3   | ERROR  | -          | NOSTATE     |                           |
| 699d9335-f5ad-47da-b2eb-caad00846882 | br4   | ERROR  | -          | NOSTATE     |                           |
| 8ad4dc47-32ee-4bf3-9718-6382df30f8bb | br5   | BUILD  | networking | NOSTATE     |                           |
| 49a2b1b6-7314-440a-ab71-ee75683cf416 | tesss | ACTIVE | -          | Running     | OSS_Service=192.168.22.7  |
| 4fc3952d-979b-4087-8a38-77e5ae1e2ff7 | test1 | ACTIVE | -          | Running     | OSS_Service=192.168.22.10 |
| 066c3e24-3bcc-49a3-b411-f2edf9edcf0b | test2 | ACTIVE | -          | Running     | OSS_Service=192.168.22.11 |
| ebe53260-ca4d-41d0-b640-0bd526aa1859 | test5 | ACTIVE | -          | Running     | OSS_Service=192.168.22.14 |
| 898bbf05-36bb-4709-86c3-6619c7fedfe7 | test6 | ACTIVE | -          | Running     | OSS_Service=192.168.22.15 |
| 8c50fa01-c9e8-417c-bdf0-3a7c6fe63133 | zl    | ACTIVE | -          | Running     | OSS_Service=192.168.22.6  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
[root@slot5 neutron]# nova list
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| ID                                   | Name  | Status | Task State | Power State | Networks                  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| 7e792a78-7958-4e0d-8daa-ab495721d92b | br3   | ERROR  | -          | NOSTATE     |                           |
| 699d9335-f5ad-47da-b2eb-caad00846882 | br4   | ERROR  | -          | NOSTATE     |                           |
| 8ad4dc47-32ee-4bf3-9718-6382df30f8bb | br5   | BUILD  | spawning   | NOSTATE     |                           |
| 49a2b1b6-7314-440a-ab71-ee75683cf416 | tesss | ACTIVE | -          | Running     | OSS_Service=192.168.22.7  |
| 4fc3952d-979b-4087-8a38-77e5ae1e2ff7 | test1 | ACTIVE | -          | Running     | OSS_Service=192.168.22.10 |
| 066c3e24-3bcc-49a3-b411-f2edf9edcf0b | test2 | ACTIVE | -          | Running     | OSS_Service=192.168.22.11 |
| ebe53260-ca4d-41d0-b640-0bd526aa1859 | test5 | ACTIVE | -          | Running     | OSS_Service=192.168.22.14 |
| 898bbf05-36bb-4709-86c3-6619c7fedfe7 | test6 | ACTIVE | -          | Running     | OSS_Service=192.168.22.15 |
| 8c50fa01-c9e8-417c-bdf0-3a7c6fe63133 | zl    | ACTIVE | -          | Running     | OSS_Service=192.168.22.6  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
[root@slot5 neutron]# nova list
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| ID                                   | Name  | Status | Task State | Power State | Networks                  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| 7e792a78-7958-4e0d-8daa-ab495721d92b | br3   | ERROR  | -          | NOSTATE     |                           |
| 699d9335-f5ad-47da-b2eb-caad00846882 | br4   | ERROR  | -          | NOSTATE     |                           |
| 8ad4dc47-32ee-4bf3-9718-6382df30f8bb | br5   | BUILD  | networking | NOSTATE     |                           |
| 49a2b1b6-7314-440a-ab71-ee75683cf416 | tesss | ACTIVE | -          | Running     | OSS_Service=192.168.22.7  |
| 4fc3952d-979b-4087-8a38-77e5ae1e2ff7 | test1 | ACTIVE | -          | Running     | OSS_Service=192.168.22.10 |
| 066c3e24-3bcc-49a3-b411-f2edf9edcf0b | test2 | ACTIVE | -          | Running     | OSS_Service=192.168.22.11 |
| ebe53260-ca4d-41d0-b640-0bd526aa1859 | test5 | ACTIVE | -          | Running     | OSS_Service=192.168.22.14 |
| 898bbf05-36bb-4709-86c3-6619c7fedfe7 | test6 | ACTIVE | -          | Running     | OSS_Service=192.168.22.15 |
| 8c50fa01-c9e8-417c-bdf0-3a7c6fe63133 | zl    | ACTIVE | -          | Running     | OSS_Service=192.168.22.6  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
[root@slot5 neutron]# nova list
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| ID                                   | Name  | Status | Task State | Power State | Networks                  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
| 7e792a78-7958-4e0d-8daa-ab495721d92b | br3   | ERROR  | -          | NOSTATE     |                           |
| 699d9335-f5ad-47da-b2eb-caad00846882 | br4   | ERROR  | -          | NOSTATE     |                           |
| 8ad4dc47-32ee-4bf3-9718-6382df30f8bb | br5   | ERROR  | -          | NOSTATE     |                           |
| 49a2b1b6-7314-440a-ab71-ee75683cf416 | tesss | ACTIVE | -          | Running     | OSS_Service=192.168.22.7  |
| 4fc3952d-979b-4087-8a38-77e5ae1e2ff7 | test1 | ACTIVE | -          | Running     | OSS_Service=192.168.22.10 |
| 066c3e24-3bcc-49a3-b411-f2edf9edcf0b | test2 | ACTIVE | -          | Running     | OSS_Service=192.168.22.11 |
| ebe53260-ca4d-41d0-b640-0bd526aa1859 | test5 | ACTIVE | -          | Running     | OSS_Service=192.168.22.14 |
| 898bbf05-36bb-4709-86c3-6619c7fedfe7 | test6 | ACTIVE | -          | Running     | OSS_Service=192.168.22.15 |
| 8c50fa01-c9e8-417c-bdf0-3a7c6fe63133 | zl    | ACTIVE | -          | Running     | OSS_Service=192.168.22.6  |
+--------------------------------------+-------+--------+------------+-------------+---------------------------+
[root@slot5 neutron]# 










```






## Trouble-shooting


```sh
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











```



