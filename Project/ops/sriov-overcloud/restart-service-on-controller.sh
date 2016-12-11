
pcs resource unmanage openstack-nova-api
pcs resource unmanage openstack-nova-scheduler
pcs resource unmanage openstack-nova-conductor


systemctl restart  openstack-nova-api
systemctl restart  openstack-nova-scheduler 
systemctl restart  openstack-nova-conductor 

sleep 40 


pcs resource manage openstack-nova-api 
pcs resource manage openstack-nova-scheduler 
pcs resource manage openstack-nova-conductor 


pcs resource cleanup  openstack-nova-api
pcs resource cleanup  openstack-nova-scheduler 
pcs resource cleanup  openstack-nova-conductor 

