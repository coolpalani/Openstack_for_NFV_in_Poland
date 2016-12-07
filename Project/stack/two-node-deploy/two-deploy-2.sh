


time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             \
-e ~/templates/my-overcloud/environments/network-isolation.yaml                   \
-e ~/templates/network-environment.yaml \
-e ~/templates/userdata.yaml \
-e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       \
--control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     \
--control-scale 1    --compute-scale 1  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   \
--neutron-network-type vlan    --neutron-disable-tunneling   \
--neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  \
--neutron-network-vlan-ranges datacentre:2:4090,Date_OVS_vlan_phynet0:2:4090      \
--ntp-server   172.23.85.106   --libvirt-type  kvm





#-e ~/templates/scheduler_hints_env.yaml \
