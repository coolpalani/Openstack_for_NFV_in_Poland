2016-12-07 07:32:20.955 29343 DEBUG neutron.plugins.ml2.managers [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] Attempting to bind port 21d9fab1-ada9-4be1-89fe-068c2f818c13 on host slot11.vepc.mnc066.mcc260.3gppnetwork.org at level 0 using segments [{'segmentation_id': 4002, 'physical_network': u'Sriov_Vlan_phynet1', 'id': u'f1c1ce3d-4bca-41b6-8b51-3dff2b6cbd5f', 'network_type': u'vlan'}] _bind_port_level /usr/lib/python2.7/site-packages/neutron/plugins/ml2/managers.py:702
2016-12-07 07:32:20.955 29343 DEBUG neutron.plugins.ml2.drivers.mech_agent [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] Attempting to bind port 21d9fab1-ada9-4be1-89fe-068c2f818c13 on network 31d3864e-506f-4665-98f2-7645844e53ab bind_port /usr/lib/python2.7/site-packages/neutron/plugins/ml2/drivers/mech_agent.py:60
2016-12-07 07:32:20.955 29343 DEBUG neutron.plugins.ml2.drivers.mech_agent [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] Refusing to bind due to unsupported vnic_type: direct bind_port /usr/lib/python2.7/site-packages/neutron/plugins/ml2/drivers/mech_agent.py:65
2016-12-07 07:32:20.955 29343 DEBUG neutron.plugins.ml2.drivers.mech_sriov.mech_driver.mech_driver [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] Attempting to bind port 21d9fab1-ada9-4be1-89fe-068c2f818c13 on network 31d3864e-506f-4665-98f2-7645844e53ab bind_port /usr/lib/python2.7/site-packages/neutron/plugins/ml2/drivers/mech_sriov/mech_driver/mech_driver.py:98
2016-12-07 07:32:20.958 29343 ERROR neutron.plugins.ml2.managers [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] Failed to bind port 21d9fab1-ada9-4be1-89fe-068c2f818c13 on host slot11.vepc.mnc066.mcc260.3gppnetwork.org for vnic_type direct using segments [{'segmentation_id': 4002, 'physical_network': u'Sriov_Vlan_phynet1', 'id': u'f1c1ce3d-4bca-41b6-8b51-3dff2b6cbd5f', 'network_type': u'vlan'}]
2016-12-07 07:32:20.966 29343 DEBUG neutron.plugins.ml2.db [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] For port 21d9fab1-ada9-4be1-89fe-068c2f818c13, host slot11.vepc.mnc066.mcc260.3gppnetwork.org, cleared binding levels clear_binding_levels /usr/lib/python2.7/site-packages/neutron/plugins/ml2/db.py:196
2016-12-07 07:32:20.967 29343 DEBUG neutron.plugins.ml2.db [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] Attempted to set empty binding levels set_binding_levels /usr/lib/python2.7/site-packages/neutron/plugins/ml2/db.py:171
2016-12-07 07:32:20.990 29343 DEBUG neutron.plugins.ml2.plugin [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] In _notify_port_updated(), no bound segment for port 21d9fab1-ada9-4be1-89fe-068c2f818c13 on network 31d3864e-506f-4665-98f2-7645844e53ab _notify_port_updated /usr/lib/python2.7/site-packages/neutron/plugins/ml2/plugin.py:596
2016-12-07 07:32:20.991 29343 DEBUG oslo_messaging._drivers.amqpdriver [req-65df65d6-562f-4b25-bbf0-af1a8c8281bd 2ad697ec098b4f87a0229171321d105c 041d997e145f4cfcb14a47d1540022f0 - - -] CAST unique_id: 26bbb86c0eb24326a08c3c32f8eb9da7 NOTIFY exchange 'neutron' topic 'notifications.info' _send /usr/lib/python2.7/site-packages/oslo_messaging/_drivers/amqpdriver.py:438




openstack-config --set /etc/neutron/plugins/ml2/sriov_agent.ini ml2_sriov agent_required True



on compute:
openstack-config --set /etc/neutron/plugins/ml2/sriov_agent.ini sriov_nic physical_device_mappings  


# case  Extension driver qos required for service plugin qos not found

