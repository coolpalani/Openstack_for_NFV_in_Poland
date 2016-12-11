#!/bin/bash

cp /etc/nova/nova.conf  "/etc/nova/nova.conf-`date`"
openstack-config --set  /etc/nova/nova.conf DEFAULT  security_group_api neutron
openstack-config --set  /etc/nova/nova.conf DEFAULT  firewall_driver  nova.virt.firewall.NoopFirewallDriver

cp /etc/neutron/plugins/ml2/openvswitch_agent.ini  "/etc/neutron/plugins/ml2/openvswitch_agent.ini-`date`"
openstack-config --set  /etc/neutron/plugins/ml2/openvswitch_agent.ini  securitygroup  enable_security_group  False
openstack-config --set  /etc/neutron/plugins/ml2/openvswitch_agent.ini  securitygroup  firewall_driver  neutron.agent.firewall.NoopFirewallDriver 

