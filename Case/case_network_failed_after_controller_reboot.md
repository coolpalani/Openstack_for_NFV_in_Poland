# Issue 

 Network is down after Controller node reboot 



# Solution 


[root@slot5 ~]# ip r
default via 172.23.85.1 dev vlan4004 
169.254.169.254 via 172.23.85.106 dev br-ex 
172.19.85.0/24 dev vlan3090  proto kernel  scope link  src 172.19.85.19 
172.20.85.0/24 dev vlan3091  proto kernel  scope link  src 172.20.85.18 
172.21.85.0/24 dev vlan3093  proto kernel  scope link  src 172.21.85.13 
172.22.85.0/24 dev vlan3094  proto kernel  scope link  src 172.22.85.17 
172.23.85.0/26 dev vlan4004  proto kernel  scope link  src 172.23.85.13 
172.23.85.64/26 dev br-ex  proto kernel  scope link  src 172.23.85.92 
[root@slot5 ~]# ping 172.21.85.12
PING 172.21.85.12 (172.21.85.12) 56(84) bytes of data.
64 bytes from 172.21.85.12: icmp_seq=1 ttl=64 time=0.094 ms
64 bytes from 172.21.85.12: icmp_seq=2 ttl=64 time=0.109 ms
^C
--- 172.21.85.12 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 999ms
rtt min/avg/max/mdev = 0.094/0.101/0.109/0.012 ms
[root@slot5 ~]# systemctl disable NetworkManager
Removed symlink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/NetworkManager.service.
[root@slot5 ~]# 


systemctl disable NetworkManager
systemctl stop NetworkManager
/etc/init.d/network restart 




