- title: case_always_have_one_blade_pxe_failed_when_introspection_or_deployment 
- date: 2016-12-03  
- categories: case
- tags: [pxe,deploy,introspection] 
- description: 


--------------- 
--------------- 

# Symptom

we found there is always one or two or three blade which failed to boot from pxe because it can't get ip address from Director.
It is happened when do introspection or deploy , the issue is randomly happened on all slots. 



# Workaround

we will need to do the following 2 steps.

1. enlarge dhcp range when introspection 

1)edit /etc/ironic-inspector/dnsmasq.conf, then 

modify the line
> dhcp-range=172.23.85.85,172.23.85.104,29

to 
> dhcp-range=172.23.85.85,172.23.85.125,29

2)restart the process of  dhcp server 

```bash 
[root@director build_ssh]# ps  aux | grep dnsma
root      16794  0.0  0.0 112648   960 pts/5    S+   10:47   0:00 grep --color=auto dnsma
nobody   163391  0.0  0.0  15520   660 ?        S    03:14   0:00 /sbin/dnsmasq --conf-file=/etc/ironic-inspector/dnsmasq.conf
nobody   170008  0.0  0.0  15548  1036 ?        S    03:38   0:00 dnsmasq --no-hosts --no-resolv --strict-order --except-interface=lo --pid-file=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/pid --dhcp-hostsfile=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/host --addn-hosts=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/addn_hosts --dhcp-optsfile=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/opts --dhcp-leasefile=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/leases --dhcp-match=set:ipxe,175 --bind-interfaces --interface=tap82122d79-c3 --dhcp-range=set:tag0,172.23.85.64,static,86400s --dhcp-option-force=option:mtu,1500 --dhcp-lease-max=64 --conf-file=/etc/dnsmasq-ironic.conf


kill -9 163391 ;  /sbin/dnsmasq --conf-file=/etc/ironic-inspector/dnsmasq.conf

```

2. enlarge dhcp range when introspection 
 
```bash
 neutron net-delete ctlplane 
 
 neutron net-create --provider:network_type flat --provider:physical_network ctlplane  ctlplane 
  
 neutron subnet-create   --allocation-pool start=172.23.85.85,end=172.23.85.125  ctlplane 172.23.85.64/26 

#old configuration as following:

[root@director ~]# neutron subnet-show 850a55bf-8dd3-408a-a06c-7c0f727499e4
+-------------------+---------------------------------------------------+
| Field             | Value                                             |
+-------------------+---------------------------------------------------+
| allocation_pools  | {"start": "172.23.85.85", "end": "172.23.85.104"} |
| cidr              | 172.23.85.64/26                                   |
| created_at        | 2016-11-29T20:02:26                               |
| description       |                                                   |
| dns_nameservers   |                                                   |
| enable_dhcp       | True                                              |
| gateway_ip        | 172.23.85.65                                      |
| host_routes       |                                                   |
| id                | 850a55bf-8dd3-408a-a06c-7c0f727499e4              |
| ip_version        | 4                                                 |
| ipv6_address_mode |                                                   |
| ipv6_ra_mode      |                                                   |
| name              |                                                   |
| network_id        | 03c4a216-1778-4339-8549-9034f5a6f4da              |
| subnetpool_id     |                                                   |
| tenant_id         | 8e4077b6129941779c125dd763c63f4f                  |
| updated_at        | 2016-11-29T20:02:26                               |
+-------------------+---------------------------------------------------+
[root@director ~]# neutron net-show ctlplane 
+---------------------------+--------------------------------------+
| Field                     | Value                                |
+---------------------------+--------------------------------------+
| admin_state_up            | True                                 |
| availability_zone_hints   |                                      |
| availability_zones        | nova                                 |
| created_at                | 2016-11-29T19:57:13                  |
| description               |                                      |
| id                        | 03c4a216-1778-4339-8549-9034f5a6f4da |
| ipv4_address_scope        |                                      |
| ipv6_address_scope        |                                      |
| mtu                       | 1500                                 |
| name                      | ctlplane                             |
| provider:network_type     | flat                                 |
| provider:physical_network | ctlplane                             |
| provider:segmentation_id  |                                      |
| router:external           | False                                |
| shared                    | False                                |
| status                    | ACTIVE                               |
| subnets                   | 850a55bf-8dd3-408a-a06c-7c0f727499e4 |
| tags                      |                                      |
| tenant_id                 | 8e4077b6129941779c125dd763c63f4f     |
| updated_at                | 2016-11-29T19:57:13                  |
+---------------------------+--------------------------------------+



 
```



# Principle 

```bash 
[root@director build_ssh]# ps  aux | grep dnsma
root      16794  0.0  0.0 112648   960 pts/5    S+   10:47   0:00 grep --color=auto dnsma
nobody   163391  0.0  0.0  15520   660 ?        S    03:14   0:00 /sbin/dnsmasq --conf-file=/etc/ironic-inspector/dnsmasq.conf
nobody   170008  0.0  0.0  15548  1036 ?        S    03:38   0:00 dnsmasq --no-hosts --no-resolv --strict-order --except-interface=lo --pid-file=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/pid --dhcp-hostsfile=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/host --addn-hosts=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/addn_hosts --dhcp-optsfile=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/opts --dhcp-leasefile=/var/lib/neutron/dhcp/39386a1e-53f2-4a2e-9664-660db3613657/leases --dhcp-match=set:ipxe,175 --bind-interfaces --interface=tap82122d79-c3 --dhcp-range=set:tag0,172.23.85.64,static,86400s --dhcp-option-force=option:mtu,1500 --dhcp-lease-max=64 --conf-file=/etc/dnsmasq-ironic.conf

```


when doing introspection, Director is using pid 163391 as dhcp server 

when runing deployment ,  Director is using pid 170008 as dhcp server 



# Root cause 

I found it is easily caused the issue when dhcp IP address range is small,I need to report one case to Redhat support for genuine root cause. 
I advise we configure two times of blade number IP addresses when pxe booting.



 

 
 