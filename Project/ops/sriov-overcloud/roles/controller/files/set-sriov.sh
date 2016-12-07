#!/bin/bash 

  
  echo "`date`,config sriov on host node ..." >> /tmp/config.sriov

  cp  /etc/neutron/plugin.ini   "/etc/neutron/plugin.ini-`date`"

  openstack-config --set  /etc/neutron/plugin.ini ml2  mechanism_drivers "openvswitch,sriovnicswitch"

  openstack-config --set  /etc/neutron/plugin.ini ml2_type_vlan network_vlan_ranges "datacentre:2:4090,Date_OVS_vlan_phynet0:2:4090,Sriov_Vlan_phynet0:2:4090,Sriov_Vlan_phynet1:2:4090,Sriov_Vlan_phynet2:2:4090,Sriov_Vlan_phynet3:2:4090"
 
  cp /etc/neutron/plugins/ml2/ml2_conf_sriov.ini "/etc/neutron/plugins/ml2/ml2_conf_sriov.ini-`date`"

  openstack-config --set /etc/neutron/plugins/ml2/ml2_conf_sriov.ini ml2_sriov  supported_pci_vendor_devs "8086:10ed"
  openstack-config --set /etc/neutron/plugins/ml2/ml2_conf_sriov.ini sriov_nic physical_device_mappings "Sriov_Vlan_phynet0:enp7s0f0,Sriov_Vlan_phynet1:enp7s0f1,Sriov_Vlan_phynet2:enp129s0f0,Sriov_Vlan_phynet3:enp129s0f1"

  cp /usr/lib/systemd/system/neutron-server.service "/usr/lib/systemd/system/neutron-server.service-`date`"

  openstack-config --set /usr/lib/systemd/system/neutron-server.service Service ExecStart "/usr/bin/neutron-server --config-file /usr/share/neutron/neutron-dist.conf --config-dir /usr/share/neutron/server --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugin.ini --config-dir /etc/neutron/conf.d/common --config-dir /etc/neutron/conf.d/neutron-server --config-file /etc/neutron/plugins/ml2/ml2_conf_sriov.ini --log-file /var/log/neutron/server.log"
  
  systemctl daemon-reload

  pcs resource unmanage neutron-server
  systemctl restart neutron-server.service
  pcs resource manage neutron-server


  cp /etc/nova/nova.conf  "/etc/nova/nova.conf-`date`"


  openstack-config --set /etc/nova/nova.conf DEFAULT scheduler_default_filters "RetryFilter,AvailabilityZoneFilter,RamFilter,ComputeFilter,ComputeCapabilitiesFilter,ImagePropertiesFilter,ServerGroupAntiAffinityFilter,ServerGroupAffinityFilter,PciPassthroughFilter,NUMATopologyFilter" 
 

  pcs resource unmanage openstack-nova-scheduler
  systemctl restart openstack-nova-scheduler.service
  pcs resource manage openstack-nova-scheduler 



