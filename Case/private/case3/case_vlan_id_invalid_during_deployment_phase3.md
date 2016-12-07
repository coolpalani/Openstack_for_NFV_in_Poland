
# Sympton

time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             \
-e ~/templates/my-overcloud/environments/network-isolation.yaml                   \
-e ~/templates/network-environment.yaml \
-e ~/templates/userdata.yaml \
-e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       \
--control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     \
--control-scale 1    --compute-scale 1  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   \
--neutron-network-type vlan    --neutron-disable-tunneling   \
--neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  \
--neutron-network-vlan-ranges datacentre:1:4095,Date_OVS_vlan_phynet0:1:4095      \
--ntp-server   172.23.85.106   --libvirt-type  kvm


in the os-collect-config log 

vlan id is invalid 


# Solution:

shrink vlan range in the deploy command line. 


```bash 
Stack overcloud CREATE_COMPLETE
/home/stack/.ssh/known_hosts updated.
Original contents retained as /home/stack/.ssh/known_hosts.old
Skipping "horizon" postconfig because it wasn't found in the endpoint map output
PKI initialization in init-keystone is deprecated and will be removed.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
2c:9f:57:3c:44:b4:e1:a0:98:8f:1f:8f:bc:e6:ae:36.
Please contact your system administrator.
Add correct host key in /home/stack/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/stack/.ssh/known_hosts:2
Password authentication is disabled to avoid man-in-the-middle attacks.
Keyboard-interactive authentication is disabled to avoid man-in-the-middle attacks.
The following cert files already exist, use --rebuild to remove the existing files before regenerating:
/etc/keystone/ssl/certs/ca.pem already exists
/etc/keystone/ssl/private/signing_key.pem already exists
/etc/keystone/ssl/certs/signing_cert.pem already exists
Connection to 172.23.85.100 closed.
Overcloud Endpoint: http://172.23.85.11:5000/v2.0
Overcloud Deployed

real	27m23.525s
user	0m32.114s
sys	0m3.425s



```
