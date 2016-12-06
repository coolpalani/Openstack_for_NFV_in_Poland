Openstack For Poland NFV Installation
--------------

# Undercloud

1. Install Rhel Linux 7  on the E2288 hardware
   we can install it via rhel-server-7.3-x86_64-dvd.iso, then configure nic for remote connection by ssh and set hostname "director.vepc.mnc066.mcc260.3gppnetwork.org" , we can call this server "director". 
    
```sh 

[root@director yum.repos.d]# ip r
default via 172.23.85.1 dev enp130s0f0 
169.254.0.0/16 dev enp129s0f0  scope link  metric 1006 
169.254.0.0/16 dev enp130s0f0  scope link  metric 1008 
172.23.85.0/26 dev enp130s0f0  proto kernel  scope link  src 172.23.85.35
172.23.85.64/26 dev enp129s0f0  proto kernel  scope link  src 172.23.85.106

we use "enp130s0f0" as "External network" in Director, "enp129s0f0" as "PXE network".  

```
   
2. Ssh connect director, and configure hostname 
```sh
[root@director ~]# setenforce 0 
[root@director ~]# vi /etc/selinux/config  #like as following.
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=permissive
# SELINUXTYPE= can take one of three two values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected. 
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted 



[root@director ~]# useradd stack
[root@director ~]# passwd stack  # specify a password

[root@director ~]# echo "stack ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/stack
[root@director ~]# chmod 0440 /etc/sudoers.d/stack

[root@director ~]# hostnamectl set-hostname director.vepc.mnc066.mcc260.3gppnetwork.org
[root@director ~]# hostnamectl set-hostname --transient  director.vepc.mnc066.mcc260.3gppnetwork.org


vi /etc/hosts, like as following:

127.0.0.1  director.vepc.mnc066.mcc260.3gppnetwork.org  director localhost localhost.localdomain localhost4 localhost4.localdomain4


```

3. prepare installation resposity 
   copy redhat openstack9 installation media to Director,assumed that the media is located in directory "/home/" 

