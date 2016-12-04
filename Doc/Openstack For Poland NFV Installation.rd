***Openstack For Poland NFV Installation***



list=`ironic node-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
  ironic  node-delete $a 
 # ironic     node-set-maintenance $a   True 
 #  ironic     node-set-boot-device  $a    pxe 
 #  ironic  node-set-power-state  $a    on
done 





[stack@director ~]$ ironic node-list
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+
| 70188fee-70f9-4297-a902-aca9e8d71723 | None | None          | power off   | available          | False       |
| dc7caa84-e0e2-4df5-b6b5-7838906a3a2a | None | None          | power off   | available          | False       |
+--------------------------------------+------+---------------+-------------+--------------------+-------------+

ironic node-update  70188fee-70f9-4297-a902-aca9e8d71723  replace properties/capabilities='profile:control,boot_option:local'

ironic node-update  dc7caa84-e0e2-4df5-b6b5-7838906a3a2a replace properties/capabilities='profile:compute,boot_option:local'
