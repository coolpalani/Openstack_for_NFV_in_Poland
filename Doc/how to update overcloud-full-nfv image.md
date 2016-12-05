
# how to update overcloud-full-nfv.qcow2 

there is a default overcloud-full image for all overcloud nodes, but In this project, we need to use SRIOV on computer node. 
so we need a different image from controller.   

```sh
[hujun@host0 ~]$ cp overcloud-full.qcow2 overcloud-full-nfv.qcow2
```
there are several ways to implement this requirement, such as using guestfish, and virt-customize and others.  
I recommand the following method because it applies to all situations requiring complex modifications.  

## Step1:prepare a kvm VM , attach the qcow2 file as a new disk to the VM

you can install a new kvm Virtual Machine which is Redhat Linux or other Distribution.   

in virt-manager, you can click "add hardware " button , then select storage , as a scsi device.   
like that :
![Operations like this sceenshot](http://image18-c.poco.cn/mypoco/myphoto/20161204/20/56021142016120420023402.png?1436x788_130)

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

add kernel parameter "intel_iommu=on isolcpus=2-39" to the line which start with "linux16". 

like as following:
### BEGIN /etc/grub.d/10_linux ###
menuentry 'Red Hat Enterprise Linux Server (3.10.0-514.el7.x86_64) 7.3 (Maipo)' --class red --class gnu-linux --class gnu --class os --unrestricted $menuentry_id_option 'gnulinux-3.10.0-514.el7.x86_64-advanced-00b7c783-c922-43b5-8f95-dc8b10100c28' {
        load_video
        set gfxpayload=keep
        insmod gzio
        insmod part_msdos
        insmod xfs
        set root='hd0,msdos1'
        if [ x$feature_platform_search_hint = xy ]; then
          search --no-floppy --fs-uuid --set=root --hint='hd0,msdos1'  00b7c783-c922-43b5-8f95-dc8b10100c28
        else
          search --no-floppy --fs-uuid --set=root 00b7c783-c922-43b5-8f95-dc8b10100c28
        fi
        linux16 /boot/vmlinuz-3.10.0-514.el7.x86_64 root=UUID=00b7c783-c922-43b5-8f95-dc8b10100c28 ro console=tty0 console=ttyS0,115200n8 crashkernel=auto rhgb quiet LANG=en_US.UTF-8 intel_iommu=on isolcpus=2-39
        initrd16 /boot/initramfs-3.10.0-514.el7.x86_64.img
}



[root@kvm0 /]# vim etc/default/grub 

for keep consistency, add "intel_iommu=on isolcpus=2-39" as following:

GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200n8 crashkernel=auto rhgb quiet intel_iommu=on isolcpus=2-39"

[root@kvm0 /]# passwd root   # change root password on demand.


[root@kvm0 /]# exit
exit
[root@kvm0 mnt]# cd /
[root@kvm0 /]# umount /mnt
[root@kvm0 /]# 

Back to virt-manager, remove the drive from VM.

```



## Step2: upload the image to Director , apply it.

```sh 
If "overcloud-full-nfv" image has been existed, you should delete it first as follwing:

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
[stack@director ~]$ glance image-delete eab03f9c-d58b-497b-99d9-d8159279abaa
[stack@director ~]$ ls
bak-config  install-commands.md  remove_stack_deleted_left.sh  stackrc     tripleo-overcloud-passwords
deploy.sh   ipmi_nodes.json      reset-instance.sql            swift-data  undercloud.conf
images      overcloud-env.json   shanghai-templates            templates   undercloud-passwords.conf

Upload the image to Director, run the following command:   

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

we should add property kernel_id and ramdisk_id to the new image , the properties can be got from "glance image-show overcloud-full".

[root@director ~]# glance image-show overcloud-full
+-----------------------+--------------------------------------+
| Property              | Value                                |
+-----------------------+--------------------------------------+
| Property 'kernel_id'  | 0dfec46c-e29b-4929-96ff-41d2d6fee836 |
| Property 'ramdisk_id' | 84103980-41bf-42fb-9526-26d2aa0c073d |
| checksum              | e80113c268739e4d8f9c38ebb1ab66af     |
| container_format      | bare                                 |
| created_at            | 2016-11-28T21:34:33.000000           |
| deleted               | False                                |
| disk_format           | qcow2                                |
| id                    | 8b2c933a-6166-4152-8b5f-cbaaa280f869 |
| is_public             | True                                 |
| min_disk              | 0                                    |
| min_ram               | 0                                    |
| name                  | overcloud-full                       |
| owner                 | 8e4077b6129941779c125dd763c63f4f     |
| protected             | False                                |
| size                  | 1232863232                           |
| status                | active                               |
| updated_at            | 2016-11-28T21:34:51.000000           |
+-----------------------+--------------------------------------+


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

[root@director ~]# glance image-list
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

# how to modify the root password  using virt-customize ? 

we can download rhel-guest-image from Redhat Official website, like as rhel-guest-image-7.3-35.x86_64.qcow2.

```sh 
[root@director osp9_media]# yum install libguestfs-tools-c

assumed we set "huawei" as root's password.

[root@director osp9_media]# virt-customize  -a  rhel-guest-image-7.3-35.x86_64.qcow2  --root-password password:huawei
[   0.0] Examining the guest ...
[  26.2] Setting a random seed
[  26.2] Setting passwords
[  28.4] Finishing off

```