```sh 
ssh root@172.23.85.35

[root@director osp9_media]# ls
11-http-repo.conf                                rhel-7-ansible-rpms                      rhel-7-server-openstack-9-tools-rpms
add_http_repo.txt                                rhel-7-server-extras-rpms                rhel-7-server-rh-common-rpms
cirros-0.3.4-x86_64-disk.img                     rhel-7-server-openstack-9-director-rpms  rhel-7-server-rpms
configuresriovduringdeployment_in_rhelosp7.docx  rhel-7-server-openstack-9-optools-rpms   rhel-guest-image-7.3-35.x86_64.qcow2
http.repo                                        rhel-7-server-openstack-9-rpms           rhel-server-7.3-x86_64-dvd.iso
[root@director osp9_media]# pwd
/home/osp9_media

edit a repo file like that:
[root@director osp9_media]# cat local.repo 
[rhel-server-rpms]
name=rhel-7-server-rpms
baseurl=file:///home/osp9_media/rhel-7-server-rpms
enabled=1
gpgcheck=0

[rhel-7-ansible-rpms]
name=rhel-7-ansible-rpms
baseurl=file:///home/osp9_media/rhel-7-ansible-rpms
enabled=1
gpgcheck=0

[root@director osp9_media]# cp local.repo  /etc/yum.repos.d/
[root@director osp9_media]# yum repolist
Loaded plugins: langpacks, product-id, search-disabled-repos, subscription-manager
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
rhel-server-rpms                                                                                                           | 2.9 kB  00:00:00     
rhel-server-rpms/primary_db                                                                                                | 3.9 MB  00:00:00     
repo id                                                              repo name                                                              status
rhel-server-rpms                                                     rhel-7-server-rpms                                                     4,874
rhel-server-ansilbe-rpms                                             rhel-7-server-ansilbe-rpms                                             4,874


[root@director osp9_media]# yum install -y ntpd httpd tcpdump ansilbe 

[root@director osp9_media]# cat 11-http-repo.conf 
Listen 8089
<VirtualHost *:8089>
    DocumentRoot "/var/www/html"
    <Directory "/var/www/html">
        Options Indexes FollowSymLinks
        AllowOverride None
        Order allow,deny
        Allow from all
        Require all granted
    </Directory>

    ## Logging
    ErrorLog "/var/log/httpd/repo_error.log"
    ServerSignature Off
    CustomLog "/var/log/httpd/repo_access.log" combined
</VirtualHost>

[root@director osp9_media]# mount -o bind  /home/osp9_media/  /var/www/html/osp9_media/
[root@director osp9_media]# cp 11-http-repo.conf /etc/httpd/conf.d/
[root@director osp9_media]# systemctl enable httpd ; systemctl start httpd 

edit a repo file ,as following: 

[root@director osp9_media]# cat http.repo 
[rhel-7-server-rpms]
name=rhel-7-server-rpms
baseurl=http://172.23.85.106:8089/osp9_media/rhel-7-server-rpms
enabled=1
gpgcheck=0

[rhel-7-server-openstack-9-rpms]
name=rhel-7-server-openstack-9-rpms
baseurl=http://172.23.85.106:8089/osp9_media/rhel-7-server-openstack-9-rpms
enabled=1
gpgcheck=0

[rhel-7-server-openstack-9-director-rpms]
name=rhel-7-server-openstack-9-director-rpms
baseurl=http://172.23.85.106:8089/osp9_media/rhel-7-server-openstack-9-director-rpms
enabled=1
gpgcheck=0

[rhel-7-server-rh-common-rpms]
name=rhel-7-server-rh-common-rpms
baseurl=http://172.23.85.106:8089/osp9_media/rhel-7-server-rh-common-rpms
enabled=1
gpgcheck=0

[rhel-7-server-extras-rpms]
name=rhel-7-server-extras-rpms
baseurl=http://172.23.85.106:8089/osp9_media/rhel-7-server-extras-rpms
enabled=1
gpgcheck=0

[rhel-7-ansible-rpms]
name=rhel-7-ansible-rpms
baseurl=http://172.23.85.106:8089/osp9_media/rhel-7-ansible-rpms
enabled=1
gpgcheck=0

[root@director osp9_media]# mv /etc/yum.repos.d/local.repo  /opt/

[root@director osp9_media]# yum repolist            # please confirm it doesn't report any errors.

[root@director osp9_media]#echo "mount -o bind  /home/osp9_media/  /var/www/html/osp9_media/" >> /etc/rc.local
[root@director osp9_media]#chmod a+x /etc/rc.d/rc.local

```



4. prepare  for installing Undercloud 

```sh 
# config ntp server for overcloud
[root@director ~]# vi /etc/ntp.conf   # like as following.

restrict 127.0.0.1
restrict ::1
server 127.127.1.0


#server 0.rhel.pool.ntp.org iburst
#server 1.rhel.pool.ntp.org iburst
#server 2.rhel.pool.ntp.org iburst
#server 3.rhel.pool.ntp.org iburst


[root@director ~]# systemctl enable ntpd ; systemctl start ntpd 
[root@director ~]# systemctl disable firewalld; systemctl stop firewalld
[root@director ~]# systemctl disable NetworkManager; systemctl stop NetworkManager

[root@director ~]# yum update -y 
[root@director ~]# reboot 


[root@director ~]# su - stack
[stack@director ~]$ mkdir ~/images
[stack@director ~]$ mkdir ~/templates
[stack@director ~]$ sudo yum install -y python-tripleoclient

```

5. Config director and install undercloud

