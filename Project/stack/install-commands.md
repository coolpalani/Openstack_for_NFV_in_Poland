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



[stack@director ~]$ ironic node-list
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| d9a3901a-06ca-4658-9b6e-177286ebdc2a | None | None          | power off   | available          | False       |
| 5d23d9c2-1379-48a9-9263-4b3e836adb7a | None | None          | power off   | available          | False       |
| e7fc8ed1-f269-4a26-a987-cc0c74daad4c | None | None          | power off   | available          | False       |
| 48f560fb-736c-4632-8020-ce2c71589722 | None | None          | power off   | available          | False       |
| 7acd2aaf-aa0a-4bbf-a3e8-aec9e5164138 | None | None          | power off   | available          | False       |
| 602c305d-a4c1-40f4-9f6d-ffd5e5df420b | None | None          | power off   | available          | False       |
| 8fb1c4a4-235c-4bdd-bd51-9824217de3a1 | None | None          | power off   | available          | False       |
| f54fd0e7-9163-499b-97b8-115abadad9fb | None | None          | power off   | available          | False       |
| 2e148cb1-7a88-418f-aef8-4adeedc112e0 | None | None          | power off   | available          | False       |
| 238ab356-6098-4c82-9bf2-08bf6e2deece | None | None          | power off   | available          | False       |
| b4e086a5-259b-47bb-9069-fc78106a26d7 | None | None          | power off   | available          | False       |
| 8a276ac3-3fe3-480a-bbd2-5f4ac6a99f84 | None | None          | power off   | available          | False       |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+

ironic node-update d9a3901a-06ca-4658-9b6e-177286ebdc2a replace properties/capabilities='profile:control,boot_option:local'
ironic node-update 5d23d9c2-1379-48a9-9263-4b3e836adb7a replace properties/capabilities='profile:control,boot_option:local'
ironic node-update e7fc8ed1-f269-4a26-a987-cc0c74daad4c replace properties/capabilities='profile:control,boot_option:local'
ironic node-update 48f560fb-736c-4632-8020-ce2c71589722 replace properties/capabilities='profile:compute,boot_option:local'  
ironic node-update 7acd2aaf-aa0a-4bbf-a3e8-aec9e5164138 replace properties/capabilities='profile:compute,boot_option:local'  

ironic node-update af6368a9-07b8-45b1-9188-56e45df12f1a replace properties/capabilities='node:controller-0,profile:control,boot_option:local'
ironic node-update 4975235d-d2d6-4a64-b42f-80257d23b17c replace properties/capabilities='node:compute-0,profile:compute,boot_option:local'  

ironic node-update 4975235d-d2d6-4a64-b42f-80257d23b17c replace properties/capabilities='profile:compute,boot_option:local'  
ironic node-update 4d62def8-72ae-42f6-9743-fac71f665cd8 replace properties/capabilities='profile:compute,boot_option:local'  
ironic node-update ddda37c5-9317-4608-838a-c01291abdd4a replace properties/capabilities='profile:compute,boot_option:local'  
ironic node-update e5c15dcd-ee50-4f15-9796-d2c1b9d807f4 replace properties/capabilities='profile:compute,boot_option:local'   
ironic node-update 4bdb95af-b439-4522-b217-855a443bdcbd replace properties/capabilities='profile:compute,boot_option:local'  
ironic node-update 4f20a3d3-7787-426a-81e5-11bb00ea7c7e replace properties/capabilities='profile:compute,boot_option:local'  
ironic node-update 4946796b-d6e9-4a4d-8c9c-7cbf9eee9266 replace properties/capabilities='profile:compute,boot_option:local'  
ironic node-update 5aaf184c-35b5-4658-b0f2-d08f9b7d21b6 replace properties/capabilities='profile:compute,boot_option:local'   
