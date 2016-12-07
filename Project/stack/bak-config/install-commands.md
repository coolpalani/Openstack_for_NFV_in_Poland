list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
    #ironic  node-delete $a 
    ironic  node-set-power-state  $a   on 
done 

ipmitool -I lanplus -H  172.23.85.84  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev pxe
ipmitool -I lanplus -H  172.23.85.84  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power on 

 


 time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             \
 -e ~/templates/my-overcloud/environments/network-isolation.yaml                   \
 -e ~/templates/network-environment.yaml \
 -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       \
 --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     \
 --control-scale 3    --compute-scale 2  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   \
 --neutron-network-type vlan    --neutron-disable-tunneling   \
 --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  \
 --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      \
 --ntp-server   172.23.85.106   --libvirt-type  kvm 
 
 
 

#-e ~/templates/scheduler_hints_env.yaml \
 
 
  
  
  
  [stack@director ~]$ ironic node-list
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| af6368a9-07b8-45b1-9188-56e45df12f1a | None | None          | power off   | available          | False       |
| b537d8c2-59ba-4499-a496-240e80ebbded | None | None          | power off   | available          | False       |
| fcd7941b-636b-4adf-b7b0-52ab6ec5c47f | None | None          | power off   | available          | False       |
| 4975235d-d2d6-4a64-b42f-80257d23b17c | None | None          | power off   | available          | False       |
| 4d62def8-72ae-42f6-9743-fac71f665cd8 | None | None          | power off   | available          | False       |
| ddda37c5-9317-4608-838a-c01291abdd4a | None | None          | power off   | available          | False       |
| e5c15dcd-ee50-4f15-9796-d2c1b9d807f4 | None | None          | power off   | available          | False       |
| 4bdb95af-b439-4522-b217-855a443bdcbd | None | None          | power off   | available          | False       |
| 4f20a3d3-7787-426a-81e5-11bb00ea7c7e | None | None          | power off   | available          | False       |
| 4946796b-d6e9-4a4d-8c9c-7cbf9eee9266 | None | None          | power off   | available          | False       |
| 5aaf184c-35b5-4658-b0f2-d08f9b7d21b6 | None | None          | power off   | available          | False       |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+


  
  
  
ironic node-update af6368a9-07b8-45b1-9188-56e45df12f1a replace properties/capabilities='boot_option:local'
  
     
 


[stack@director ~]$ neutron subnet-list
+--------------------------------------+----------------+-----------------+---------------------------------------------------+
| id                                   | name           | cidr            | allocation_pools                                  |
+--------------------------------------+----------------+-----------------+---------------------------------------------------+
| 830b9052-6412-4037-9a97-8e2d159840b6 |                | 172.23.85.64/26 | {"start": "172.23.85.85", "end": "172.23.85.104"} |
| 19019220-26ac-426b-b9a5-61c8c074ca57 | storage_subnet | 172.20.85.0/24  | {"start": "172.20.85.11", "end": "172.20.85.30"}  |
+--------------------------------------+----------------+-----------------+---------------------------------------------------+









  ironic node-update af6368a9-07b8-45b1-9188-56e45df12f1a replace properties/capabilities='node:controller-0,profile:control,boot_option:local'
  ironic node-update b537d8c2-59ba-4499-a496-240e80ebbded replace properties/capabilities='node:controller-1,profile:control,boot_option:local' 
  ironic node-update fcd7941b-636b-4adf-b7b0-52ab6ec5c47f replace properties/capabilities='node:controller-2,profile:control,boot_option:local'  
  
  ironic node-update 4975235d-d2d6-4a64-b42f-80257d23b17c replace properties/capabilities='node:compute-0,profile:compute,boot_option:local'  
  ironic node-update 4d62def8-72ae-42f6-9743-fac71f665cd8 replace properties/capabilities='node:compute-1,profile:compute,boot_option:local'  
  ironic node-update ddda37c5-9317-4608-838a-c01291abdd4a replace properties/capabilities='node:compute-2,profile:compute,boot_option:local'  
  ironic node-update e5c15dcd-ee50-4f15-9796-d2c1b9d807f4 replace properties/capabilities='node:compute-3,profile:compute,boot_option:local'   
  ironic node-update 4bdb95af-b439-4522-b217-855a443bdcbd replace properties/capabilities='node:compute-4,profile:compute,boot_option:local'  
  ironic node-update 4f20a3d3-7787-426a-81e5-11bb00ea7c7e replace properties/capabilities='node:compute-5,profile:compute,boot_option:local'  
  ironic node-update 4946796b-d6e9-4a4d-8c9c-7cbf9eee9266 replace properties/capabilities='node:compute-6,profile:compute,boot_option:local'  
  ironic node-update 5aaf184c-35b5-4658-b0f2-d08f9b7d21b6 replace properties/capabilities='node:compute-7,profile:compute,boot_option:local'   
  
  
  ironic node-update 4975235d-d2d6-4a64-b42f-80257d23b17c replace properties/capabilities='profile:compute,boot_option:local'  
  ironic node-update 4d62def8-72ae-42f6-9743-fac71f665cd8 replace properties/capabilities='profile:compute,boot_option:local'  
  ironic node-update ddda37c5-9317-4608-838a-c01291abdd4a replace properties/capabilities='profile:compute,boot_option:local'  
  ironic node-update e5c15dcd-ee50-4f15-9796-d2c1b9d807f4 replace properties/capabilities='profile:compute,boot_option:local'   
  ironic node-update 4bdb95af-b439-4522-b217-855a443bdcbd replace properties/capabilities='profile:compute,boot_option:local'  
  ironic node-update 4f20a3d3-7787-426a-81e5-11bb00ea7c7e replace properties/capabilities='profile:compute,boot_option:local'  
  ironic node-update 4946796b-d6e9-4a4d-8c9c-7cbf9eee9266 replace properties/capabilities='profile:compute,boot_option:local'  
  ironic node-update 5aaf184c-35b5-4658-b0f2-d08f9b7d21b6 replace properties/capabilities='profile:compute,boot_option:local'   