```sh 
[stack@director ~]$ cp /usr/share/instack-undercloud/undercloud.conf.sample ~/undercloud.conf

# modify undercloud.conf like as following.
[stack@director ~]$ egrep -v "^#|^$" undercloud.conf  
[DEFAULT]
local_ip = 172.23.85.106
network_gateway = 172.23.85.65
undercloud_public_vip = 172.23.85.107
undercloud_admin_vip = 172.23.85.108
local_interface = enp129s0f0
network_cidr = 172.23.85.64/26
dhcp_start = 172.23.85.85
dhcp_end = 172.23.85.104
inspection_interface = br-ctlplane
inspection_iprange = 172.23.85.85,172.23.85.104
inspection_runbench = false
undercloud_debug = true
[auth]

[stack@director ~]$ openstack undercloud install


```


# Check network configuration of switch and confirm.




# Overcloud


1. prepare a mapping table of overcloud node's BMC IP address and slot number

```sh 

[stack@director ~]$ openstack baremetal import --json ~/ipmi_nodes.json

#this command will make all nodes power off 

[stack@director ~]$ ironic node-list
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| 1e2b1f64-ccca-4f39-b93d-1ea509b1867b | None | None          | power off   | manageable         | False       |
| 755a46c9-7b17-43b6-a9c4-8ada4dee5f05 | None | None          | power off   | manageable         | False       |
| 233de437-9c26-4d20-916c-9492eea0828c | None | None          | power off   | manageable         | False       |
| 3b2eb8af-0729-40fe-80b9-fce97d978135 | None | None          | power off   | manageable         | False       |
| abc1b4a4-a837-49d7-a47f-d494abc18a77 | None | None          | power off   | manageable         | False       |
| bb3b2e64-fa73-4cfb-b631-8de845459014 | None | None          | power off   | manageable         | False       |
| 3448cdf2-9d1b-4561-97e4-f2be1ae15e95 | None | None          | power off   | manageable         | False       |
| cf3e00f0-c30b-4350-a4cf-5d4002de6c85 | None | None          | power off   | manageable         | False       |
| a5150cf1-d742-4787-a573-099fd57dc55d | None | None          | power off   | manageable         | False       |
| cce50854-3ce0-4926-9878-1ce32a04f5f9 | None | None          | power off   | manageable         | False       |
| d8df3f50-677d-4ca2-869c-3eb96edc602b | None | None          | power off   | manageable         | False       |
| 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5 | None | None          | power off   | manageable         | False       |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+



```

2. prepare images for all overcloud nodes. 

```sh
[stack@director ~]$ sudo yum install rhosp-director-images rhosp-director-images-ipa
[stack@director ~]$ cd ~/images
[stack@director ~]$ for i in /usr/share/rhosp-director-images/overcloud-full-latest-9.0.tar /usr/share/rhosp-director-images/ironic-python-agent-latest-9.0.tar; do tar -xvf $i; done



$ openstack overcloud image upload --image-path /home/stack/images/


[stack@director ~]$ glance image-list
+--------------------------------------+------------------------+-------------+------------------+------------+--------+
| ID                                   | Name                   | Disk Format | Container Format | Size       | Status |
+--------------------------------------+------------------------+-------------+------------------+------------+--------+
| 1c66f6ac-e452-403e-a210-ee4cc010df00 | bm-deploy-kernel       | aki         | aki              | 5391264    | active |
| 5edb0858-b012-4f87-bf52-3be275594410 | bm-deploy-ramdisk      | ari         | ari              | 395132876  | active |
| 8b2c933a-6166-4152-8b5f-cbaaa280f869 | overcloud-full         | qcow2       | bare             | 1232863232 | active |
| 84103980-41bf-42fb-9526-26d2aa0c073d | overcloud-full-initrd  | ari         | ari              | 53673738   | active |
| 0dfec46c-e29b-4929-96ff-41d2d6fee836 | overcloud-full-vmlinuz | aki         | aki              | 5391264    | active |
+--------------------------------------+------------------------+-------------+------------------+------------+--------+


```

