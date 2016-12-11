case- ovs vlan不通 


周五

E9000环境里面, 

2块单板
配置enp4s0f0  网卡,  2层互通没有问题
配置enp4s0f0  网卡.3092,  2层互通没有问题
配置ovs, 然后把enp4s0f0  网卡加入, 新建fake bridge , set tag 3092 , ping不通. 

定位:

一块单板A 配置 enp4s0f0.3092, 另外一块配置ovs, 在A上发现ovs单板arp request 广播包发出来了,也是带vlan的, 为何就是不回应arp response 报文?  

后来zhaoli 重新配置交换板之后就通了. 
