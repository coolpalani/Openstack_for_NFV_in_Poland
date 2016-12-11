

```sh 
 
ironic node-update cf3e00f0-c30b-4350-a4cf-5d4002de6c85 replace properties/capabilities='node:compute-4,profile:compute,boot_option:local'
ironic node-update a5150cf1-d742-4787-a573-099fd57dc55d replace properties/capabilities='node:compute-5,profile:compute,boot_option:local'
ironic node-update cce50854-3ce0-4926-9878-1ce32a04f5f9 replace properties/capabilities='node:compute-6,profile:compute,boot_option:local'
ironic node-update d8df3f50-677d-4ca2-869c-3eb96edc602b replace properties/capabilities='node:compute-7,profile:compute,boot_option:local'
ironic node-update 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5 replace properties/capabilities='node:compute-8,profile:compute,boot_option:local'



        
list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do    
    ironic  node-set-power-state  $a    reboot
done 




  #ironic  node-delete $a 
    ironic  node-set-boot-device  $a    pxe 


 ironic  node-set-maintenance  1cf822cf-8729-4245-82fa-46435b064d88   false
 
 
 
 

 
 
 [stack@director ~]$ ironic port-list
+--------------------------------------+-------------------+
| UUID                                 | Address           |
+--------------------------------------+-------------------+
| c09244d6-093b-40a1-8ab2-ca6ebfce1870 | 7c:a2:3e:ee:88:61 |
| 945f111f-0f3a-453a-85a0-b60fda7a6e55 | 7c:a2:3e:ee:88:75 |
| 8a0de256-4345-4bb4-a365-4bafe098b88d | 7c:a2:3e:e4:69:b5 |
| 461bf969-93b7-474e-8cf3-4ccc1b292dac | 7c:a2:3e:ee:88:7d |
| 8a0c0c09-8fef-4693-a394-569109c990e8 | 7c:a2:3e:e4:69:dd |
| 01bad1c3-ee8d-4189-9ac1-0990d53357ec | 7c:a2:3e:e4:69:e9 |
| 30b7f5d6-0393-45a6-bfd3-734abfada725 | 7c:a2:3e:ee:88:8d |
| bdd951e2-efda-40a5-899a-0503cd095147 | 7c:a2:3e:ee:88:79 |
| edaa9419-2dbe-4658-a18a-5f56713e76ac | 7c:a2:3e:e4:69:b1 |
| 7478b32a-524d-4d2e-8d43-5e2a69efba02 | 7c:a2:3e:ee:88:99 |
| 70ff0532-5fe6-4789-abe1-b5b5e777cdd2 | bc:62:0e:20:7a:17 |
| cef955c2-6e9a-43ff-bfad-cbb22bc9265f | 7c:a2:3e:ee:88:55 |
+--------------------------------------+-------------------+
[stack@director ~]$ openstack baremetal introspection bulk start
Setting nodes for introspection to manageable...
Starting introspection of node: 1e2b1f64-ccca-4f39-b93d-1ea509b1867b
Starting introspection of node: 755a46c9-7b17-43b6-a9c4-8ada4dee5f05
Starting introspection of node: 233de437-9c26-4d20-916c-9492eea0828c
Starting introspection of node: 3b2eb8af-0729-40fe-80b9-fce97d978135
Starting introspection of node: abc1b4a4-a837-49d7-a47f-d494abc18a77
Starting introspection of node: bb3b2e64-fa73-4cfb-b631-8de845459014
Starting introspection of node: 3448cdf2-9d1b-4561-97e4-f2be1ae15e95
Starting introspection of node: cf3e00f0-c30b-4350-a4cf-5d4002de6c85
Starting introspection of node: a5150cf1-d742-4787-a573-099fd57dc55d
Starting introspection of node: cce50854-3ce0-4926-9878-1ce32a04f5f9
Starting introspection of node: d8df3f50-677d-4ca2-869c-3eb96edc602b
Starting introspection of node: 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5
Waiting for introspection to finish...
Introspection for UUID 1e2b1f64-ccca-4f39-b93d-1ea509b1867b finished successfully.
Introspection for UUID 233de437-9c26-4d20-916c-9492eea0828c finished successfully.
Introspection for UUID 755a46c9-7b17-43b6-a9c4-8ada4dee5f05 finished successfully.
Introspection for UUID 3b2eb8af-0729-40fe-80b9-fce97d978135 finished successfully.
Introspection for UUID abc1b4a4-a837-49d7-a47f-d494abc18a77 finished successfully.
Introspection for UUID 3448cdf2-9d1b-4561-97e4-f2be1ae15e95 finished successfully.
Introspection for UUID bb3b2e64-fa73-4cfb-b631-8de845459014 finished successfully.
Introspection for UUID a5150cf1-d742-4787-a573-099fd57dc55d finished successfully.
Introspection for UUID cf3e00f0-c30b-4350-a4cf-5d4002de6c85 finished successfully.
Introspection for UUID 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5 finished successfully.
Introspection for UUID cce50854-3ce0-4926-9878-1ce32a04f5f9 finished successfully.





^CTraceback (most recent call last):
  File "/bin/openstack", line 10, in <module>
    sys.exit(main())
  File "/usr/lib/python2.7/site-packages/openstackclient/shell.py", line 441, in main
    return OpenStackShell().run(argv)
  File "/usr/lib/python2.7/site-packages/openstackclient/shell.py", line 118, in run
    ret_val = super(OpenStackShell, self).run(argv)
  File "/usr/lib/python2.7/site-packages/cliff/app.py", line 226, in run
    result = self.run_subcommand(remainder)
  File "/usr/lib/python2.7/site-packages/openstackclient/shell.py", line 153, in run_subcommand
    ret_value = super(OpenStackShell, self).run_subcommand(argv)
  File "/usr/lib/python2.7/site-packages/cliff/app.py", line 346, in run_subcommand
    result = cmd.run(parsed_args)
  File "/usr/lib/python2.7/site-packages/cliff/command.py", line 55, in run
    self.take_action(parsed_args)
  File "/usr/lib/python2.7/site-packages/tripleoclient/v1/baremetal.py", line 229, in take_action
    inspector_client, node_uuids):
  File "/usr/lib/python2.7/site-packages/tripleoclient/utils.py", line 402, in wait_for_node_introspection
    time.sleep(sleep)
KeyboardInterrupt
[stack@director ~]$ 
[stack@director ~]$ 
[stack@director ~]$ openstack baremetal introspection bulk status
+--------------------------------------+----------+-------+
| Node UUID                            | Finished | Error |
+--------------------------------------+----------+-------+
| 1e2b1f64-ccca-4f39-b93d-1ea509b1867b | True     | None  |
| 755a46c9-7b17-43b6-a9c4-8ada4dee5f05 | True     | None  |
| 233de437-9c26-4d20-916c-9492eea0828c | True     | None  |
| 3b2eb8af-0729-40fe-80b9-fce97d978135 | True     | None  |
| abc1b4a4-a837-49d7-a47f-d494abc18a77 | True     | None  |
| bb3b2e64-fa73-4cfb-b631-8de845459014 | True     | None  |
| 3448cdf2-9d1b-4561-97e4-f2be1ae15e95 | True     | None  |
| cf3e00f0-c30b-4350-a4cf-5d4002de6c85 | True     | None  |
| a5150cf1-d742-4787-a573-099fd57dc55d | True     | None  |
| cce50854-3ce0-4926-9878-1ce32a04f5f9 | True     | None  |
| d8df3f50-677d-4ca2-869c-3eb96edc602b | False    | None  |
| 4b6a236e-3d29-4eed-8e5f-1e8caf50bdc5 | True     | None  |
+--------------------------------------+----------+-------+



 








```


# abc 



	
