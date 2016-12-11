# case_pxe_issue

# 出现一个网卡PXE 然后马上从硬盘启动了的现象
## symptom
E0 97 96 14 9E AF ---> pxe   enp129s0f0 

enp4s0f0 

## Solution
Change Bios 


# Http Post failed 

## symptom 
{
"mac":[
"7c:a2:3e:ee:88:75" 
],
"cpu":"40",
"memory":"257600",
"disk":"800",
"arch":"x86_64",
"pm_type":"pxe_ipmitool",
"pm_user":"root",
"pm_password":"Huawei12#$",
"pm_addr":"172.23.85.78"
},


Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:19.933 228301 DEBUG ironic_inspector.node_cache [-] Trying to use bmc_address of value [u'172.23.85.78'] for node look up find_node /usr/lib/python2.7/site-packages/ironic_inspector/node_cache.py:489
Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:19.935 228301 DEBUG ironic_inspector.node_cache [-] Trying to use mac of value [u'7c:a2:3e:ee:88:75'] for node look up find_node /usr/lib/python2.7/site-packages/ironic_inspector/node_cache.py:489
Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:19.936 228301 INFO ironic_inspector.utils [-] Could not find a node for attributes {'bmc_address': u'172.23.85.78', 'mac': [u'7c:a2:3e:ee:88:75']}
Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:19.937 228301 ERROR ironic_inspector.utils [-] [node: MAC 7c:a2:3e:ee:88:75 BMC 172.23.85.78] The following failures happened during running pre-processing hooks:
Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: Look up error: Could not find a node for attributes {'bmc_address': u'172.23.85.78', 'mac': [u'7c:a2:3e:ee:88:75']}
Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:19.937 228301 DEBUG ironic_inspector.main [-] Returning error to client: The following failures happened during running pre-processing hooks:
Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: Look up error: Could not find a node for attributes {'bmc_address': u'172.23.85.78', 'mac': [u'7c:a2:3e:ee:88:75']} error_response /usr/lib/python2.7/site-packages/ironic_inspector/main.py:64
Nov 30 11:01:19 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:19.938 228301 INFO werkzeug [-] 172.23.85.92 - - [30/Nov/2016 11:01:19] "POST /v1/continue HTTP/1.1" 400 -
Nov 30 11:01:29 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:29.926 228301 DEBUG futurist.periodics [-] Submitting periodic function 'ironic_inspector.main.periodic_update' _process_scheduled /usr/lib/python2.7/site-packages/futurist/periodics.py:611
Nov 30 11:01:29 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:29.927 228301 DEBUG stevedore.extension [-] found extension EntryPoint.parse('v2token = keystoneauth1.loading._plugins.identity.v2:Token') _load_plugins /usr/lib/python2.7/site-packages/stevedore/extension.py:157
Nov 30 11:01:29 director.vepc.mnc066.mcc260.3gppnetwork.org ironic-inspector[228301]: 2016-11-30 11:01:29.927 228301 DEBUG stevedore.extension [-] found extension EntryPoint.parse('admin_token = keystoneauth1.loading._plugins.admin_token:AdminToken') _load_plugins /usr/lib/python2.7/site-packages/stevedore/extension.py:157


[stack@director ~]$ ironic node-port-list b537d8c2-59ba-4499-a496-240e80ebbded
+--------------------------------------+-------------------+
| UUID                                 | Address           |
+--------------------------------------+-------------------+
| 08fc966d-3eed-452d-b2ba-24af8bcb7d90 | 7c:a2:3e:ee:88:77 |
+--------------------------------------+-------------------+

** ironic 数据库竟然把mac address 搞错了 ** 

