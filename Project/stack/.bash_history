./deploy.sh 
heat stack-delete -y overcloud 
heat stack-list -n 
cat deploy.sh 
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 3    --compute-scale 2  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
ls
heat stack-delete overcloud -y 
heat stack-list
heat stack-delete overcloud -y 
heat stack-list -n 
ironic node-port-list
ironic node-ports-list
ironic help | grep port
ironic port-list
ironic node-list
ironic node-port-list af6368a9-07b8-45b1-9188-56e45df12f1a
ironic node-port-list b537d8c2-59ba-4499-a496-240e80ebbded
ls
vim ipmi_nodes.json  
ironic node-port-list fcd7941b-636b-4adf-b7b0-52ab6ec5c47f
ironic node-show b537d8c2-59ba-4499-a496-240e80ebbded
vim ipmi_nodes.json  
heat stack-list -n 
./remove_stack_deleted_left.sh 
heat stack-list -n 
ironic node-list
heat stack-delete -y 3b40f5b4-b461-4067-907c-73b7894ccc50
heat stack-list -n 
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do      ironic  node-delete $a  done 
vim ipmi_nodes.json  
grep mac ipmi_nodes.json  -irn 
grep mac ipmi_nodes.json  -ir 
ironic node-list
openstack baremetal import --json ipmi_nodes.json 
openstack baremetal configure boot 
openstack baremetal introspection bulk start 
ls
ironic node-list
nova list
ironic node-list
ls
cp ipmi_nodes.json fake-ipmi_nodes.json
vim fake-ipmi_nodes.json  
ironic help | grep set
ironic node-set-provision-state
ironic node-set-provision-state d9a3901a-06ca-4658-9b6e-177286ebdc2a rebuild
ironic node-list
ironic node-set-provision-state d9a3901a-06ca-4658-9b6e-177286ebdc2a 
ironic node-set-provision-state d9a3901a-06ca-4658-9b6e-177286ebdc2a clean
ironic node-set-provision-state d9a3901a-06ca-4658-9b6e-177286ebdc2a deleted
ironic node-list
ironic node-delete d9a3901a-06ca-4658-9b6e-177286ebdc2a
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do      ironic node-set-provision-state $a deleted;         ironic  node-delete $a  done 
ironic node-list
ls
openstack baremetal import --json fake-ipmi_nodes.json 
ironic node-list
openstack baremetal configure boot 
openstack baremetal introspection bulk start 
ironic node-list
ironic help | grep set
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do     ironic     node-set-maintenance $a   True  done 
ironic node-list
ironic node-show 1b57492c-ff6b-46b6-962f-dbfced5660f3
openstack baremetal introspection bulk start 
ironic node-list
ironic node-set-maintenance fcd36f52-43a8-42de-bb32-0999f7a4368a false
openstack baremetal introspection bulk start 
ironic node-set-maintenance fcd36f52-43a8-42de-bb32-0999f7a4368a True 
ironic node-list
ironic node-show f34000fb-a381-4db8-a337-c139c73b42bd
ironic node-update f34000fb-a381-4db8-a337-c139c73b42bd replace properties/capabilities='profile:control,boot_option:local'
ironic node-update 1b57492c-ff6b-46b6-962f-dbfced5660f3   replace properties/capabilities='profile:control,boot_option:local'
ironic node-update f8720ef5-efcd-4457-a206-0ea35ef460cd replace properties/capabilities='profile:control,boot_option:local'
ironic node-update  d90bc6b0-2ce0-40e9-98fe-f0bed13d3863 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update ad343609-1335-405e-8415-7dd8575b1022 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-list
cat deploy.sh 
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 3    --compute-scale 2  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
openstack overcloud profiles list
ironic node-list 
ironic node-update f34000fb-a381-4db8-a337-c139c73b42bd replace properties/capabilities='profile:control,boot_option:local'
ironic node-update 1b57492c-ff6b-46b6-962f-dbfced5660f3   replace properties/capabilities='profile:control,boot_option:local'
ironic node-update f8720ef5-efcd-4457-a206-0ea35ef460cd replace properties/capabilities='profile:control,boot_option:local'
ironic node-update  d90bc6b0-2ce0-40e9-98fe-f0bed13d3863 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update ad343609-1335-405e-8415-7dd8575b1022 replace properties/capabilities='profile:compute,boot_option:local'
cat deploy.sh 
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 3    --compute-scale 2  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
ironic node-list
ironic     node-set-maintenance f34000fb-a381-4db8-a337-c139c73b42bd false
 ironic     node-set-maintenance  1b57492c-ff6b-46b6-962f-dbfced5660f3 false
 ironic     node-set-maintenance  f8720ef5-efcd-4457-a206-0ea35ef460cd false
 ironic     node-set-maintenance d90bc6b0-2ce0-40e9-98fe-f0bed13d3863 false
 ironic     node-set-maintenance  ad343609-1335-405e-8415-7dd8575b1022 false
