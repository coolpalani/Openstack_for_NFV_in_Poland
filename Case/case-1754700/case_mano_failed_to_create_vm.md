# Case mano boot vm failed 

[Redhat Case](https://access.redhat.com/support/cases/#/case/01754700)


## Symptom 



```sh

2016-12-08 14:54:22.487 30085 DEBUG nova.osapi_compute.wsgi.server [req-9d43f5eb-ae9c-42f8-a997-8cf3f8d321fe - - - - -] (30085) accepted ('172.19.85.19', 43496) server /usr/lib/python2.7/site-packages/eventlet/wsgi.py:826
2016-12-08 14:54:22.496 30085 DEBUG nova.api.openstack.wsgi [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Action: 'create', calling method: <bound method ServersController.create of <nova.api.openstack.compute.servers.ServersController object at 0x7a60e10>>, body: {"server": {"name": "vOSMU_VNF_NAME_vOSMU_0", "flavorRef": "60402618-8487-49a4-ab3f-b6bab3a372b5" , "block_device_mapping_v2": [{"source_type" : "volume", "destination_type" : "volume", "boot_index" : "0", "uuid" : "838c5d54-ec86-4326-a463-d2df92faae57", "disk_bus" : "virtio", "delete_on_termination" : "false"}], "networks": [{"port": "82c9f114-93ab-4367-8341-da27f2d5ebb4","vnic_type":"normal","mac_address":"fa:16:3e:4e:fc:8a"},{"port": "370a4faa-b48c-488d-a832-580db05d5ff0","vnic_type":"normal","mac_address":"fa:16:3e:30:40:17"}], "metadata":{"__bootDev":"hd,network","__instance_vwatchdog":"true","__loading_update_driver_image":"enable","_ha_policy_type":"remote_rebuild"}, "personality": [{"path": "/mnt/openstack/content/vm_init_para.ini", "contents": "W3ZtX2Jhc2VfcGFyYV0KSVNDT05UUk9MTk9ERSA9IHRydWUKSE9TVE5BTUUgPSB2T1NNVQpOT0RFTkFNRSA9IHZPU01VClZORl9JRCA9IDM0NjAzMTA1CkxBTkdVQUdFID0gZW4uVVRGLTgKSEFSRFdBUkVfVFlQRSA9IENsb3VkQ29yZQpWTkZNX0lQID0gMTcyLjIzLjg1LjE2MgpWTkZNX1VTRVJOQU1FID0gbWFub2FkbWluClZORk1fUEFTU1dEID0gMDAwMTAwMjBFODhENEY4OTVEQjEwMzY5REU1MkJCMDJGREZGMzg5MURCMTMzREIzREI4RThBQkNFM0I1ODZEMDdEODdBODdCClZORk1fUE9SVCA9IDMwMDAwClZORk1fQ0lQSEVSX0ZMQUcgPSAxClZORk1fRlRQX1NFUlZFUl9JUCA9IDE3Mi4yMy44NS4xNjIKVk5GTV9GVFBfVVNFUk5BTUUgPSBuZWZ0cHVzZXIKVk5GTV9GVFBfUEFTU1dEID0gMDAwMTAwMjAxRkZBOTk3NzA1N0Q3RjBGRTA4QzA5MjNFMzZEMjI3MUU4RjUwQURFNjNENjA4NkU1MUYzMUY5MzU0N0MwMzkyMTAxNzZFRjZCNDMxRDI1NDlBN0EwNzVBQTU2NzIwRjAKVk5GTV9GVFBfUEFUSCA9IC9zb2Z0cGtnClZORk1fRlRQX1BPUlQgPSAyMjIyCklQX0NPVU5UID0gMgpOSUNfREVWSUNFXzAgPSBldGgwCklQQUREUl8wID0gMTAuMTAuMTAuOApORVRNQVNLXzAgPSAyNTUuMjU1LjI1NS4wCk5JQ19ERVZJQ0VfMSA9IGV0aDEKSVBBRERSXzEgPSAxNzIuMjMuODUuMTYzCk5FVE1BU0tfMSA9IDI1NS4yNTUuMjU1LjI0MApST1VURV9DT1VOVCA9IDEKR0FURVdBWV9JUF8wID0gMTcyLjIzLjg1LjE2MQpBQ1RJT05fVFlQRV8wID0gYWRkCkRFU1RJTkFUSU9OX0lQXzAgPSBkZWZhdWx0CkRFU1RORVRNQVNLXzAgPSAwLjAuMC4wCklOVEVSRkFDRV8wID0gZXRoMQo="}, {"path": "/mnt/openstack/content/vm_init_para_ext.ini", "contents": "W3ZtX2V4dF9wYXJhXQpWTkZNX1BBU1NXRF9LRVkgPSAwMjRCRUYxMEQ4NjdEQkRDMzAxMzhDQTJFNDA4NTQ5NkQwOUY3MDExNTEwMkREMzRCQjc3MUNEQzlFODQ0QTAzCkZUUF9QQVNTV0RfS0VZID0gNUU2QTVERjk5QUZBOEJEQ0ZBMzM0Qzg2RUE3QTI4MUQ3OTExRjMyRDdCRTMxNTdCRjMxQTVBMjhENDZDMzE5QQpWT1NNVV9PU1NBRE1fUEFTU1dEX0tFWSA9Cg=="}], "config_drive" : "true"}, "os:scheduler_hints": {"numaOpts":0, "aggregate_instance_extra_specs":"true","hyperThreadAffinity": "any","vcpuAffinity": ["0","0"],"evsOpts": 0}} _process_stack /usr/lib/python2.7/site-packages/nova/api/openstack/wsgi.py:696



2016-12-08 14:54:22.589 30085 DEBUG nova.api.openstack.compute.servers [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Running _create_extension_point for <Extension: name=BlockDeviceMappingV1, alias=os-block-device-mapping-v1, version=1> _create_extension_point /usr/lib/python2.7/site-packages/nova/api/openstack/compute/servers.py:724

nova-api.log:32241:2016-12-08 14:54:22.589 30085 DEBUG nova.api.openstack.compute.servers [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Running _create_extension_point for <Extension: name=BlockDeviceMappingV1, alias=os-block-device-mapping-v1, version=1> _create_extension_point /usr/lib/python2.7/site-packages/nova/api/openstack/compute/servers.py:724
nova-api.log:32242:2016-12-08 14:54:22.589 30085 DEBUG nova.api.openstack.compute.servers [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Running _create_extension_point for <Extension: name=SecurityGroups, alias=os-security-groups, version=1> _create_extension_point /usr/lib/python2.7/site-packages/nova/api/openstack/compute/servers.py:724
nova-api.log:32243:2016-12-08 14:54:22.589 30085 DEBUG nova.api.openstack.compute.servers [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Running _create_extension_point for <Extension: name=SchedulerHints, alias=os-scheduler-hints, version=1> _create_extension_point /usr/lib/python2.7/site-packages/nova/api/openstack/compute/servers.py:724
nova-api.log:32244:2016-12-08 14:54:22.604 30085 INFO nova.api.openstack.wsgi [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] HTTP exception thrown: Block Device Mapping is Invalid: failed to get volume 838c5d54-ec86-4326-a463-d2df92faae57.
nova-api.log:32245:2016-12-08 14:54:22.605 30085 DEBUG nova.api.openstack.wsgi [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Returning 400 to user: Block Device Mapping is Invalid: failed to get volume 838c5d54-ec86-4326-a463-d2df92faae57. __call__ /usr/lib/python2.7/site-packages/nova/api/openstack/wsgi.py:1070
nova-api.log:32246:2016-12-08 14:54:22.606 30085 INFO nova.osapi_compute.wsgi.server [req-dbf75ad6-257d-4adf-bcb3-9bf8ad47e369 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] 172.19.85.19 "POST /v2/fe50aad050494868a67d8d05d5313869/servers HTTP/1.1" status: 400 len: 332 time: 0.1174741



[root@slot7 site-packages]# cd nova
[root@slot7 nova]# grep InvalidBDMVolume * -irn 
api/openstack/compute/servers.py:676:                exception.InvalidBDMVolume,
api/openstack/compute/servers.py:680:                exception.InvalidBDMVolumeNotBootable,
Binary file api/openstack/compute/servers.pyc matches
Binary file api/openstack/compute/servers.pyo matches
Binary file compute/api.pyo matches
compute/api.py:1079:                    raise exception.InvalidBDMVolume(id=volume_id)
compute/api.py:1082:                    raise exception.InvalidBDMVolumeNotBootable(id=volume_id)
compute/api.py:1315:                    raise exception.InvalidBDMVolume(id=volume_id)
Binary file compute/api.pyc matches
exception.py:242:class InvalidBDMVolume(InvalidBDM):
exception.py:289:class InvalidBDMVolumeNotBootable(InvalidBDM):
Binary file exception.pyc matches
Binary file exception.pyo matches
[root@slot7 nova]# vim api/openstack/compute/servers.py +676
[root@slot7 nova]# vim compute/api.py +1079 
[root@slot7 nova]# pcs cluster stop 
Stopping Cluster (pacemaker)...



```

## Analysis and try to reproduce via a script

```python
_validate_bdm->

```


nova-api.log:10742:2016-12-09 00:24:49.123 33540 INFO nova.api.openstack.wsgi [req-66eff156-c76d-45e0-95f3-a570be7d98b2 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] HTTP exception thrown: Block Device Mapping is Invalid: failed to get volume a7bceb56-bb51-4167-b38a-1900b38f2d8d.
nova-api.log:10809:2016-12-09 02:39:16.485 33550 INFO nova.api.openstack.wsgi [req-05182284-7382-4dbd-99d2-25419ac8154f 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] HTTP exception thrown: Block Device Mapping is Invalid: failed to get volume 7b8356bc-83ad-487e-b94c-823cf1682b1d.



api.log:34138:2016-12-09 02:39:16.722 4035 INFO cinder.api.v2.volumes [req-1c5b5ae1-1067-4dfe-9600-7d241155e747 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Delete volume with id: 7b8356bc-83ad-487e-b94c-823cf1682b1d


```bash
#!/bin/bash
name_prefix=maja-

for ((i=1; i<2; i++))
do
    openstack volume create --image 7fa1b3b7-81be-4d2b-8dfb-bb9f3e936364 --size 120 ${name_prefix}$i
   
    echo "No $i." 
    status=0
    while [ $status -eq  0 ]     
    do 
       sleep 3 
       openstack volume show ${name_prefix}$i | awk '{print $2,$4}' | grep "^status" | grep -q -v available
       status=$?
       if [ $status -ne 0 ] 
       then 
           echo "status=${status}," 
           openstack volume show ${name_prefix}$i | awk '{print $2,$4}' | grep "^status" 
       fi 
    done       

    openstack server create --flavor m1.xlarge --volume ${name_prefix}$i --nic net-id=8b982c9e-8a24-4091-a53a-fb8d673f798b ${name_prefix}$i 
    
done

but failed to reproduce the issue by above script.


```

## Huawei's Question

Hi guys:

After I communicated with Huawei , I know their workflow:

1. create a volume 
2. while ( requriry volume is not available)
      sleep 5 second;
3. create a vm which boot from the volume  
4. if failed to create vm , It will rollback and delete the volume. 

now , let's review the whole workflow and timeline.

cinder
9:44:44 cinder received  a request of creating a volume 
9:47:18 cinder volume create successfully

nova
9:47:21 nova api received request of creating vm , 9:47:21 cinder inquiry the volume status , it is reported "available"
9:47:22  nova throw excepthon "block device mapping is invalid" 

9:47:25 it seems that the volume is deleting.

2016-12-09 09:47:25.307 28929 DEBUG oslo_concurrency.lockutils [req-b78f1b25-1bc5-4a2d-93c3-c944f4de28e3 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Lock "f664d170-82ce-4a90-bdd6-2e0e870d968f-delete_volume" acquired by "cinder.volume.manager.lvo_inner2" :: waited 0.001s inner /usr/lib/python2.7/site-packages/oslo_concurrency/lockutils.py:270


Huawei have the following question as following. 

0. why report "Block Device Mapping is Invalid" ? can we know the workflow ? 
2016-12-09 09:47:22.404 14044 INFO nova.api.openstack.wsgi [req-8e88a48e-b593-4e87-b029-cba87a5093e2 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] HTTP exception thrown: Block Device Mapping is Invalid: failed to get volume f664d170-82ce-4a90-bdd6-2e0e870d968f.

1. between 9:47:21 and 9:47:25, cinder didn't received the request which come from nova inquiry volume.
2. "f664d170-82ce-4a90-bdd6-2e0e870d968f-delete_volume", does it truely doing the "delete" operation? If yes,who request "delete" the volume ? 
3. which major steps will the nova server do after it received a request of creating a vm ? 

If we can answer them exactly, Huawei and Redhat will solve the issue asap and go ahead the project,  though it is not caused by Redhat.



# Trouble-shooting  from code
[nova boot from volume]<http://www.cnblogs.com/popsuper1982/p/3828446.html>

```python

    def _get_bdm_image_metadata(self, context, block_device_mapping,
                                legacy_bdm=True):
        """If we are booting from a volume, we need to get the
        volume details from Cinder and make sure we pass the
        metadata back accordingly.
        """
        if not block_device_mapping:
            return {}

        for bdm in block_device_mapping:
            if (legacy_bdm and
                    block_device.get_device_letter(
                       bdm.get('device_name', '')) != 'a'):
                continue
            elif not legacy_bdm and bdm.get('boot_index') != 0:
                continue

            volume_id = bdm.get('volume_id')
            snapshot_id = bdm.get('snapshot_id')
            if snapshot_id:
                # NOTE(alaski): A volume snapshot inherits metadata from the
                # originating volume, but the API does not expose metadata
                # on the snapshot itself.  So we query the volume for it below.
                snapshot = self.volume_api.get_snapshot(context, snapshot_id)
                volume_id = snapshot['volume_id']

            if bdm.get('image_id'):
                try:
                    image_id = bdm['image_id']
                    image_meta = self.image_api.get(context, image_id)
                    return image_meta



            if bdm.get('image_id'):
                try:
                    image_id = bdm['image_id']
                    image_meta = self.image_api.get(context, image_id)
                    return image_meta
                except Exception:
                    raise exception.InvalidBDMImage(id=image_id)
            elif volume_id:
                num_attempts = max(0, 6) + 1
                for attempt in range(1, num_attempts + 1):
                    try:
                        volume = self.volume_api.get(context, volume_id)
                        break
                    except exception.CinderConnectionFailed:
                        raise
                    except Exception as ex:
                        LOG.info(_LI("TTTTTTT _get_bdm_image_metadata %r"),ex)
                        time.sleep(10)
                    if attempt == num_attempts:
                        raise exception.InvalidBDMVolume(id=volume_id)

                if not volume.get('bootable', True):
                    raise exception.InvalidBDMVolumeNotBootable(id=volume_id)

                return utils.get_image_metadata_from_volume(volume)
        return {}


```

Exception ex show : The service catalog is empty

```bash
[root@slot7 nova]# grep _get_bdm_image_metadata  * -irn 
nova-api.log:24124:2016-12-10 01:48:49.063 34507 INFO nova.compute.api [req-ab880dd9-56d6-4982-8685-23dac8b58781 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] TTTTTTT _get_bdm_image_metadata EmptyCatalog('The service catalog is empty.',)
nova-api.log:24125:2016-12-10 01:48:59.070 34507 INFO nova.compute.api [req-ab880dd9-56d6-4982-8685-23dac8b58781 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] TTTTTTT _get_bdm_image_metadata EmptyCatalog('The service catalog is empty.',)
nova-api.log:24126:2016-12-10 01:49:09.080 34507 INFO nova.compute.api [req-ab880dd9-56d6-4982-8685-23dac8b58781 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] TTTTTTT _get_bdm_image_metadata EmptyCatalog('The service catalog is empty.',)

```









## Workaround 

[root@slot5 nova]# openstack project show 2a91aa4eedba4cf28631d6f0afb66e99
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| description | admin tenant                     |
| enabled     | True                             |
| id          | 2a91aa4eedba4cf28631d6f0afb66e99 |
| name        | admin                            |
| properties  |                                  |
+-------------+----------------------------------+



Change "endpoint_template" as following in /etc/nova/nova.conf on every nodes, then restart corresponding services.

[root@slot13 ~]# openstack-config  --get /etc/nova/nova.conf  cinder endpoint_template
http://172.19.85.11:8776/v2/2a91aa4eedba4cf28631d6f0afb66e99

you can run ansible playbook  located in /root/ops/workaround-for-mano-issue on director node.

```bash
[root@director workaround-for-mano-issue]# ansible-playbook   site.yml 
```


