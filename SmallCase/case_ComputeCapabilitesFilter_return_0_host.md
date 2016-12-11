

## Symptom

```sh 

nova boot  --image rhel7.3 --flavor CSM_flavor  --nic net-id=9d5a40b5-d4cc-4efb-9ec2-ece25dcfc0a9 t5


[root@slot5 nova]# nova flavor-list
+--------------------------------------+------------+-----------+------+-----------+------+-------+-------------+-----------+
| ID                                   | Name       | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public |
+--------------------------------------+------------+-----------+------+-----------+------+-------+-------------+-----------+
| 1                                    | m1.tiny    | 512       | 1    | 0         |      | 1     | 1.0         | True      |
| 2                                    | m1.small   | 2048      | 20   | 0         |      | 1     | 1.0         | True      |
| 3                                    | m1.medium  | 4096      | 40   | 0         |      | 2     | 1.0         | True      |
| 4                                    | m1.large   | 8192      | 80   | 0         |      | 4     | 1.0         | True      |
| 5                                    | m1.xlarge  | 16384     | 160  | 0         |      | 8     | 1.0         | True      |
| 5cb6045f-526b-46f7-b47f-ed3e81718ad9 | CSM_flavor | 24576     | 110  | 512       |      | 6     | 1.0         | True      |
+--------------------------------------+------------+-----------+------+-----------+------+-------+-------------+-----------+




[root@slot5 nova]# nova list
+--------------------------------------+------+--------+------------+-------------+----------------------+
| ID                                   | Name | Status | Task State | Power State | Networks             |
+--------------------------------------+------+--------+------------+-------------+----------------------+
| cef035f9-441c-4673-bad3-240ad940e62c | t1   | ACTIVE | -          | Running     | private=192.168.55.5 |
| d9ed2d58-0252-41cc-9243-273b124cbca8 | t2   | ACTIVE | -          | Running     | private=192.168.55.6 |
| 1be338de-0397-479c-999e-5a021f3d6566 | t5   | ERROR  | -          | NOSTATE     |                      |
+--------------------------------------+------+--------+------------+-------------+----------------------+


[root@slot5 nova]# cinder service-list
+------------------+-------------------------+------+---------+-------+----------------------------+-----------------+
|      Binary      |           Host          | Zone |  Status | State |         Updated_at         | Disabled Reason |
+------------------+-------------------------+------+---------+-------+----------------------------+-----------------+
| cinder-scheduler |        hostgroup        | nova | enabled |  down | 2016-12-05T10:03:42.000000 |        -        |
| cinder-scheduler |        hostgroup        | nova | enabled |   up  | 2016-12-05T15:39:46.000000 |        -        |
|  cinder-volume   |     hostgroup@ipsan     | nova | enabled |   up  | 2016-12-05T15:39:44.000000 |        -        |
|  cinder-volume   | hostgroup@tripleo_iscsi | nova | enabled |  down | 2016-12-05T12:33:06.000000 |        -        |
+------------------+-------------------------+------+---------+-------+----------------------------+-----------------+
[root@slot5 nova]# 





in nova-scheduler.log 

2016-12-05 15:56:49.900 20691 INFO nova.filters [req-64944213-9771-409d-8d10-05cb66672be6 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Filter ComputeCapabilitiesFilter returned 0 hosts
2016-12-05 15:56:49.901 20691 INFO nova.filters [req-64944213-9771-409d-8d10-05cb66672be6 3c446ce467ce437bbe12b224adac4a27 fe50aad050494868a67d8d05d5313869 - - -] Filtering removed all hosts for the request with instance ID '26cd8858-d055-40d2-8288-2e342c5efa3c'. Filter results: ['RetryFilter: (start: 9, end: 9)', 'AvailabilityZoneFilter: (start: 9, end: 1)', 'RamFilter: (start: 1, end: 1)', 'ComputeFilter: (start: 1, end: 1)', 'ComputeCapabilitiesFilter: (start: 1, end: 0)']
2016-12-05 15:57:21.791 20691 INFO nova.scheduler.host_manager [req-89f3d459-6f4b-4151-94e7-03b55b98f413 - - - - -] Successfully synced instances from host 'slot10.vepc.mnc066.mcc260.3gppnetwork.org'.

```


## Solution


Ephemeral  should be 0 



