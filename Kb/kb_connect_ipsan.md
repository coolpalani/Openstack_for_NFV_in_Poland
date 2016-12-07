# How to connect Huawei 5500 IPSAN to Redhat Openstack

## Configuration

now , we have the network configruation of Huawei 5500 IPSAN as following.

Network       | IP Address     | Mask            |
--------------|----------------|-----------------|
control plane | 172.23.85.9    | 255.255.255.192 |
data plane    | 172.20.85.240  | 255.255.255.0   |

please do the following steps on all controllers.

1. Edit cinder huawei config file

```xml
[root@slot5 cinder]# cat cinder_huawei_conf.xml
<?xml version='1.0' encoding='UTF-8'?>
<config>
<Storage>
<Product>V3</Product>
<Protocol>iSCSI</Protocol>
<RestURL>https://172.23.85.9:8088/deviceManager/rest/</RestURL>    
<UserName>admin</UserName>      
<UserPassword>Huawei12#$</UserPassword>    
</Storage>
<LUN>
<LUNType>Thick</LUNType>
<WriteType>1</WriteType>
<MirrorSwitch>1</MirrorSwitch>
<LUNcopyWaitInterval>5</LUNcopyWaitInterval>
<Timeout>432000</Timeout>
<StoragePool>StoragePool001</StoragePool>       
</LUN>
<iSCSI>
<DefaultTargetIP>172.20.85.240</DefaultTargetIP>  

</iSCSI>
<Host HostIP="172.20.85.18,172.20.85.25,172.20.85.15,172.20.85.20,172.20.85.19,172.20.85.17,172.20.85.16,172.20.85.21,172.20.85.12,172.20.85.14" OSType="Linux" />     

```
Modify owner of the config file.
```sh
[root@slot5 cinder]# chown cinder:cinder cinder_huawei_conf.xml
```

the above "HostIP" is the IP address list of Compute Node on storage network plane.

2. Modify cinder.conf 

Modify /etc/cinder/cinder.conf ,comment "tripleo_iscsi" section in the tail of cinder.conf and add "ipsan" section as following.

```text
#[tripleo_iscsi]
#volume_driver=cinder.volume.drivers.lvm.LVMVolumeDriver
#volumes_dir=/var/lib/cinder/volumes
#iscsi_ip_address=172.20.85.18
#volume_backend_name=tripleo_iscsi
#iscsi_helper=lioadm


[ipsan]
iscsi_helper=lioadm
iscsi_ip_address=172.23.85.9
volumes_dir=/var/lib/cinder/volumes
volume_backend_name=ipsan

volume_driver = cinder.volume.drivers.huawei.huawei_driver.HuaweiISCSIDriver
cinder_huawei_conf_file = /etc/cinder/cinder_huawei_conf.xml
```
then change the "enabled_backend" 
[default]
enabled_backends=lvm
enabled_backends=ipsan

3. Apply the configuration.
```sh
[root@slot5 ~]# pcs status | grep cinder
 openstack-cinder-volume	(systemd:openstack-cinder-volume):	Started slot14
 Clone Set: openstack-cinder-scheduler-clone [openstack-cinder-scheduler]
 Clone Set: openstack-cinder-api-clone [openstack-cinder-api]

[root@slot5 ~]# pcs resource unmanage openstack-cinder-volume
[root@slot5 ~]# systemctl restart  openstack-cinder-volume
[root@slot5 ~]# pcs resource manage openstack-cinder-volume

```


## Troubles

###  The user account has been locked

Reason: {u'data': {}, u'error': {u'code': 1077949070, u'description': u'The user account has been locked.', u'suggestion': u'Try again later.'}}.
2016-12-05 09:11:23.029 39878 ERROR cinder.volume.drivers.huawei.rest_client [req-42c11408-2e9d-409f-897f-64a786e401a5 - - - - -] Failed to login with all rest URLs.
2016-12-05 09:11:23.030 39878 ERROR oslo_service.service [req-42c11408-2e9d-409f-897f-64a786e401a5 - - - - -] Error starting thread.
2016-12-05 09:11:23.030 39878 ERROR oslo_service.service Traceback (most recent call last):


