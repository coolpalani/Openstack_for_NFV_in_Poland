
#Case boot sriov vm failed on slot2

## Symptom 

sriov vm only boot successfully on slot1 , not on slot2, slot3, 

It reports "port bind failed" .

## trouble-shooting

[root@slot2 ml2]# diff -Nur sriov_agent.ini sriov_agent.ini.issue
--- sriov_agent.ini	2016-12-08 06:15:58.328762469 +0100
+++ sriov_agent.ini.issue	2016-12-08 06:15:20.166644627 +0100
@@ -6,13 +6,13 @@
 
 # If set to true, the logging level will be set to DEBUG instead of the default
 # INFO level. (boolean value)
-debug = true
+#debug = false
 
 # If set to false, the logging level will be set to WARNING instead of the
 # default INFO level. (boolean value)
 # This option is deprecated for removal.
 # Its value may be silently ignored in the future.
-verbose = true
+#verbose = true
 
 # The name of a logging configuration file. This file is appended to any
 # existing logging configuration files. For details about logging configuration
@@ -127,8 +127,6 @@
 # list. (list value)
 #exclude_devices =
 
-[securitygroup]
-firewall_driver = neutron.agent.firewall.NoopFirewallDriver
 
 [sriov_nic]
 physical_device_mappings = Sriov_Vlan_phynet0:enp7s0f0,Sriov_Vlan_phynet1:enp7s0f1,Sriov_Vlan_phynet2:enp129s0f0,Sriov_Vlan_phynet3:enp129s0f1
[root@slot2 ml2]# 


## Solution 

add the two line:
>[securitygroup]
>firewall_driver = neutron.agent.firewall.NoopFirewallDriver
