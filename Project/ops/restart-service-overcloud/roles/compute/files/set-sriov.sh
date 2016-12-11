#!/bin/bash 

echo "`date`,config sriov on compute node ..." >> /tmp/config.sriov.compute
  
cp /etc/nova/nova.conf  "/etc/nova/nova.conf-`date`"

openstack-config --set /etc/nova/nova.conf DEFAULT pci_passthrough_whitelist  "[{\"devname\":\"enp7s0f0\", \"physical_network\":\"Sriov_Vlan_phynet0\"},{\"devname\":\"enp7s0f1\",\"physical_network\":\"Sriov_Vlan_phynet1\"},{\"devname\":\"enp129s0f0\", \"physical_network\":\"Sriov_Vlan_phynet2\"},{\"devname\":\"enp129s0f1\",\"physical_network\":\"Sriov_Vlan_phynet3\"}]"



cp /etc/neutron/plugins/ml2/sriov_agent.ini  "/etc/neutron/plugins/ml2/sriov_agent.ini-`date`"

openstack-config --set /etc/neutron/plugins/ml2/sriov_agent.ini securitygroup firewall_driver neutron.agent.firewall.NoopFirewallDriver
openstack-config --set /etc/neutron/plugins/ml2/sriov_agent.ini sriov_nic physical_device_mappings  "Sriov_Vlan_phynet0:enp7s0f0,Sriov_Vlan_phynet1:enp7s0f1,Sriov_Vlan_phynet2:enp129s0f0,Sriov_Vlan_phynet3:enp129s0f1"

cp  /etc/neutron/plugins/ml2/openvswitch_agent.ini  "/etc/neutron/plugins/ml2/openvswitch_agent.ini-`date`" 
openstack-config --set /etc/neutron/plugins/ml2/openvswitch_agent.ini securitygroup firewall_driver neutron.agent.firewall.NoopFirewallDriver

openstack-service restart 
systemctl restart neutron-sriov-nic-agent.service