### Other question.
Request URL: https://172.23.85.9:8088/deviceManager/rest/2102350BSE10F3000022/storagepool

Call Method: None

Request Data: None

Response Data:{"data":[{"DATASPACE":"10478551040","DESCRIPTION":"","DSTRUNNINGSTATUS":"1","DSTSTATUS":"2","ENABLESMARTCACHE":"false","ENABLESSDBUFFER":"false","EXTENTSIZE":"8192","HEALTHSTATUS":"1","ID":"0","IMMEDIATEMIGRATION":"0","IMMEDIATEMIGRATIONDURATIONTIME":"0","MIGRATIONESTIMATEDTIME":"0","MIGRATIONMODE":"2","MIGRATIONSCHEDULEID":"[]","MONITORSCHEDULEID":"[]","MOVEDDOWNDATA":"0","MOVEDOWNDATA":"0","MOVEDUPDATA":"0","MOVEUPDATA":"0","NAME":"StoragePool001","PARENTID":"0","PARENTNAME":"DiskDomain001","PAUSEMIGRATIONSWITCH":"0","REPLICATIONCAPACITY":"0","RESERVEDCAPACITY":"0","RUNNINGSTATUS":"27","TIER0CAPACITY":"10481565696","TIER0DISKTYPE":"3","TIER0RAIDDISKNUM":"8","TIER0RAIDLV":"1","TIER0STRIPEDEPTH":"256","TIER1CAPACITY":"0","TIER1DISKTYPE":"0","TIER1RAIDDISKNUM":"0","TIER1RAIDLV":"0","TIER1STRIPEDEPTH":"0","TIER2CAPACITY":"0","TIER2DISKTYPE":"0","TIER2RAIDDISKNUM":"0","TIER2RAIDLV":"0","TIER2STRIPEDEPTH":"0","TYPE":216,"USAGETYPE":"1","USERCONSUMEDCAPACITY":"0","USERCONSUMEDCAPACITYPERCENTAGE":"0","USERCONSUMEDCAPACITYTHRESHOLD":"80","USERFREECAPACITY":"10481565696","USERTOTALCAPACITY":"10481565696"}],"error":{"code":0,"description":"0"}}



2016-12-05 10:58:21.535 37380 ERROR oslo.messaging._drivers.impl_rabbit [req-664d84e6-3d86-42fc-a472-c27c8c38d214 - - - - -] AMQP server on 172.19.85.17:5672 is unreachable: [Errno 111] ECONNREFUSED. Trying again in 1 seconds.
2016-12-05 10:58:22.541 37380 ERROR oslo.messaging._drivers.impl_rabbit [req-664d84e6-3d86-42fc-a472-c27c8c38d214 - - - - -] AMQP server on 172.19.85.17:5672 is unreachable: [Errno 111] ECONNREFUSED. Trying again in 1 seconds.
2016-12-05 10:58:23.551 37380 INFO oslo.messaging._drivers.impl_rabbit [req-664d84e6-3d86-42fc-a472-c27c8c38d214 - - - - -] Reconnected to AMQP server on 172.19.85.24:5672 via [amqp] client
2016-12-05 10:58:23.555 37380 INFO cinder.volume.manager [req-664d84e6-3d86-42fc-a472-c27c8c38d214 - - - - -] Driver initialization completed successfully.
2016-12-05 10:58:23.586 37380 INFO cinder.volume.manager [req-664d84e6-3d86-42fc-a472-c27c8c38d214 - - - - -] Initializing RPC dependent components of volume driver HuaweiISCSIDriver (2.0.5)
2016-12-05 10:58:23.620 37380 INFO cinder.volume.drivers.huawei.rest_client [req-664d84e6-3d86-42fc-a472-c27c8c38d214 - - - - -]



Request URL: https://172.23.85.9:8088/deviceManager/rest/2102350BSE10F3000022/storagepool

Call Method: None

Request Data: None

