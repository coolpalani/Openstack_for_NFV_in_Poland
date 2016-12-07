list=`nova list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
    nova delete  $a 
done 

list=`neutron port-list | grep -v "+" | grep "-"  | awk '{print $2}' `
for a  in $list 
do 
    neutron port-delete  $a 
done 

list=`neutron net-list | grep -v "+" | grep -v  ctlplane| grep "-"  | awk '{print $2}' `
for a  in $list 
do 
    neutron net-delete  $a 
done 


mysql < reset-instance.sql
