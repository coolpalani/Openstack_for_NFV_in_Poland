
NIC_LIST="enp129s0f2  enp129s0f3  enp132s0f0 enp132s0f1"

for nic in $NIC_LIST
do
   conf_file=/etc/sysconfig/network-scripts/ifcfg-$nic
#   echo $conf_file
   if [ -a $conf_file ] 
   then 
       sed -i 's/BOOTPROTO="dhcp"/BOOTPROTO=none/'  $conf_file
   fi 
done
