#!/bin/bash 

  echo "`date`,config sriov on compute node ..." >> /tmp/config.sriov.compute
  
  
  cp /etc/nova/nova.conf  "/etc/nova/nova.conf-`date`"

  openstack-config --set /etc/nova/nova.conf DEFAULT pci_passthrough_whitelist  "{\"devname\":\"enp7s0f0\", \"physical_network\":\"Sriov_Vlan_phynet0\",\"devname\":\"enp7s0f1\",\"physical_network\":\"Sriov_Vlan_phynet1\",\"devname\":\"enp129s0f0\", \"physical_network\":\"Sriov_Vlan_phynet2\",\"devname\":\"enp129s0f1\",\"physical_network\":\"Sriov_Vlan_phynet3\"}"

  systemctl restart openstack-nova-compute.service
