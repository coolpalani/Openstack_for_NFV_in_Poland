
pcs resource unmanage neutron-l3-agent
pcs resource unmanage neutron-metadata-agent
pcs resource unmanage neutron-dhcp-agent
pcs resource unmanage neutron-openvswitch-agent
pcs resource unmanage neutron-server


systemctl restart neutron-l3-agent
systemctl restart neutron-metadata-agent
systemctl restart neutron-dhcp-agent
systemctl restart neutron-openvswitch-agent
systemctl restart neutron-server

sleep 20 


pcs resource manage neutron-l3-agent
pcs resource manage neutron-metadata-agent
pcs resource manage neutron-dhcp-agent
pcs resource manage neutron-openvswitch-agent
pcs resource manage neutron-server
