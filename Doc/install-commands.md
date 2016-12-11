list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
  ironic  node-delete $a 
 # ironic     node-set-maintenance $a   True 
 #  ironic     node-set-boot-device  $a    pxe 
 #  ironic  node-set-power-state  $a    on
done 

  ironic node-set-provision-state $a deleted
        ironic  node-delete $a 
      
    
  
  list=`heat stack-list -n | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
    heat stack-delete -y $a 
done 
  
      
ironic node-update  3e57d7ca-eac9-4b8e-8808-f8019c97a508  replace properties/capabilities='profile:control,boot_option:local'

ironic node-update  22c20294-b127-42da-aac9-63a1b23609e0  replace properties/capabilities='profile:compute,boot_option:local'

  
        
list=`ironic node-list | grep -v "+" | grep -v "True" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 

  #  ironic  node-set-boot-device  $a    pxe 
  ironic  node-set-power-state  $a    reboot
done 



for a in  fcd36f52-43a8-42de-bb32-0999f7a4368a
do 
  #ironic  node-set-maintenance  $a true 
  ironic  node-set-boot-device  $a    pxe 
 ironic  node-set-power-state  $a    reboot
done  

 


 

    ipmitool -I lanplus -H  172.23.85.77  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev disk
    ipmitool -I lanplus -H  172.23.85.77  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power   cycle 
 
 
for (( i = 73; i < 85 ; i ++ ))
do
    ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev disk
    ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power   cycle 
done



for (( i = 73; i < 85 ; i ++ ))
do
    ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power status 
 
done


 


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

1. 有screen snapshot 为证, 单板netcard mac address 怎么会变? 
2. no valid host现在怎么没有了? 我没有改动什么啊, 只删除了iptables的一条规则
3. 手动执行了set boot device pxe , 是否是导致 no valid host没有的原因.

4. 在deploy之前执行
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
    #ironic  node-delete $a 
    ironic  node-set-boot-device  $a    pxe 
    ironic  node-set-power-state  $a    off
done 

./deploy.sh 


  





list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
  ironic  node-delete $a 
 # ironic     node-set-maintenance $a   True 
 #  ironic     node-set-boot-device  $a    pxe 
 #  ironic  node-set-power-state  $a    on
done 







iptables -t nat -A PREROUTING -j neutron-openvswi-PREROUTING
iptables -t nat -A PREROUTING -d 169.254.169.254/32 -i br-ctlplane -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8775
iptables -t nat -A PREROUTING -j nova-api-PREROUTING

















