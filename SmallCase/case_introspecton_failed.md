# case 1  dhcp 获取不到ip地址  
 

dhclient enp4s0f0 发现收到DHCPOFFER报文了, 但获取不到IP地址, 把iptables关掉之后ok. 


# case_introspecton时有一个节点失败 


[stack@director ~]$  openstack baremetal introspection bulk start
Setting nodes for introspection to manageable...
Starting introspection of node: 9806f252-c73d-4dd2-a971-f9574c142e1c
Starting introspection of node: af15efd3-b847-4d1e-8168-20239aaea414
Starting introspection of node: 62488472-c362-4c22-a83b-86b79ceadea8
Starting introspection of node: 7fcc66ad-3293-4440-aa74-2ea2f3a99a1d
Starting introspection of node: c708adf0-78df-4e09-865e-8d5948b7c94c
Starting introspection of node: fc527cd3-fafa-4b4f-849f-585f96622c86
Starting introspection of node: 5d5481c9-c888-4dad-bc15-a22f18ba5540
Starting introspection of node: da986dc1-7c15-466d-91e2-b2c805fa0681
Starting introspection of node: 414dbfd7-777f-45a1-a798-d991076e721e
Waiting for introspection to finish...
Introspection for UUID 9806f252-c73d-4dd2-a971-f9574c142e1c finished successfully.
Introspection for UUID 62488472-c362-4c22-a83b-86b79ceadea8 finished with error: Preprocessing hook validate_interfaces: No suitable interfaces found in {u'enp129s0f2': {'ip': None, 'mac': u'e0:97:96:14:61:05'}, u'enp129s0f3': {'ip': u'172.23.85.103', 'mac': u'e0:97:96:14:61:06'}, u'enp129s0f0': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b5'}, u'enp129s0f1': {'ip': None, 'mac': u'e0:97:96:14:61:04'}, u'enp7s0f1': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b8'}, u'enp7s0f0': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b7'}, u'enp4s0f0': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b5'}, u'enp4s0f1': {'ip': u'172.23.85.102', 'mac': u'7c:a2:3e:e4:69:b6'}}
Introspection for UUID af15efd3-b847-4d1e-8168-20239aaea414 finished successfully.
Introspection for UUID 7fcc66ad-3293-4440-aa74-2ea2f3a99a1d finished successfully.
Introspection for UUID fc527cd3-fafa-4b4f-849f-585f96622c86 finished successfully.
Introspection for UUID c708adf0-78df-4e09-865e-8d5948b7c94c finished successfully.
Introspection for UUID 5d5481c9-c888-4dad-bc15-a22f18ba5540 finished successfully.
Introspection for UUID da986dc1-7c15-466d-91e2-b2c805fa0681 finished successfully.
Introspection for UUID 414dbfd7-777f-45a1-a798-d991076e721e finished successfully.
Setting manageable nodes to available...
Node 9806f252-c73d-4dd2-a971-f9574c142e1c has been set to available.
Node af15efd3-b847-4d1e-8168-20239aaea414 has been set to available.
Node 7fcc66ad-3293-4440-aa74-2ea2f3a99a1d has been set to available.
Node c708adf0-78df-4e09-865e-8d5948b7c94c has been set to available.
Node fc527cd3-fafa-4b4f-849f-585f96622c86 has been set to available.
Node 5d5481c9-c888-4dad-bc15-a22f18ba5540 has been set to available.
Node da986dc1-7c15-466d-91e2-b2c805fa0681 has been set to available.
Node 414dbfd7-777f-45a1-a798-d991076e721e has been set to available.
Introspection completed with errors:
62488472-c362-4c22-a83b-86b79ceadea8: Preprocessing hook validate_interfaces: No suitable interfaces found in {u'enp129s0f2': {'ip': None, 'mac': u'e0:97:96:14:61:05'}, u'enp129s0f3': {'ip': u'172.23.85.103', 'mac': u'e0:97:96:14:61:06'}, u'enp129s0f0': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b5'}, u'enp129s0f1': {'ip': None, 'mac': u'e0:97:96:14:61:04'}, u'enp7s0f1': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b8'}, u'enp7s0f0': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b7'}, u'enp4s0f0': {'ip': None, 'mac': u'7c:a2:3e:e4:69:b5'}, u'enp4s0f1': {'ip': u'172.23.85.102', 'mac': u'7c:a2:3e:e4:69:b6'}}

[stack@director ~]$ ironic node-port-list 62488472-c362-4c22-a83b-86b79ceadea8
+--------------------------------------+-------------------+
| UUID                                 | Address           |
+--------------------------------------+-------------------+
| 1972b5f4-1b6f-426e-881c-14404b1aecbc | 7c:a2:3e:e4:69:b5 |
+--------------------------------------+-------------------+

## Solution 
for a in `ironic node-list | grep -v "+"  | grep "-" | awk '{print $2}'`
do 
   ironic  node-set-maintenance  $a false
done 


再来一次就成功了. 





