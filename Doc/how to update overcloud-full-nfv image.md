
# how to update overcloud-full-nfv.qcow2 

there is a default overcloud-full image for all overcloud nodes, but In this project, we need to use SRIOV on computer node. 
so we need a different image from controller. 

there are several ways to implement this requirement, such as using guestfish, and virt-customize and others. 
I recommand the following method because it applies to all situations requiring complex modifications.

### prepare a kvm VM , attach the qcow2 file as a new disk to the VM

you can install a new kvm Virtual Machine which is Redhat Linux or other Distribution. 

in virt-manager, you can click "add hardware " button , then select storage , as a scsi device. 
like that :
![operations](http://image18-c.poco.cn/mypoco/myphoto/20161204/20/56021142016120420023402.png?1436x788_130)

```sh 
ssh root@VM 


[root@kvm0 /]# lsscsi
[0:0:0:0]    cd/dvd  QEMU     QEMU DVD-ROM     1.5.  /dev/sr0 
[2:0:0:0]    disk    QEMU     QEMU HARDDISK    1.5.  /dev/sda 
[root@kvm0 /]# mount /dev/sda /mnt/
[root@kvm0 /]# cd /mnt/
[root@kvm0 mnt]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@kvm0 mnt]# chroot . 
[root@kvm0 /]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@kvm0 /]# vim boot/grub2/grub.cfg 




[root@kvm0 /]# vim etc/default/grub 
[root@kvm0 /]# exit
exit
[root@kvm0 mnt]# cd /
[root@kvm0 /]# umount /mnt
[root@kvm0 /]# 



[stack@director ~]$ glance image-update eab03f9c-d58b-497b-99d9-d8159279abaa --is-protected false
+-----------------------+--------------------------------------+
| Property              | Value                                |
+-----------------------+--------------------------------------+
| Property 'kernel_id'  | 0dfec46c-e29b-4929-96ff-41d2d6fee836 |
| Property 'ramdisk_id' | 84103980-41bf-42fb-9526-26d2aa0c073d |
| checksum              | 38c855edd9c3d030a0be978c28bb3f29     |
| container_format      | bare                                 |
| created_at            | 2016-11-28T21:47:44.000000           |
| deleted               | False                                |
| deleted_at            | None                                 |
| disk_format           | qcow2                                |
| id                    | eab03f9c-d58b-497b-99d9-d8159279abaa |
| is_public             | False                                |
| min_disk              | 0                                    |
| min_ram               | 0                                    |
| name                  | overcloud-full-nfv                   |
| owner                 | 8e4077b6129941779c125dd763c63f4f     |
| protected             | False                                |
| size                  | 1332084736                           |
| status                | active                               |
| updated_at            | 2016-11-30T14:45:52.000000           |
| virtual_size          | None                                 |
+-----------------------+--------------------------------------+
[stack@director ~]$ 
[stack@director ~]$ glance image-delete eab03f9c-d58b-497b-99d9-d8159279abaa
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ ls
bak-config  install-commands.md  remove_stack_deleted_left.sh  stackrc     tripleo-overcloud-passwords
deploy.sh   ipmi_nodes.json      reset-instance.sql            swift-data  undercloud.conf
images      overcloud-env.json   shanghai-templates            templates   undercloud-passwords.conf
```


## upload the image to Director , apply it.

```sh 
[stack@director ~]$ glance image-create --name overcloud-full-nfv  --disk-format qcow2 --container-format bare --file images/overcloud-full-nfv.qcow2  --progress 
[=============================>] 100%
+------------------+--------------------------------------+
| Property         | Value                                |
+------------------+--------------------------------------+
| checksum         | f5cf9acd3c26f8b99bf4c02f89e6ab1f     |
| container_format | bare                                 |
| created_at       | 2016-11-30T14:47:57.000000           |
| deleted          | False                                |
| deleted_at       | None                                 |
| disk_format      | qcow2                                |
| id               | 680d5681-f2c0-4f1f-84ed-d469bba2976c |
| is_public        | False                                |
| min_disk         | 0                                    |
| min_ram          | 0                                    |
| name             | overcloud-full-nfv                   |
| owner            | 8e4077b6129941779c125dd763c63f4f     |
| protected        | False                                |
| size             | 1332215808                           |
| status           | active                               |
| updated_at       | 2016-11-30T14:48:17.000000           |
| virtual_size     | None                                 |
+------------------+--------------------------------------+
[stack@director ~]$ glance image-update 680d5681-f2c0-4f1f-84ed-d469bba2976c --property kernel_id=0dfec46c-e29b-4929-96ff-41d2d6fee836 --property  ramdisk_id=84103980-41bf-42fb-9526-26d2aa0c073d
+-----------------------+--------------------------------------+
| Property              | Value                                |
+-----------------------+--------------------------------------+
| Property 'kernel_id'  | 0dfec46c-e29b-4929-96ff-41d2d6fee836 |
| Property 'ramdisk_id' | 84103980-41bf-42fb-9526-26d2aa0c073d |
| checksum              | f5cf9acd3c26f8b99bf4c02f89e6ab1f     |
| container_format      | bare                                 |
| created_at            | 2016-11-30T14:47:57.000000           |
| deleted               | False                                |
| deleted_at            | None                                 |
| disk_format           | qcow2                                |
| id                    | 680d5681-f2c0-4f1f-84ed-d469bba2976c |
| is_public             | False                                |
| min_disk              | 0                                    |
| min_ram               | 0                                    |
| name                  | overcloud-full-nfv                   |
| owner                 | 8e4077b6129941779c125dd763c63f4f     |
| protected             | False                                |
| size                  | 1332215808                           |
| status                | active                               |
| updated_at            | 2016-11-30T14:49:08.000000           |
| virtual_size          | None                                 |
+-----------------------+--------------------------------------+
[stack@director ~]$ 

```

