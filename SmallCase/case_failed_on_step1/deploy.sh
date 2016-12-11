#list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
#for a  in $list 
#do 
#    #ironic  node-delete $a 
#    ironic  node-set-boot-device  $a    pxe 
#    ironic  node-set-power-state  $a    off
#done 

#for collect info in case of "no valid hosts".
date >> /tmp/deploy_two.log
source stackrc
nova hypervisor-stats >> /tmp/deploy_two.log

time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             \
-e ~/templates/my-overcloud/environments/network-isolation.yaml                   \
-e ~/templates/network-environment.yaml \
-e ~/templates/userdata.yaml \
-e ~/templates/scheduler_hints_env.yaml \
-e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       \
--control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     \
--control-scale 3    --compute-scale 2  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   \
--neutron-network-type vlan    --neutron-disable-tunneling   \
--neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  \
--neutron-network-vlan-ranges datacentre:2:4090,Date_OVS_vlan_phynet0:2:4090      \
--ntp-server   172.23.85.106   --libvirt-type  kvm