Response Data:{"data":[{"DATASPACE":"10478551040","DESCRIPTION":"","DSTRUNNINGSTATUS":"1","DSTSTATUS":"2","ENABLESMARTCACHE":"false","ENABLESSDBUFFER":"false","EXTENTSIZE":"8192","HEALTHSTATUS":"1","ID":"0","IMMEDIATEMIGRATION":"0","IMMEDIATEMIGRATIONDURATIONTIME":"0","MIGRATIONESTIMATEDTIME":"0","MIGRATIONMODE":"2","MIGRATIONSCHEDULEID":"[]","MONITORSCHEDULEID":"[]","MOVEDDOWNDATA":"0","MOVEDOWNDATA":"0","MOVEDUPDATA":"0","MOVEUPDATA":"0","NAME":"StoragePool001","PARENTID":"0","PARENTNAME":"DiskDomain001","PAUSEMIGRATIONSWITCH":"0","REPLICATIONCAPACITY":"0","RESERVEDCAPACITY":"0","RUNNINGSTATUS":"27","TIER0CAPACITY":"10481565696","TIER0DISKTYPE":"3","TIER0RAIDDISKNUM":"8","TIER0RAIDLV":"1","TIER0STRIPEDEPTH":"256","TIER1CAPACITY":"0","TIER1DISKTYPE":"0","TIER1RAIDDISKNUM":"0","TIER1RAIDLV":"0","TIER1STRIPEDEPTH":"0","TIER2CAPACITY":"0","TIER2DISKTYPE":"0","TIER2RAIDDISKNUM":"0","TIER2RAIDLV":"0","TIER2STRIPEDEPTH":"0","TYPE":216,"USAGETYPE":"1","USERCONSUMEDCAPACITY":"0","USERCONSUMEDCAPACITYPERCENTAGE":"0","USERCONSUMEDCAPACITYTHRESHOLD":"80","USERFREECAPACITY":"10481565696","USERTOTALCAPACITY":"10481565696"}],"error":{"code":0,"description":"0"}}



2016-12-05 10:58:23.629 37380 INFO cinder.volume.manager [req-664d84e6-3d86-42fc-a472-c27c8c38d214 - - - - -] Driver post RPC initialization completed successfully.
2016-12-05 10:59:26.754 37380 ERROR oslo.messaging._drivers.impl_rabbit [-] AMQP server on 172.19.85.19:5672 is unreachable: (0, 0): (320) CONNECTION_FORCED - broker forced connection closure with reason 'shutdown'. Trying again in 1 seconds.
2016-12-05 10:59:27.767 37380 ERROR oslo.messaging._drivers.impl_rabbit [-] AMQP server on 172.19.85.19:5672 is unreachable: [Errno 111] ECONNREFUSED. Trying again in 1 seconds.
2016-12-05 10:59:28.779 37380 ERROR oslo.messaging._drivers.impl_rabbit [-] AMQP server on 172.19.85.24:5672 is unreachable: [Errno 111] ECONNREFUSED. Trying again in 1 seconds.
2016-12-05 10:59:29.793 37380 ERROR oslo.messaging._drivers.impl_rabbit [-] AMQP server on 172.19.85.17:5672 is unreachable: [Errno 111] ECONNREFUSED. Trying again in 2 seconds.
2016-12-05 10:59:31.805 37380 ERROR oslo.messaging._drivers.impl_rabbit [-] AMQP server on 172.19.85.19:5672 is unreachable: [Errno 111] ECONNREFUSED. Trying again in 1 seconds.
2016-12-05 10:59:32.819 37380 ERROR oslo.messaging._drivers.impl_rabbit [-] AMQP server on 172.19.85.24:5672 is unreachable: [Errno 111] ECONNREFUSED. Trying again in 1 seconds.
2016-12-05 10:59:33.371 37188 INFO oslo_service.service [req-d8558e3e-d029-4edc-84eb-6e0f5cbd3297 - - - - -] Caught SIGTERM, stopping children
2016-12-05 10:59:33.374 37188 INFO oslo_service.service [req-d8558e3e-d029-4edc-84eb-6e0f5cbd3297 - - - - -] Waiting on 1 children to exit
2016-12-05 10:59:33.380 37188 INFO oslo_service.service [req-d8558e3e-d029-4edc-84eb-6e0f5cbd3297 - - - - -] Child 37380 killed by signal 15
                                                                                                         



