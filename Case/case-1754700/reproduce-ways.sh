#!/bin/bash


for ((i=1; i<2; i++))
do
    cinder create --name test-$i  120
    
    while [ !`cinder show test-$i | awk '{print $2,$4}' | grep "^status" | grep available ` ] 
    do 
       sleep 5 
    done       

    nova boot --image rhel7.3 --flavor m1.small --nic net-id=8b982c9e-8a24-4091-a53a-fb8d673f798b  test-$i

done
