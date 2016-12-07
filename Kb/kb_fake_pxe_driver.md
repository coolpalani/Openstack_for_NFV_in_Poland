

C.7. Fake PXE Driver
This driver provides a method to use bare metal devices without power management. This means the director does not control the registered bare metal devices and as such require manual control of power at certain points in the introspect and deployment processes.

Important
This option is available for testing and evaluation purposes only. It is not recommended for Red Hat Enterprise Linux OpenStack Platform enterprise environments.

pm_type
    Set this option to fake_pxe. 

Additional Notes

    This driver does not use any authentication details because it does not control power management.
    Edit the /etc/ironic/ironic.conf file and add fake_pxe to the enabled_drivers option to enable this driver.
    
    
    When performing introspection on nodes, manually power the nodes after running the openstack baremetal introspection bulk start command.
    
    
    When performing Overcloud deployment, check the node status with the ironic node-list command. Wait until the node status changes from deploying to deploy wait-callback and then manually power the nodes.
    After the Overcloud provisioning process completes, reboot the nodes. To check the completion of provisioning, check the node status with the ironic node-list command, wait until the node status changes to active, then manually reboot all Overcloud nodes. 
    
    
    
    