```sh
2016-12-07 10:27:21.092 21348 ERROR neutron.service ExtensionDriverNotFound: Extension driver qos required for service plugin qos not found.

2016-12-07 10:27:21.091 21348 DEBUG oslo_concurrency.lockutils [-] Lock "manager" released by "neutron.manager._create_instance" :: held 13.029s inner /usr/lib/python2.7/site-packages/oslo_concurrency/lockutils.py:282
2016-12-07 10:27:21.092 21348 ERROR neutron.service [-] Unrecoverable error: please check log for details.
2016-12-07 10:27:21.092 21348 ERROR neutron.service Traceback (most recent call last):
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 107, in serve_wsgi
2016-12-07 10:27:21.092 21348 ERROR neutron.service     service.start()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 80, in start
2016-12-07 10:27:21.092 21348 ERROR neutron.service     self.wsgi_app = _run_wsgi(self.app_name)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 308, in _run_wsgi
2016-12-07 10:27:21.092 21348 ERROR neutron.service     app = config.load_paste_app(app_name)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/common/config.py", line 290, in load_paste_app
2016-12-07 10:27:21.092 21348 ERROR neutron.service     app = loader.load_app(app_name)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/oslo_service/wsgi.py", line 353, in load_app
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return deploy.loadapp("config:%s" % self.config_path, name=name)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 247, in loadapp
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return loadobj(APP, uri, name=name, **kw)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 272, in loadobj
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return context.create()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 710, in create
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return self.object_type.invoke(self)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 144, in invoke
2016-12-07 10:27:21.092 21348 ERROR neutron.service     **context.local_conf)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/util.py", line 55, in fix_call
2016-12-07 10:27:21.092 21348 ERROR neutron.service     val = callable(*args, **kw)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/urlmap.py", line 25, in urlmap_factory
2016-12-07 10:27:21.092 21348 ERROR neutron.service     app = loader.get_app(app_name, global_conf=global_conf)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 350, in get_app
2016-12-07 10:27:21.092 21348 ERROR neutron.service     name=name, global_conf=global_conf).create()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 710, in create
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return self.object_type.invoke(self)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/urlmap.py", line 25, in urlmap_factory
2016-12-07 10:27:21.092 21348 ERROR neutron.service     app = loader.get_app(app_name, global_conf=global_conf)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 350, in get_app
2016-12-07 10:27:21.092 21348 ERROR neutron.service     name=name, global_conf=global_conf).create()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 710, in create
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return self.object_type.invoke(self)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 144, in invoke
2016-12-07 10:27:21.092 21348 ERROR neutron.service     **context.local_conf)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/util.py", line 55, in fix_call
2016-12-07 10:27:21.092 21348 ERROR neutron.service     val = callable(*args, **kw)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/auth.py", line 71, in pipeline_factory
2016-12-07 10:27:21.092 21348 ERROR neutron.service     app = loader.get_app(pipeline[-1])
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 350, in get_app
2016-12-07 10:27:21.092 21348 ERROR neutron.service     name=name, global_conf=global_conf).create()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 710, in create
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return self.object_type.invoke(self)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/loadwsgi.py", line 146, in invoke
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return fix_call(context.object, context.global_conf, **context.local_conf)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/paste/deploy/util.py", line 55, in fix_call
2016-12-07 10:27:21.092 21348 ERROR neutron.service     val = callable(*args, **kw)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/api/v2/router.py", line 71, in factory
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return cls(**local_config)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/api/v2/router.py", line 75, in __init__
2016-12-07 10:27:21.092 21348 ERROR neutron.service     plugin = manager.NeutronManager.get_plugin()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/manager.py", line 233, in get_plugin
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return weakref.proxy(cls.get_instance().plugin)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/manager.py", line 227, in get_instance
2016-12-07 10:27:21.092 21348 ERROR neutron.service     cls._create_instance()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/oslo_concurrency/lockutils.py", line 271, in inner
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return f(*args, **kwargs)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/manager.py", line 213, in _create_instance
2016-12-07 10:27:21.092 21348 ERROR neutron.service     cls._instance = cls()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/manager.py", line 116, in __init__
2016-12-07 10:27:21.092 21348 ERROR neutron.service     plugin_provider)
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/manager.py", line 149, in _get_plugin_instance
2016-12-07 10:27:21.092 21348 ERROR neutron.service     return plugin_class()


2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/plugins/ml2/plugin.py", line 163, in __init__
2016-12-07 10:27:21.092 21348 ERROR neutron.service     self._verify_service_plugins_requirements()
2016-12-07 10:27:21.092 21348 ERROR neutron.service   File "/usr/lib/python2.7/site-packages/neutron/plugins/ml2/plugin.py", line 193, in _verify_service_plugins_requirements
2016-12-07 10:27:21.092 21348 ERROR neutron.service     driver=extension_driver, service_plugin=service_plugin
2016-12-07 10:27:21.092 21348 ERROR neutron.service ExtensionDriverNotFound: Extension driver qos required for service plugin qos not found.
2016-12-07 10:27:21.242 21348 CRITICAL neutron [-] ExtensionDriverNotFound: Extension driver qos required for service plugin qos not found.
2016-12-07 10:27:21.242 21348 ERROR neutron Traceback (most recent call last):
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/bin/neutron-server", line 10, in <module>
2016-12-07 10:27:21.242 21348 ERROR neutron     sys.exit(main())
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/cmd/eventlet/server/__init__.py", line 22, in main
2016-12-07 10:27:21.242 21348 ERROR neutron     server.boot_server(_main_neutron_server)
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/server/__init__.py", line 37, in boot_server
2016-12-07 10:27:21.242 21348 ERROR neutron     server_func()
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/cmd/eventlet/server/__init__.py", line 27, in _main_neutron_server
2016-12-07 10:27:21.242 21348 ERROR neutron     wsgi_eventlet.eventlet_wsgi_server()
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/server/wsgi_eventlet.py", line 24, in eventlet_wsgi_server
2016-12-07 10:27:21.242 21348 ERROR neutron     neutron_api = service.serve_wsgi(service.NeutronApiService)
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 110, in serve_wsgi
2016-12-07 10:27:21.242 21348 ERROR neutron     LOG.exception(_LE('Unrecoverable error: please check log '
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/oslo_utils/excutils.py", line 220, in __exit__
2016-12-07 10:27:21.242 21348 ERROR neutron     self.force_reraise()
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/oslo_utils/excutils.py", line 196, in force_reraise
2016-12-07 10:27:21.242 21348 ERROR neutron     six.reraise(self.type_, self.value, self.tb)
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 107, in serve_wsgi
2016-12-07 10:27:21.242 21348 ERROR neutron     service.start()
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 80, in start
2016-12-07 10:27:21.242 21348 ERROR neutron     self.wsgi_app = _run_wsgi(self.app_name)
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/service.py", line 308, in _run_wsgi
2016-12-07 10:27:21.242 21348 ERROR neutron     app = config.load_paste_app(app_name)
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/neutron/common/config.py", line 290, in load_paste_app
2016-12-07 10:27:21.242 21348 ERROR neutron     app = loader.load_app(app_name)
2016-12-07 10:27:21.242 21348 ERROR neutron   File "/usr/lib/python2.7/site-packages/oslo_service/wsgi.py", line 353, in load_app
2016-12-07 10:27:21.242 21348 ERROR neutron     return deploy.loadapp("config:%s" % self.config_path, name=name)
```

