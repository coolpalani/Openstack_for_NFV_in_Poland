
# Note, how do I solve sirov port bind failed.

[root@slot14 neutron]# diff plugin.ini plugins/ml2/ml2_conf.ini 
204c204
< network_vlan_ranges =datacentre:2:4090,Date_OVS_vlan_phynet0:2:4090,Sriov_Vlan_phynet0:2:4090,Sriov_Vlan_phynet1:2:4090,Sriov_Vlan_phynet2:2:4090,Sriov_Vlan_phynet3:2:4090
---
> network_vlan_ranges =datacentre:2:4090,Date_OVS_vlan_phynet0:2:4090
[root@slot14 neutron]# cp plugin.ini plugins/ml2/ml2_conf.ini 
cp: overwrite ‘plugins/ml2/ml2_conf.ini’? y


it is wrong
[root@network ~]# vi /usr/lib/systemd/system/neutron-server.service

[Service]
Type=notify
User=neutron
ExecStart=/usr/bin/neutron-server --config-file /usr/share/neutron/neutron-dist.conf --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/openvswitch_agent.ini --config-file /etc/neutron/plugins/ml2/sriov_agent.ini  --log-file /var/log/neutron/server.log


[root@slot7 neutron]# diff -Nur neutron.conf  neutron.conf-Wed\ Dec\ \ 7\ 10\:38\:58\ CET\ 2016 
[root@slot7 neutron]# vim neutron.conf 
[root@slot7 neutron]#

service_plugins=router,qos