3. prepare images for compute node.
```sh 
[stack@director ~]$ glance image-list
+--------------------------------------+------------------------+-------------+------------------+------------+--------+
| ID                                   | Name                   | Disk Format | Container Format | Size       | Status |
+--------------------------------------+------------------------+-------------+------------------+------------+--------+
| 1c66f6ac-e452-403e-a210-ee4cc010df00 | bm-deploy-kernel       | aki         | aki              | 5391264    | active |
| 5edb0858-b012-4f87-bf52-3be275594410 | bm-deploy-ramdisk      | ari         | ari              | 395132876  | active |
| 8b2c933a-6166-4152-8b5f-cbaaa280f869 | overcloud-full         | qcow2       | bare             | 1232863232 | active |
| 84103980-41bf-42fb-9526-26d2aa0c073d | overcloud-full-initrd  | ari         | ari              | 53673738   | active |
| 8439e0f2-033c-4a4f-9aa9-a6d1c8952d27 | overcloud-full-nfv     | qcow2       | bare             | 1332281344 | active |
| 0dfec46c-e29b-4929-96ff-41d2d6fee836 | overcloud-full-vmlinuz | aki         | aki              | 5391264    | active |
+--------------------------------------+------------------------+-------------+------------------+------------+--------+

```


4. Start introspection 
```sh 


```

5. Assign roles for nodes

```sh

ironic node-update 1e2b1f64-ccca-4f39-b93d-1ea509b1867b replace properties/capabilities='node:controller-0,profile:control,boot_option:local'
ironic node-update 755a46c9-7b17-43b6-a9c4-8ada4dee5f05 replace properties/capabilities='node:controller-1,profile:control,boot_option:local'
ironic node-update 233de437-9c26-4d20-916c-9492eea0828c replace properties/capabilities='node:controller-2,profile:control,boot_option:local'

ironic node-update 3b2eb8af-0729-40fe-80b9-fce97d978135 replace properties/capabilities='node:compute-0,profile:compute,boot_option:local'
ironic node-update abc1b4a4-a837-49d7-a47f-d494abc18a77 replace properties/capabilities='node:compute-1,profile:compute,boot_option:local'
ironic node-update bb3b2e64-fa73-4cfb-b631-8de845459014 replace properties/capabilities='node:compute-2,profile:compute,boot_option:local'
ironic node-update 3448cdf2-9d1b-4561-97e4-f2be1ae15e95 replace properties/capabilities='node:compute-3,profile:compute,boot_option:local'
ironic node-update cf3e00f0-c30b-4350-a4cf-5d4002de6c85 replace properties/capabilities='node:compute-4,profile:compute,boot_option:local'
ironic node-update a5150cf1-d742-4787-a573-099fd57dc55d replace properties/capabilities='node:compute-5,profile:compute,boot_option:local'
ironic node-update cce50854-3ce0-4926-9878-1ce32a04f5f9 replace properties/capabilities='node:comppute-6,profile:compute,boot_option:local'
ironic node-update d8df3f50-677d-4ca2-869c-3eb96edc602b replace properties/capabilities='node:compute-7,profile:compute,boot_option:local'
ironic node-update 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5 replace properties/capabilities='node:compute-8,profile:compute,boot_option:local'

```


6. Edit network configuration file 
```sh 


```

7. Deployment 

```sh
[stack@director ~]$ time openstack overcloud deploy   --templates   ~/templates/my-overcloud/             \
-e ~/templates/my-overcloud/environments/network-isolation.yaml                   \
-e ~/templates/network-environment.yaml \
-e ~/templates/userdata.yaml \
-e ~/templates/scheduler_hints_env.yaml \
-e ~/templates/extra_config.json -e ~/templates/pre-config.yaml       \
--control-flavor control --compute-flavor compute   --ceph-storage-flavor ceph-storage     \
--control-scale 3    --compute-scale 9  --ceph-storage-scale 0 --block-storage-scale 0   --swift-storage-scale 0   \
--neutron-network-type vlan    --neutron-disable-tunneling   \
--neutron-bridge-mappings datacentre:br-ex,Date_OVS_vlan_phynet0:br-phynet0  \
--neutron-network-vlan-ranges datacentre:2:4090,Date_OVS_vlan_phynet0:2:4090      \
--ntp-server   172.23.85.106   --libvirt-type  kvm




 
```