## Solution 
remove qos

openstack-config --set  /etc/neutron/neutron.conf  DEFAULT service_plugins router



# sriov issue 

```sh
[root@slot7 neutron]# neutron agent-list
+------------------------+--------------------+------------------------+-------------------+-------+----------------+------------------------+
| id                     | agent_type         | host                   | availability_zone | alive | admin_state_up | binary                 |
+------------------------+--------------------+------------------------+-------------------+-------+----------------+------------------------+
| 03b403e3-710e-         | Open vSwitch agent | slot13.vepc.mnc066.mcc |                   | :-)   | True           | neutron-openvswitch-   |
| 49ca-9649-42a2b7d1b0ca |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| 19097b28-fc09-45e7-804 | L3 agent           | slot14.vepc.mnc066.mcc | nova              | :-)   | True           | neutron-l3-agent       |
| 2-b3a0a111c57c         |                    | 260.3gppnetwork.org    |                   |       |                |                        |
| 23bae353-11e5-45b5-a50 | DHCP agent         | slot5.vepc.mnc066.mcc2 | nova              | :-)   | True           | neutron-dhcp-agent     |
| 6-0729c8a5498f         |                    | 60.3gppnetwork.org     |                   |       |                |                        |
| 25fbd64e-bacb-         | NIC Switch agent   | slot11.vepc.mnc066.mcc |                   | :-)   | True           | neutron-sriov-nic-     |
| 48c1-b384-4e417e822c35 |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| 37f73e69-5a3d-4ca4     | NIC Switch agent   | slot9.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-sriov-nic-     |
| -835f-707f24c6160c     |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| 395b9c53-0dae-         | Metadata agent     | slot5.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-metadata-agent |
| 4c1d-b887-0c50c750532c |                    | 60.3gppnetwork.org     |                   |       |                |                        |
| 4239433c-961e-4216     | DHCP agent         | slot14.vepc.mnc066.mcc | nova              | :-)   | True           | neutron-dhcp-agent     |
| -b0db-983c8f3414ba     |                    | 260.3gppnetwork.org    |                   |       |                |                        |
| 4cf2f17b-7ad2-410f-a09 | NIC Switch agent   | slot12.vepc.mnc066.mcc |                   | :-)   | True           | neutron-sriov-nic-     |
| 0-77ba4f7f9b67         |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| 4e58a332-c851-48a5-99a | Metadata agent     | slot7.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-metadata-agent |
| 3-147f636380c3         |                    | 60.3gppnetwork.org     |                   |       |                |                        |
| 542adc8f-16b1-4ce0-bdb | NIC Switch agent   | slot1.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-sriov-nic-     |
| 1-c389f68998f4         |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| 566e0a3b-09ff-         | Open vSwitch agent | slot11.vepc.mnc066.mcc |                   | :-)   | True           | neutron-openvswitch-   |
| 4b23-b1b9-0877befb227d |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| 57d28065-bde5-4528-97a | Open vSwitch agent | slot3.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-openvswitch-   |
| 4-fbf367d52b8e         |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| 58bc6822-4f87-435b-    | NIC Switch agent   | slot3.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-sriov-nic-     |
| b6e7-51fdb532348c      |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| 62a35698-27a6-42d3     | Open vSwitch agent | slot5.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-openvswitch-   |
| -b15a-5898b786b1ba     |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| 84cceb65-b47b-41e5     | Open vSwitch agent | slot9.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-openvswitch-   |
| -b3ea-36db457379ae     |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| 9f50155b-c5c6-46ee-    | Open vSwitch agent | slot2.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-openvswitch-   |
| 9bf9-abb7a068ca97      |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| a4b3f0e7-563e-         | Metadata agent     | slot14.vepc.mnc066.mcc |                   | :-)   | True           | neutron-metadata-agent |
| 4d8a-8752-f1f2bc4cece8 |                    | 260.3gppnetwork.org    |                   |       |                |                        |
| a4cb6f54-7d01-4d86-a11 | Open vSwitch agent | slot12.vepc.mnc066.mcc |                   | :-)   | True           | neutron-openvswitch-   |
| 2-fc6be8786cae         |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| af0ccbf0-cb3b-44ab-    | DHCP agent         | slot7.vepc.mnc066.mcc2 | nova              | :-)   | True           | neutron-dhcp-agent     |
| acef-664e022eb56f      |                    | 60.3gppnetwork.org     |                   |       |                |                        |
| b9ca1f60-d49b-41ac-    | NIC Switch agent   | slot2.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-sriov-nic-     |
| af70-baebb76019c8      |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| c54879cb-a341-4168     | Open vSwitch agent | slot10.vepc.mnc066.mcc |                   | :-)   | True           | neutron-openvswitch-   |
| -b65d-23e0e2413cba     |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| e7f153cc-073c-43da-    | L3 agent           | slot5.vepc.mnc066.mcc2 | nova              | :-)   | True           | neutron-l3-agent       |
| 8e42-176be817ae6c      |                    | 60.3gppnetwork.org     |                   |       |                |                        |
| f1fbfdf7-36f4-4a68-8b0 | Open vSwitch agent | slot4.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-openvswitch-   |
| 1-5c3bb5e8c059         |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| f2456863-2e49-4d63-8eb | Open vSwitch agent | slot7.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-openvswitch-   |
| 4-9f6ae58a8cda         |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| f519d24f-c990-43fb-    | NIC Switch agent   | slot10.vepc.mnc066.mcc |                   | :-)   | True           | neutron-sriov-nic-     |
| bfd5-bb3c07991f6b      |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| f886bd6a-5b64-4d86-aa5 | Open vSwitch agent | slot1.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-openvswitch-   |
| 5-1a48dae07dc3         |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
| fc9514f2-d85a-4471-9c5 | Open vSwitch agent | slot14.vepc.mnc066.mcc |                   | :-)   | True           | neutron-openvswitch-   |
| 2-637de962abe6         |                    | 260.3gppnetwork.org    |                   |       |                | agent                  |
| fc976ff4-8bcf-47f5     | L3 agent           | slot7.vepc.mnc066.mcc2 | nova              | :-)   | True           | neutron-l3-agent       |
| -b44e-614d7644cc2e     |                    | 60.3gppnetwork.org     |                   |       |                |                        |
| feec97b1-9fee-4359     | NIC Switch agent   | slot4.vepc.mnc066.mcc2 |                   | :-)   | True           | neutron-sriov-nic-     |
| -a40a-6fbff293dbd5     |                    | 60.3gppnetwork.org     |                   |       |                | agent                  |
+------------------------+--------------------+------------------------+-------------------+-------+----------------+------------------------+
[root@slot7 neutron]# 



```
50876:2016-12-07 20:57:15.520 17527 INFO nova.compute.resource_tracker [req-dc02c4c5-3b02-4faa-8254-281bd2235007 - - - - -] Final resource view: name=slot1.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=6144MB phys_disk=838GB used_disk=40GB total_vcpus=40 used_vcpus=2

pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), 
PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), 
PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'),
PciDevicePool(count=61,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]


### slot1 
53379:2016-12-07 21:41:53.467 17527 INFO nova.compute.resource_tracker [req-dc02c4c5-3b02-4faa-8254-281bd2235007 - - - - -] Final resource view: name=slot1.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=6144MB phys_disk=838GB used_disk=40GB total_vcpus=40 used_vcpus=2 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=61,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]


### slot2 
2016-12-07 21:08:43.143 33236 INFO nova.compute.resource_tracker [req-0bcae280-52c1-4faa-a98a-9a838ac493e3 - - - - -] Final resource view: name=slot2.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=4096MB phys_disk=838GB used_disk=20GB total_vcpus=40 used_vcpus=1 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=5,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]



### slot3 
2016-12-07 21:07:30.680 36888 INFO nova.compute.resource_tracker [req-424b35e0-0180-430c-aa1e-1a0bcb67701f - - - - -] Final resource view: name=slot3.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=18432MB phys_disk=838GB used_disk=110GB total_vcpus=40 used_vcpus=2 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]

### slot4 
2016-12-07 21:29:32.993 35623 INFO nova.compute.resource_tracker [req-4ecc6991-723d-4e6f-95c3-27dcc3e89c07 - - - - -] Final resource view: name=slot4.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=2048MB phys_disk=838GB used_disk=0GB total_vcpus=40 used_vcpus=0 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=3,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]

