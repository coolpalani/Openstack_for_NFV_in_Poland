# How to disable security group ? 


On each controller and compute node, change:

# /etc/neutron/plugins/ml2/ml2_conf.ini
[securitygroup]
enable_security_group = False
firewall_driver = neutron.agent.firewall.NoopFirewallDriver

To stop nova-compute from creating the iptables rules, configure it to use its Noop driver:

# /etc/nova/nova.conf
[DEFAULT]
security_group_api = nova
firewall_driver = nova.virt.firewall.NoopFirewallDriver

Restart all neutron-server, neutron-openvswitch-agent, nova-api and nova-compute services.

Now Neutron will creates ports with:

# neutron port-show 2a771f08-8758-43c5-b30c-71ec5a141ce0 | grep binding:vif_details
| binding:vif_details | {"port_filter": false, "ovs_hybrid_plug": false}   

When using the OVS agent, that should also stop Nova from using the hybrid VIF plugging strategy, where it places a Linux Bridge in-line between the instance's tap and br-int. Instead, it should plug the VIF straight into br-int.

   <interface type='bridge'>
      <mac address='fa:16:3e:15:93:85'/>
      <source bridge='br-int'/>
      <virtualport type='openvswitch'>
        <parameters interfaceid='7fda07e4-de58-44da-a71f-d137a68d6c60'/>
      </virtualport>
      <target dev='tap7fda07e4-de'/>
      <model type='virtio'/>
      <alias name='net0'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>



then  

```sh

neutron net-create 
nova boot 


```

