#!/bin/bash

# Permit root login over SSH
sed -i 's/.*ssh-rsa/ssh-rsa/' /root/.ssh/authorized_keys
sed -i 's/PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config

systemctl restart sshd



# Update the root password to something we know
echo redhat | sudo passwd root --stdin

if $(hostnamectl |grep host | grep -q ceph) 
then 
 echo "parted gpt...">> /tmp/gpt.label
 dd if=/dev/zero of=/dev/sdb bs=1M count=1 
 parted /dev/sdb mklabel gpt
fi 

