
timedatectl set-timezone "Asia/Shanghai" 

#config sriov on control nodes
if $(hostnamectl  | grep hostname | grep -q controller)
then
  echo "config sriov on host node ..." >> /tmp/config.sriov
  cp  /etc/neutron/plugin.ini   /etc/neutron/plugin.ini.org
  openstack-config --set  /etc/neutron/plugin.ini ml2  mechanism_drivers "openvswitch,sriovnicswitch"
  openstack-config --set  /etc/neutron/plugin.ini ml2_type_vlan network_vlan_ranges "datacentre:1202:4000,sriov1:10:4090,sriov2:10:4090"
 
  cp /etc/neutron/plugins/ml2/ml2_conf_sriov.ini /etc/neutron/plugins/ml2/ml2_conf_sriov.ini.org
  openstack-config --set /etc/neutron/plugins/ml2/ml2_conf_sriov.ini ml2_sriov  supported_pci_vendor_devs "15b3:1004, 8086:10ca"
  openstack-config --set /etc/neutron/plugins/ml2/ml2_conf_sriov.ini sriov_nic physical_device_mappings "sriov1:enp4s0,sriov2:enp4s0d1"

  cp /usr/lib/systemd/system/neutron-server.service /usr/lib/systemd/system/neutron-server.service.org
  openstack-config --set /usr/lib/systemd/system/neutron-server.service Service ExecStart "/usr/bin/neutron-server --config-file /usr/share/neutron/neutron-dist.conf --config-dir /usr/share/neutron/server --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugin.ini --config-dir /etc/neutron/conf.d/common --config-dir /etc/neutron/conf.d/neutron-server --config-file /etc/neutron/plugins/ml2/ml2_conf_sriov.ini --log-file /var/log/neutron/server.log"
  
  systemctl daemon-reload
  systemctl restart neutron-server.service


  cp /etc/nova/nova.conf  /etc/nova/nova.conf.org
  openstack-config --set /etc/nova/nova.conf scheduler_default_filters "RetryFilter,AvailabilityZoneFilter,RamFilter,ComputeFilter,ComputeCapabilitiesFilter,ImagePropertiesFilter,ServerGroupAntiAffinityFilter,ServerGroupAffinityFilter,PciPassthroughFilter,NUMATopologyFilter" 
  systemctl restart openstack-nova-scheduler.service

fi

#config sriov on computer nodes
if $(hostnamectl  | grep hostname | grep -q compute)
then
  echo "config sriov on compute node ..." >> /tmp/config.sriov.compute
  mv /etc/default/grub  /etc/default/grub.org
  sed 's/quiet/quiet intel_iommu=on pci=realloc/'  /etc/default/grub.org  >/etc/default/grub

  grub2-mkconfig -o /boot/grub2/grub.cfg

  cp /boot/initramfs-$(uname -r).img   /boot/initramfs-$(uname -r).img.org
  echo "options vfio_iommu_type1 allow_unsafe_interrupts=1" > /etc/modprobe.d/dist.conf
 
  #for intel 82599 netcard
  #echo "echo 8 > /sys/bus/pci/devices/0000:04:00.0/sriov_numvfs" >> /etc/rc.local
  
  #for mellonox netcard
  echo "options mlx4_core port_type_array=2,2 num_vfs=4,4,0 probe_vf=0,0,0  log_num_mgm_entry_size=-1 " > /etc/modprobe.d/mlx4.conf

  chmod +x /etc/rc.d/rc.local

  dracut -f -v
  
  cp /etc/nova/nova.conf  /etc/nova/nova.conf.org
  openstack-config --set /etc/nova/nova.conf DEFAULT pci_passthrough_whitelist  "{\"devname\":\"enp4s0\", \"physical_network\":\"sriov1\",\"devname\":\"enp4s0d1\",\"physical_network\":\"sriov2\"}"

  ###reboot 
  
fi