### slot9
49551:2016-12-07 21:32:28.050 1741 INFO nova.compute.resource_tracker [req-701af122-88dc-40a5-b985-58826a65ea73 - - - - -] Final resource view: name=slot9.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=4096MB phys_disk=838GB used_disk=20GB total_vcpus=40 used_vcpus=1 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=13,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]

### slot10
68026:2016-12-07 21:34:20.697 2061 INFO nova.compute.resource_tracker [req-39239205-20e1-4cd6-bedf-4035f859adbd - - - - -] Final resource view: name=slot10.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=4096MB phys_disk=838GB used_disk=20GB total_vcpus=40 used_vcpus=1 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=37,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]

### slot11
46197:2016-12-07 21:34:51.871 3112 INFO nova.compute.resource_tracker [req-869aa7da-d1f6-4493-80ec-df5897592691 - - - - -] Final resource view: name=slot11.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=2048MB phys_disk=838GB used_disk=0GB total_vcpus=40 used_vcpus=0 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=35,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]

### slot12 

70605:2016-12-07 21:36:22.218 3914 INFO nova.compute.resource_tracker [req-a957deb9-7ed5-46d8-b4d0-3613e7e8cc1b - - - - -] Final resource view: name=slot12.vepc.mnc066.mcc260.3gppnetwork.org phys_ram=261749MB used_ram=4096MB phys_disk=838GB used_disk=20GB total_vcpus=40 used_vcpus=1 pci_stats=[PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet0'},vendor_id='8086'), PciDevicePool(count=63,numa_node=0,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet1'},vendor_id='8086'), PciDevicePool(count=63,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet2'},vendor_id='8086'), PciDevicePool(count=24,numa_node=1,product_id='10ed',tags={dev_type='type-VF',physical_network='Sriov_Vlan_phynet3'},vendor_id='8086')]






~                                                                                                                                                 
~                                                                                                                                                 
~                                                                                   