cat deploy.sh 
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 3    --compute-scale 2  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
heat stack-delete -y overcloud 
heat stack-list 
heat stack-list  -n 
ironic node-list
ls
cp ipmi_nodes.json  five-nodes.json
vim five-nodes.json  
heat stack-list
./remove_stack_deleted_left.sh 
heat stack-list
heat stack-list -n 
heat stack-delete -y b78e88fa-e9c9-4d49-8613-dcb5667e4545
heat stack-list
heat stack-list -n 
heat stack-delete -y b78e88fa-e9c9-4d49-8613-dcb5667e4545
heat stack-delete -y overcloud 
heat stack-list
openstack baremetal import --json five-nodes.json 
openstack baremetal configure boot 
openstack baremetal introspection bulk start 
ironic node-list
ls
cp five-nodes.json  two-nodes.json 
vim two-nodes.json  
heat stack-list
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do    ironic  node-delete $a  done 
openstack baremetal import --json two-nodes.json 
ironic node-list
openstack baremetal configure boot 
openstack baremetal introspection bulk start
cat deploy.sh 
cp deploy.sh  two-deploy.sh 
vim two-deploy.sh  
./two-deploy.sh 
heat stack-list
heat stack-delete -y overcloud 
heat stack-list
ironic node-list
ironic node-update  3e57d7ca-eac9-4b8e-8808-f8019c97a508  replace properties/capabilities='profile:control,boot_option:local'
ironic node-update  22c20294-b127-42da-aac9-63a1b23609e0 replace properties/capabilities='profile:compute,boot_option:local'
heat stack-list -n 
nova list
heat stack-delete -y overcloud 
nova list
heat stack-list -n 
heat stack-delete -y overcloud 
heat stack-delete -y  7d286815-4db9-41b9-a23b-47ea240df1dd
heat stack-delete -y  841acdea-5463-4c97-b5b6-30db53165b3b
heat stack-delete -y overcloud 
  list=`heat stack-list -n | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do      heat stack-delete -y $a ; done 
heat stack-list -n 
./remove_stack_deleted_left.sh 
heat stack-list -n 
for a  in $list ; do      heat stack-delete -y $a ; done 
heat stack-list
heat stack-list -n 
heat stack-delete -y 316aca05-225c-4756-ad6b-357ab8ba3026
heat stack-list -n 
mysql
heat stack-list -n 
cat two-deploy.sh 
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 1    --compute-scale 1  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
heat stack-list
heat stack-delete -y overcloud 
heat stack-list
heat stack-list -n 
ironic node-list
nova list
./remove_stack_deleted_left.sh 
ironic node-list
ironic help | grep set
ironic node-set-provision-state 3e57d7ca-eac9-4b8e-8808-f8019c97a508 delete
ironic node-set-provision-state 3e57d7ca-eac9-4b8e-8808-f8019c97a508 deleted
ironic node-set-provision-state  22c20294-b127-42da-aac9-63a1b23609e0 deleted
ironic node-list
cat two-deploy.sh 
./two-deploy.sh  
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
./two-deploy.sh 
ls
source stackrc 
cat deploy.sh 
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 3    --compute-scale 2  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
netstat -nalp | grep 6385
heat stack-delete -y overcloud 
heat stack-list -n 
heat stack-delete -y overcloud 
heat stack-list -n 
neutron net-list
ls
heat stack-list
ironic node-list
./remove_stack_deleted_left.sh 
ironic node-list
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do      ironic  node-delete $a  done 
ironic node-update f34000fb-a381-4db8-a337-c139c73b42bd replace properties/capabilities='profile:control,boot_option:local'
ironic node-update 1b57492c-ff6b-46b6-962f-dbfced5660f3   replace properties/capabilities='profile:control,boot_option:local'
ironic node-update f8720ef5-efcd-4457-a206-0ea35ef460cd replace properties/capabilities='profile:control,boot_option:local'
ironic node-update  d90bc6b0-2ce0-40e9-98fe-f0bed13d3863 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update ad343609-1335-405e-8415-7dd8575b1022 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update ca09250f-19fa-442b-8170-f11ddebd13bc replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update 64edded5-ac06-4bdc-a68f-c8dad8c3f259 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update 684a9f3e-9d10-4412-a115-73a105d25fe0 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update 7b7f35cf-1ac9-496b-9594-682d61ac3661 replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update 44cb1208-da16-4fdb-a69b-d5eed64ce41c replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update 262d341b-8ced-4de1-b6e7-9f13434aabcd replace properties/capabilities='profile:compute,boot_option:local'
ironic node-update fcd36f52-43a8-42de-bb32-0999f7a4368a replace properties/capabilities='profile:compute,boot_option:local'
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do     ironic  node-set-boot-device  $a    pxe ;    ironic  node-set-power-state  $a    on; done list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do     ironic  node-set-boot-device  $a    pxe ;    ironic  node-set-power-state  $a    on; done list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do     ironic  node-set-boot-device  $a    pxe ;    ironic  node-set-power-state  $a    on; done 
for i in [3-10] ; do  echo $i; done
AX=85
 
for (( i = 73; i < MAX ; i ++ )); do     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev pxe;     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power on   ; done
for (( i = 73; i < MAX ; i ++ )); do echo $i;     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev pxe;     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power on   ; done
ls /tmp/tmp3OvDxz
cat /tmp/tmp3OvDxz
for (( i = 73; i < MAX ; i ++ )); do echo $i; done
for (( i = 73; i < 85 ; i ++ )); do echo $i;     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev pxe;     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power on   ; done
for (( i = 73; i < 85 ; i ++ )); do     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power status ;   done
for (( i = 73; i < 85 ; i ++ )); do     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev pxe;     ipmitool -I lanplus -H  172.23.85.$i  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power   cycle ; done
ls
cat deploy.sh 
. ./stackrc 
nova list
ironic node-list
cat two-deploy.sh 
heat stack-delete overcloud
watch -d "heat resource-list -n 5 overcloud | grep -E 'PROGRESS|FAILED'"
ls
./two-deploy.sh 
heat stack-delete overcloud
nova list
ironic node-list
./two-deploy.sh 
nova list
ironic node-list
heat stack-delete overcloud
neutron port-list
nova list
ironic node-list
ll
cd images
ls
ll
cd
./two-deploy.sh 
ls
vim ipmi_nodes.json  
ls
vim install-commands.md  
cat deploy.sh 
vim install-commands.md 
    ipmitool -I lanplus -H  172.23.85.77  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis bootdev disk
    ipmitool -I lanplus -H  172.23.85.77  -L ADMINISTRATOR -U root -R 3 -N 5 -f /tmp/tmp3OvDxz chassis power   cycle 
 
heat stack-list
source ~/stackrc 
heat stack-list
source stackrc 
ironic node-list
heat stack-list 
ironic node-list 
vim templates/scheduler_hints_env.yaml  
vim deploy.sh  
./deploy.sh  
heat stack-delete -y overcloud 
ironic node-list
ironic help | grep set
ironic node-set-power-state af6368a9-07b8-45b1-9188-56e45df12f1a on 
ironic node-list
nova list
ls
id
source stackrc 
openstack overcloud deploy --templates
bg
ironic node-list
 heat stack-list
ironic node-show 3e57d7ca-eac9-4b8e-8808-f8019c97a508
 sudo journalctl -u openstack-ironic-conductor -u openstack-ironic-api
 sudo journalctl -u openstack-ironic-conductor -u openstack-ironic-api >> ironic.log
ls -lrt
rm ironic.log
 sudo journalctl -u openstack-ironic-conductor -u openstack-ironic-api
clear
ironic node-list
nova list
nova delete ef2e047e-69a7-45e0-a095-4c8711e63ee3
nova delete 2c746cb2-ab56-49b0-80a6-06a603262cd6
nova list
ironic node-list
nova list
nov ashow a3ca3c2c-942d-40f9-a655-ca9a237b19af
nova show a3ca3c2c-942d-40f9-a655-ca9a237b19af
ironic node-list
heat resource-list overcloud
nova list
ironic node-list
ssh heat-admin@172.23.85.87
ping 172.23.85.87
ifconfig 
clear
sudo journalctl -u openstack-ironic-conductor -u openstack-ironic-api
. ./stackrc 
nova list
heat
ls
ironic node-list
source  stackrc 
ironic node-list
cat two-nodes.json 
ironic port-list
ironic node-show 3e57d7ca-eac9-4b8e-8808-f8019c97a508
ironic node-show 22c20294-b127-42da-aac9-63a1b23609e0
ls
source stackrc 
nova list
heat stack-list
heat stack-delete -y overcloud 
openstack baremetal introspection bulk status
openstack stack list
heat stack-list 
openstack baremetal configure boot
ironic node-list
ironic node-show 3e57d7ca-eac9-4b8e-8808-f8019c97a508
openstack baremetal introspection bulk start 
ironic node-list
openstack baremetal introspection bulk start 
openstack baremetal introspection bulk status
cat two-deploy.sh 
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 1    --compute-scale 1  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             -e ~/templates/my-overcloud/environments/network-isolation.yaml                   -e ~/templates/network-environment.yaml -e ~/templates/userdata.yaml -e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       --control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     --control-scale 1    --compute-scale 1  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   --neutron-network-type vlan    --neutron-disable-tunneling   --neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  --neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      --ntp-server   172.23.85.106   --libvirt-type  kvm
heat stack-list
heat stack-delete -y overcloud 
heat stack-list -n 
heat stack-delete -y overcloud 
./two-deploy.sh 
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
./two-deploy.sh 
heat stack-delete -y overcloud 
ironic node-list
openstack baremetal introspection bulk start 
openstack baremetal introspection bulk status
./two-deploy.sh 
su - stack
nova list
. ./stackrc
nova list
ironic node-list
ping 172.23.85.100
ping 172.23.85.101
openstack image-list
openstack image list
ls /var/lib/glance/
ls /var/lib/glance/images/
sudo ls /var/lib/glance/images/
ll
cd images
ll
ls /httpboot/22c20294-b127-42da-aac9-63a1b23609e0/
ll /httpboot/22c20294-b127-42da-aac9-63a1b23609e0/
cd bak

ls /httpboot/22c20294-b127-42da-aac9-63a1b23609e0/
cat config
cd /httpboot/
ls
cd 22c20294-b127-42da-aac9-63a1b23609e0/
s
ll
cat config 
ls
cd ~
ironic node-list
ironic node-set-power
ironic node-list
ironic node-set-power-state  3e57d7ca-eac9-4b8e-8808-f8019c97a508  off
ironic node-list
ironic node-set-power-state  3e57d7ca-eac9-4b8e-8808-f8019c97a508  on
ll
cd /httpboot/
ls
ll
ll 22c20294-b127-42da-aac9-63a1b23609e0/
lls
ll
vim  /usr/lib/python2.7/site-packages/ironic/drivers/modules/ipxe_config.template
heat stack-list
heat stack-delete overcloud -y
heat stack-list
heat stack-delete overcloud -y
nova list
ironic node-list
heat stack-list
ls
ll
cat 22c20294-b127-42da-aac9-63a1b23609e0/config 
heat stack-list
heat stack-delete overcloud -y
exit
heat stack-list
. ./stackrc 
heat stack-list
cd /httpboot/
ls
cd 22c20294-b127-42da-aac9-63a1b23609e0/
ls
cat config f
ll
ironic node-list
exit
. ./stackrc 
heat stack-list
heat stack-delete overcloud -y
nova list
heat stack-delete overcloud -y
nova list
heat stack-list
ironic node-list
heat stack-list
ls
./two-deploy.sh 
bg
ironic node-set-power-state 22c20294-b127-42da-aac9-63a1b23609e0 off
ironic list
ironic node-list
ironic node-set-power-state 22c20294-b127-42da-aac9-63a1b23609e0 on
ironic node-list
exit
. ./stackrc 
ifconfig 
ping 172.23.85.106
ironic node-list
ironic node-show 3e57d7ca-eac9-4b8e-8808-f8019c97a508
exit
. ./stackrc
neutron net-list
neutron net-show 03c4a216-1778-4339-8549-9034f5a6f4da
exit
ls
source stackrc 
ironic node-list
exit
ls
source  stackrc 
ironic node-list
ironic node-delete 3e57d7ca-eac9-4b8e-8808-f8019c97a508
 ironic node-delete  22c20294-b127-42da-aac9-63a1b23609e0
ls
openstack baremetal import --json two-nodes.json 
openstack baremetal configure boot 
ironic node-list
openstack baremetal introspection bulk start 
openstack baremetal introspection bulk status
./two-deploy.sh 
heat stack-list
heat stack-delete -y overcloud 
ls
chmod a+x two_node-profile.sh 
./two_node-profile.sh 
heat stack-list
./two-deploy.sh 
iptables -vnL | less
sudo  ironic node-delete  22c20294-b127-42da-aac9-63a1b23609e0
sudo iptables -vnL | less
neutron net-list
neutron net-show ctlplane
neutron net-delete ctlplane 
./remove_stack_deleted_left.sh 
heat stack-list
heat stack-delete -y overcloud 
heat stack-list -n 
nova list
neutron net-list
neutron net-show ctlplane 
ironic node-list
ironic node-show 70188fee-70f9-4297-a902-aca9e8d71723
ironic node-show dc7caa84-e0e2-4df5-b6b5-7838906a3a2a
./two-deploy.sh  
heat stack-list -n 
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
./two-deploy.sh  
heat stack-list -n 
heat stack-list  
heat stack-list 
ironic node-list
ironic node-show 70188fee-70f9-4297-a902-aca9e8d71723
ironic node-list
ironic node-show dc7caa84-e0e2-4df5-b6b5-7838906a3a2a
./two-deploy.sh  
ls
cd templates/
ls
cd nic-configs/
ls
cd ..
ls
vim network-environment.yaml  
ls
ls
cat two-deploy.sh 
heat stack-list -n 
source stackrc 
heat stack-list -n 
heat stack-delete -y overcloud 
heat stack-list -n 
heat stack-delete -y overcloud 
heat stack-list -n 
heat stack-delete -y overcloud A
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
./two-deploy.sh 
heat stack-list
heat stack-delete -y overcloud 
heat stack-list
ovs-vsctl show
sudo heat stack-delete -y overcloud 
sudo ovs-vsctl show
heat stack-list 
heat stack-delete overcloud -y 
heat stack-list
heat stack-list -n 
ironic node-list
./two-deploy.sh  
heat stack-list
ironic node-list
openstack baremetal introspection bulk status 
ironic node-list
openstack baremetal introspection bulk start 
openstack baremetal introspection bulk status
ls
cat two-deploy.sh 
./two-deploy.sh 
vim two_node-profile.sh
ironic node-list
iptables -vnL
ironic node-list
heat stack-list 
./two-deploy.sh  
heat stack-delete -y overcloud 
vim remove_stack_deleted_left.sh  
ls
neutron net-list
ironic node-list 
ironic node-show 70188fee-70f9-4297-a902-aca9e8d71723
ironic node-list
ironic node-show dc7caa84-e0e2-4df5-b6b5-7838906a3a2a
heat stack-list 
nova list
heat stack-list -n 
heat stack-list -n  | grep -i "progress"
ironic node-list
ironic node-show 70188fee-70f9-4297-a902-aca9e8d71723
ironic node-list
ironic node-show dc7caa84-e0e2-4df5-b6b5-7838906a3a2a
 None                                                                     | | maintenance            | False    
nova flavor-show baremetal
nova list
ssh heat-stack@overcloud-compute-0
ssh heat-stack@172.23.85.100
ssh root@172.23.85.100
ssh root@172.23.85.104
. ./stackrc 
openstack baremetal configure boot
openstack baremetal introspection bulk start 
heat stack-delete overcloud -y
ironic node-list
ironic node-listironic node-list
ironic ironic node-list
ironic node-list
openstack baremetal introspection bulk start 
ironic node-list
openstack baremetal introspection bulk start --debug
ovs-vsctl show
openstack baremetal introspection bulk start --debug
ironic node-list
openstack baremetal introspection bulk start --debug
neutron net-show 03c4a216-1778-4339-8549-9034f5a6f4da
nova list
ironic node-list
heat stack-delete overcloud -y
heat stack-list
ls
./two-deploy.sh 
watch -d "heat resource-list -n 5 overcloud | grep -E 'PROGRESS|FAILED'"
ls
source stackrc 
ironic node-list
./two-deploy.sh 
cd Down
ls
heat stack-list 
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
./two-deploy.sh  
heat stack-list 
heat stack-delete -y overcloud 
source stackrc 
clear
ironic node-list
./two-deploy.sh 
heat resource-list -n5 overcloud | egrep -i "fail|progress"
cat two-deploy.sh 
ls
source stackrc 
nova list
heat stack-list -n | egrep -i "fail|progress"
heat deployment-show 0e5925cb-6ee7-463b-ba8f-90f127c6665d
ls
source stackrc 
heat stack-list -n 
ls
cp two-deploy.sh two-deploy-2.sh
vim two-deploy-2.sh 
nova list
./two-deploy-2.sh 
ls
ironic node-list
heat stack-delete -y overcloud 
heat stack-list 
cat deploy.sh 
vim deploy.sh  
cat two-deploy-2.sh 
vim deploy.sh  
ironic node-list
ls
vim deploy.sh  
vim install-commands.md  
ironic node-update 0e2296aa-67d8-4426-869a-ce32a701fa0b replace properties/capabilities='node:controller-0,profile:control,boot_option:local'
ironic node-update 94611a8c-df35-4c69-b491-560687e406b2 replace properties/capabilities='node:controller-1,profile:control,boot_option:local'
ironic node-update 06eba0e4-79e3-4297-9a4a-f8db59a803ac replace properties/capabilities='node:controller-2,profile:control,boot_option:local'
ironic node-update a758622c-a76b-4bc2-ae9e-cc127f348df6 replace properties/capabilities='node:compute-0,profile:compute,boot_option:local'
ironic node-update 4a755f36-bf38-47bc-9382-3da7ec6ef535 replace properties/capabilities='node:compute-1,profile:compute,boot_option:local'
ironic node-update 1cf822cf-8729-4245-82fa-46435b064d88 replace properties/capabilities='node:compute-2,profile:compute,boot_option:local'
ironic node-update 9055fd81-aa97-4980-899e-f48dc99d4ef1 replace properties/capabilities='node:compute-3,profile:compute,boot_option:local'
ironic node-update b57a50be-98e3-4af7-b682-bd9a7c04a55a replace properties/capabilities='node:compute-4,profile:compute,boot_option:local'
ironic node-update b784a158-18ee-45f7-84f6-ad404d7c89ae replace properties/capabilities='node:compute-5,profile:compute,boot_option:local'
ironic node-update 6e530d2b-0cf3-4477-a0df-5058a1070ee2 replace properties/capabilities='node:compute-6,profile:compute,boot_option:local'
ironic node-update 173bcd1c-dae3-4371-92ff-b8d44bcfb15a replace properties/capabilities='node:compute-7,profile:compute,boot_option:local'
ironic node-update a14c8fbb-dae6-4032-8d5b-d586eaa675ca replace properties/capabilities='node:compute-8,profile:compute,boot_option:local'
        
ls
cat ./deploy.sh 
vim ~/templates/scheduler_hints_env.yaml
./deploy.sh 
heat stack-list -n overcloud | egrep -i "fail" 
heat stack-list -n  | egrep -i "fail" 
heat resource-list -n5 overcloud | egrep -i "fail" 
2016-12-02 09:24:38 [ControllerPrePuppet]: CREATE_COMPLETE state changed
2016-12-02 09:24:38 [ControllerPrePuppetMaintenanceModeDeployment]: CREATE_COMPLETE state changed
2016-12-02 09:24:38 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerPrePuppet-l2t5nm4tt5ut]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-02 09:24:38 [ControllerPrePuppet]: CREATE_COMPLETE state changed
2016-12-02 09:24:57 [ControllerArtifactsDeploy]: CREATE_COMPLETE state changed
2016-12-02 09:24:57 [1]: SIGNAL_IN_PROGRESS Signal: deployment succeeded
2016-12-02 09:24:57 [1]: CREATE_COMPLETE state changed
2016-12-02 09:24:57 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerArtifactsDeploy-tjglktr5he2l]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-02 09:24:58 [ControllerLoadBalancerDeployment_Step1]: CREATE_IN_PROGRESS state changed
2016-12-02 09:24:58 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-02 09:24:58 [1]: CREATE_IN_PROGRESS state changed
2016-12-02 09:24:58 [0]: CREATE_IN_PROGRESS state changed
2016-12-02 09:24:59 [2]: CREATE_IN_PROGRESS state changed
2016-12-02 10:26:51 [1]: SIGNAL_IN_PROGRESS Signal: deployment failed (6)
2016-12-02 10:26:52 [0]: SIGNAL_IN_PROGRESS Signal: deployment failed (6)
2016-12-02 10:26:52 [1]: CREATE_FAILED Error: resources[1]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:53 [0]: CREATE_FAILED Error: resources[0]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:53 [2]: SIGNAL_IN_PROGRESS Signal: deployment failed (6)
2016-12-02 10:26:54 [2]: CREATE_FAILED Error: resources[2]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:55 [ControllerLoadBalancerDeployment_Step1]: CREATE_FAILED Error: resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
2016-12-02 10:26:55 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah]: CREATE_FAILED Resource CREATE failed: Error: resources[1]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:55 [ControllerLoadBalancerDeployment_Step1]: CREATE_FAILED Error: resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
2016-12-02 10:26:56 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy]: CREATE_FAILED Resource CREATE failed: Error: resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
2016-12-02 10:26:57 [ControllerNodesPostDeployment]: CREATE_FAILED Error: resources.ControllerNodesPostDeployment.resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
Stack overcloud CREATE_FAILED
Deployment failed:  Heat Stack create failed.
real91m1.914s
user1m56.202s
sys0m12.559s
heat event-list --nested-depth 4 overcloud
heat event-list --nested-depth 4 overcloud  > heat-event.txt
ls
cp deploy.sh  deploy-2.sh
vim deploy-2.sh  
heat stack-list -n 
ironic node-list
./deploy-2.sh 
ironic node-list
ls
source stackrc 
ls
cd templates/
ls
vim network-environment.yaml  
ls
heat resource-list -n5 overcloud | egrep -i "fail|progress" 
nova list
heat resource-list -n5 overcloud | egrep -i "fail|progress" 
glance image-list
glance image-delete overcloud-full-nfv
glance image-create --name overcloud-full-nfv  --disk-format qcow2 --container-format bare --file images/overcloud-full-nfv.qcow2  --progress
cd ..
glance image-create --name overcloud-full-nfv  --disk-format qcow2 --container-format bare --file images/overcloud-full-nfv.qcow2  --progress
glance image-list 
glance image-show 8b2c933a-6166-4152-8b5f-cbaaa280f869
glance image-update 8439e0f2-033c-4a4f-9aa9-a6d1c8952d27  --property kernel_id=0dfec46c-e29b-4929-96ff-41d2d6fee836 --property ramdisk_id=84103980-41bf-42fb-9526-26d2aa0c073d 
ironic node-list
ironic node-delete  70188fee-70f9-4297-a902-aca9e8d71723
ironic node-delete  dc7caa84-e0e2-4df5-b6b5-7838906a3a2a
ls
vim ipmi_nodes.json  
openstack baremetal import --json ipmi_nodes.json  
openstack baremetal boot configure
openstack baremetal configure boot 
openstack baremetal introspection bulk start 
openstack baremetal introspection bulk status 
ironic node-list 
nova hypervisor-stats >> /tmp/deploy_two.log
nova list 
vim deploy.sh  
ironic node-list
ironic help | grep set 
ironic set node-set-maintenance 1cf822cf-8729-4245-82fa-46435b064d88 True
ironic set node-set-maintenance 1cf822cf-8729-4245-82fa-46435b064d88 true
ironic  node-set-maintenance 1cf822cf-8729-4245-82fa-46435b064d88 true
ironic node-list
 ironic  node-set-maintenance  9055fd81-aa97-4980-899e-f48dc99d4ef1 true
ironic  node-set-maintenance   b57a50be-98e3-4af7-b682-bd9a7c04a55a true
 
 ironic  node-set-maintenance  b784a158-18ee-45f7-84f6-ad404d7c89ae   true
 ironic  node-set-maintenance  6e530d2b-0cf3-4477-a0df-5058a1070ee2   true
 ironic  node-set-maintenance  173bcd1c-dae3-4371-92ff-b8d44bcfb15a   true
 ironic  node-set-maintenance  a14c8fbb-dae6-4032-8d5b-d586eaa675ca   true 
 
ironic node-list
heat resource-list -n5 overcloud | egrep -i "fail|progress" 
vim deploy.sh  
ls
 heat resource-list -n5 overcloud | egrep -i "fail|progress" 
nova list
cd templates/
ls
vim ips-from-pool-all.yaml  
time
date
 heat resource-list -n5 overcloud | egrep -i "fail|progress" 
nova list
date 
 heat resource-list -n5 overcloud | egrep -i "fail|progress" 
ironic node-list
nova list
cd ..
ls
cat deploy.sh 
vim templates/scheduler_hints_env.yaml  
heat stack-delete -y overcloud 
watch -n 10 -d "heat resource-list -n5 overcloud | grep -iv complete"
heat stack-list
nova list
ssh heat-admin@172.23.85.100
clear
source stackrc 
ironic node-list
ironic node-list 
ironic port-list
ls
ironic node-list
source stackrc 
ironic node-list
 ironic  node-set-maintenance  1cf822cf-8729-4245-82fa-46435b064d88   false
 ironic  node-set-maintenance  9055fd81-aa97-4980-899e-f48dc99d4ef1   false
 ironic  node-set-maintenance  b57a50be-98e3-4af7-b682-bd9a7c04a55a   false
 ironic  node-set-maintenance  b784a158-18ee-45f7-84f6-ad404d7c89ae   false
 ironic  node-set-maintenance  6e530d2b-0cf3-4477-a0df-5058a1070ee2   false
 ironic  node-set-maintenance  173bcd1c-dae3-4371-92ff-b8d44bcfb15a   false
 ironic  node-set-maintenance  a14c8fbb-dae6-4032-8d5b-d586eaa675ca   false
 
 ironic node-list
nova list
ls
cd templates/
ls
vim scheduler_hints_env.yaml  
cd ..
ls
vim deploy-2.sh  
cp deploy.sh  deploy-all.sh
vim deploy-all.sh  
heat stack-list 
ironic node-list
ironic node-show a14c8fbb-dae6-4032-8d5b-d586eaa675ca
 ironic node-show 94611a8c-df35-4c69-b491-560687e406b2
./deploy-all.sh 
heat stack-delete -y overcloud 
heat stack-list -n 
ironic node-list
./deploy-all.sh 
heat stack-delete -y overcloud 
heat stack-list 
ironic node-list
ironic port-list 
ironic node-port-list a14c8fbb-dae6-4032-8d5b-d586eaa675ca
ironic node-port-list 173bcd1c-dae3-4371-92ff-b8d44bcfb15a
ls
vim ipmi_nodes.json  
heat stack-list 
ironic node-list
 openstack baremetal introspection bulk start 
ironic node-list
ironic node-port-list a14c8fbb-dae6-4032-8d5b-d586eaa675ca
ls
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do    ironic  node-delete $a  done 
nova list
ironic node-list
ls
vim ipmi_nodes.json  
openstack baremetal import --json ipmi_nodes.json  
openstack baremetal configure boot 
ironic port-list
openstack baremetal introspection bulk start
openstack baremetal introspection bulk status
openstack baremetal introspection bulk start
ironic node-list 
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list ; do         ironic  node-set-power-state  $a    off; done 
ironic node-list 
ls
ls
cd templates/
ls
cd nic-configs/
ls
vim compute.yaml  
clear
ssh root@172.23.85.85
source  stackrc 
ip r
ironic node-list
ironic port-list 
openstack baremetal introspection bulk start 
ls
source stackrc 
ironic node-list
ironic port-list
openstack baremetal introspection bulk start 
ls
vim undercloud.conf  
vim /var/lib/neutron/dhcp/03c4a216-1778-4339-8549-9034f5a6f4da/host
nova list 
source stackrc 
nova list
ssh root@172.23.85.92
ls
source stackrc 
ironic node-list
heat stack-list
openstack baremetal introspection bulk start 
openstack baremetal introspection bulk status 
openstack baremetal introspection bulk start 
openstack baremetal introspection bulk status 
openstack baremetal introspection bulk start 
ironic node-list
openstack baremetal introspection bulk start 
ls
ironic node-list
ironic node-show 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5
ironic node-show 1e2b1f64-ccca-4f39-b93d-1ea509b1867b
ironic node-list
ironic node-update 1e2b1f64-ccca-4f39-b93d-1ea509b1867b replace properties/capabilities='node:controller-0,profile:control,boot_option:local'
ironic node-update 755a46c9-7b17-43b6-a9c4-8ada4dee5f05 replace properties/capabilities='node:controller-1,profile:control,boot_option:local'
ironic node-update 233de437-9c26-4d20-916c-9492eea0828c replace properties/capabilities='node:controller-2,profile:control,boot_option:local'
ironic node-update 3b2eb8af-0729-40fe-80b9-fce97d978135 replace properties/capabilities='node:compute-0,profile:compute,boot_option:local'
ironic node-update abc1b4a4-a837-49d7-a47f-d494abc18a77 replace properties/capabilities='node:compute-1,profile:compute,boot_option:local'
ironic node-update bb3b2e64-fa73-4cfb-b631-8de845459014 replace properties/capabilities='node:compute-2,profile:compute,boot_option:local'
ironic node-update 3448cdf2-9d1b-4561-97e4-f2be1ae15e95 replace properties/capabilities='node:compute-3,profile:compute,boot_option:local'
ironic node-update cf3e00f0-c30b-4350-a4cf-5d4002de6c85 replace properties/capabilities='node:compute-4,profile:compute,boot_option:local'
ironic node-update a5150cf1-d742-4787-a573-099fd57dc55d replace properties/capabilities='node:compute-5,profile:compute,boot_option:local'
ironic node-update cce50854-3ce0-4926-9878-1ce32a04f5f9 replace properties/capabilities='node:compute-6,profile:compute,boot_option:local'
ironic node-update d8df3f50-677d-4ca2-869c-3eb96edc602b replace properties/capabilities='node:compute-7,profile:compute,boot_option:local'
ironic node-update 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5 replace properties/capabilities='node:compute-8,profile:compute,boot_option:local'
ls
ironic node-list
./deploy-all.sh  
ip r
source  overcloudrc 
nova list
ip r
nova list 
source  stackrc 
nova list 
nova list  | grep "-" | grep -v "+" 
nova list  | grep "-" | grep -v "+"  | awk '{print $4 $12}'
nova list  | grep "-" | grep -v "+"  | awk '{print $4,$12}'
ip r
ls
scp overcloudrc  root@slot5:~/
exit
ls
cd templates/
ls
vim network-environment.yaml  
exit
l
ll
cd home/
ll
cd stack
ll
cd templates/
pwd
ll
cd
su root
su - rot
su - root
exit
ls
cd templates/
ls
pwd
ls
grep enp129s0 * -irn 
exit
ls
vim undercloud.conf  
egrep -v "^#|^$" undercloud.conf  
glance image-list
source stackrc 
glance image-list
ironic node-list 
ls
cat deploy-all.sh 
ls
mkdir two-node-deploy
mv two-deploy*  two_node*  two-node-deploy/
cd two-node-deploy/
ls
cd ..
ls
mv two-nodes.json two-node-deploy/
ls
cd templates/
ls
cd ..
ls
vim deploy-all.sh  
cd templates/
ls
grep mapping * -irn 
grep sriov * -irn 
cd ..
ls
vim deploy-all.sh  
vim templates/pre-config.yaml  +2 
ls
cd templates/
ls
vim neutron-sriov_systemd.yaml   
cd ..
ls
vim deploy.sh  
ls
cd templates/
ls
vim extra_config.json 
cd ..
ls
cd templates/
cat extra_config.json 
exit
ls
cd templates/
ls
vim extra_config.json  
ls
cd ..
ls
cat deploy.sh  
exit
ls
cd templates/
ls
vim network-environment.yaml  