[stack@director ~]$ ironic node-show b537d8c2-59ba-4499-a496-240e80ebbded
+------------------------+------------------------------------------------------------------------+
| Property               | Value                                                                  |
+------------------------+------------------------------------------------------------------------+
| chassis_uuid           |                                                                        |
| clean_step             | {}                                                                     |
| console_enabled        | False                                                                  |
| created_at             | 2016-11-29T16:26:57+00:00                                              |
| driver                 | pxe_ipmitool                                                           |
| driver_info            | {u'ipmi_password': u'******', u'ipmi_address': u'172.23.85.78',        |
|                        | u'ipmi_username': u'root', u'deploy_kernel':                           |
|                        | u'1c66f6ac-e452-403e-a210-ee4cc010df00', u'deploy_ramdisk':            |
|                        | u'5edb0858-b012-4f87-bf52-3be275594410'}                               |
| driver_internal_info   | {u'is_whole_disk_image': False}                                        |
| extra                  | {u'hardware_swift_object': u'extra_hardware-                           |
|                        | b537d8c2-59ba-4499-a496-240e80ebbded'}                                 |
| inspection_finished_at | None                                                                   |
| inspection_started_at  | None                                                                   |
| instance_info          | {}                                                                     |
| instance_uuid          | None                                                                   |
| last_error             | None                                                                   |
| maintenance            | False                                                                  |
| maintenance_reason     | None                                                                   |
| name                   | None                                                                   |
| power_state            | power off                                                              |
| properties             | {u'memory_mb': u'262144', u'cpu_arch': u'x86_64', u'local_gb': u'837', |
|                        | u'cpus': u'40', u'capabilities':                                       |
|                        | u'node:controller-1,profile:control,boot_option:local'}                |
| provision_state        | available                                                              |
| provision_updated_at   | 2016-11-30T16:31:36+00:00                                              |
| raid_config            |                                                                        |
| reservation            | None                                                                   |
| target_power_state     | None                                                                   |
| target_provision_state | None                                                                   |
| target_raid_config     |                                                                        |
| updated_at             | 2016-11-30T16:31:37+00:00                                              |
| uuid                   | b537d8c2-59ba-4499-a496-240e80ebbded                                   |
+------------------------+------------------------------------------------------------------------+


 

2016-11-30 12:27:29.591 228301 INFO ironic_inspector.plugins.standard [-] [node: MAC 7c:a2:3e:e4:69:dd BMC 172.23.85.74] Using network interface(s): enp4s0f0 {'ip': u'172.23.85.88', 'mac': u'7c:a2:3e:e4:69:dd'}
2016-11-30 12:27:29.591 228301 DEBUG ironic_inspector.node_cache [-] Trying to use bmc_address of value [u'172.23.85.74'] for node look up find_node /usr/lib/python2.7/site-packages/ironic_inspector/node_cache.py:489
2016-11-30 12:27:29.593 228301 DEBUG ironic_inspector.node_cache [-] Trying to use mac of value [u'7c:a2:3e:e4:69:dd'] for node look up find_node /usr/lib/python2.7/site-packages/ironic_inspector/node_cache.py:489
2016-11-30 12:27:29.595 228301 INFO ironic_inspector.utils [-] Could not find a node for attributes {'bmc_address': u'172.23.85.74', 'mac': [u'7c:a2:3e:e4:69:dd']}
2016-11-30 12:27:29.595 228301 ERROR ironic_inspector.utils [-] [node: MAC 7c:a2:3e:e4:69:dd BMC 172.23.85.74] The following failures happened during running pre-processing hooks:
Look up error: Could not find a node for attributes {'bmc_address': u'172.23.85.74', 'mac': [u'7c:a2:3e:e4:69:dd']}
2016-11-30 12:27:29.596 228301 DEBUG ironic_inspector.main [-] Returning error to client: The following failures happened during running pre-processing hooks:
Look up error: Could not find a node for attributes {'bmc_address': u'172.23.85.74', 'mac': [u'7c:a2:3e:e4:69:dd']} error_response /usr/lib/python2.7/site-packages/ironic_inspector/main.py:64









