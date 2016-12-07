
# Filter RamFilter returned 0 hosts

<https://access.redhat.com/support/cases/#/case/01748699>


log keywords  in nova-scheduler.log 
> Filter returned 0 hosts

2016-11-30 08:57:01.317 29856 DEBUG nova.scheduler.filters.ram_filter [req-044e96a6-220f-45e8-9ca7-ee376e393d22 2856ea0763ca4b33bf7b8623f51c6504 8e4077b6129941779c125dd763c63f4f - - -] (director.vepc.mnc066.mcc260.3gppnetwork.org, b537d8c2-59ba-4499-a496-240e80ebbded) ram: 0MB disk: 0MB io_ops: 0 instances: 0 does not have 4096 MB usable ram before overcommit, it only has 0 MB. host_passes /usr/lib/python2.7/site-packages/nova/scheduler/filters/ram_filter.py:45
2016-11-30 08:57:01.318 29856 INFO nova.filters [req-044e96a6-220f-45e8-9ca7-ee376e393d22 2856ea0763ca4b33bf7b8623f51c6504 8e4077b6129941779c125dd763c63f4f - - -] Filter RamFilter returned 0 hosts



```python 
    def host_passes(self, host_state, spec_obj):
        """Only return hosts with sufficient available RAM."""
        requested_ram = spec_obj.memory_mb
        free_ram_mb = host_state.free_ram_mb
        total_usable_ram_mb = host_state.total_usable_ram_mb

        # Do not allow an instance to overcommit against itself, only against
        # other instances.
        if not total_usable_ram_mb >= requested_ram:
            LOG.debug("%(host_state)s does not have %(requested_ram)s MB "
                      "usable ram before overcommit, it only has "
                      "%(usable_ram)s MB.",
                      {'host_state': host_state,
                       'requested_ram': requested_ram,
                       'usable_ram': total_usable_ram_mb})
            return False
        memory_mb_limit = total_usable_ram_mb * ram_allocation_ratio
        used_ram_mb = total_usable_ram_mb - free_ram_mb
        usable_ram = memory_mb_limit - used_ram_mb
        if not usable_ram >= requested_ram:
            LOG.debug("%(host_state)s does not have %(requested_ram)s MB "
                    "usable ram, it only has %(usable_ram)s MB usable ram.total=%(total_usable_ram_mb),free=%(free)",
                    {'host_state': host_state,
                     'requested_ram': requested_ram,
                     'usable_ram': usable_ram,
                     'total_usable_ram_mb':total_usable_ram_mb,
                     'free':free_ram_mb})
            return False

        # save oversubscription limit for compute node to test against:
        host_state.limits['memory_mb'] = memory_mb_limit
        return True
```

















[root@director tmp]# nova hypervisor-stats
+----------------------+-------+
| Property             | Value |
+----------------------+-------+
| count                | 11    |
| current_workload     | 9     |
| disk_available_least | -9207 |
| free_disk_gb         | 0     |
| free_ram_mb          | 0     |
| local_gb             | 0     |
| local_gb_used        | 360   |
| memory_mb            | 0     |
| memory_mb_used       | 36864 |
| running_vms          | 9     |
| vcpus                | 0     |
| vcpus_used           | 9     |
+----------------------+-------+
[root@director tmp]# nova flavor-list
+--------------------------------------+---------------+-----------+------+-----------+------+-------+-------------+-----------+
| ID                                   | Name          | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public |
+--------------------------------------+---------------+-----------+------+-----------+------+-------+-------------+-----------+
| 0062f3ba-2600-4020-80dd-d0abcbae339d | ceph-storage  | 4096      | 40   | 0         |      | 1     | 1.0         | True      |
| 0f000887-6a78-443f-ad92-b96cf605c211 | swift-storage | 4096      | 40   | 0         |      | 1     | 1.0         | True      |
| 332fdcc8-2836-48cb-abff-89513e7fe85c | block-storage | 4096      | 40   | 0         |      | 1     | 1.0         | True      |
| 7bdfb93f-6a19-4ba0-8031-5cbbca116930 | control       | 4096      | 40   | 0         |      | 1     | 1.0         | True      |
| b58c0074-82ac-488c-898f-e510cea14dec | compute       | 4096      | 40   | 0         |      | 1     | 1.0         | True      |
| efa7fbfa-5666-4e94-8dfd-6c4a39598b49 | baremetal     | 4096      | 40   | 0         |      | 1     | 1.0         | True      |
+--------------------------------------+---------------+-----------+------+-----------+------+-------+-------------+-----------+
[root@director tmp]# openstack overcloud profiles list
+--------------------------------------+-----------+-----------------+-----------------+-------------------+
| Node UUID                            | Node Name | Provision State | Current Profile | Possible Profiles |
+--------------------------------------+-----------+-----------------+-----------------+-------------------+
| ddda37c5-9317-4608-838a-c01291abdd4a |           | available       | compute         |                   |
| 4bdb95af-b439-4522-b217-855a443bdcbd |           | available       | compute         |                   |
+--------------------------------------+-----------+-----------------+-----------------+-------------------+
[root@director tmp]# 
[root@director tmp]# ironic node-list
+--------------------------------------+------+--------------------------------------+-------------+--------------------+-------------+
| UUID                                 | Name | Instance UUID                        | Power State | Provisioning State | Maintenance |
+--------------------------------------+------+--------------------------------------+-------------+--------------------+-------------+
| af6368a9-07b8-45b1-9188-56e45df12f1a | None | 46fa1c23-6931-4b10-a3bb-5bcb5ea27321 | power on    | wait call-back     | False       |
| b537d8c2-59ba-4499-a496-240e80ebbded | None | c95484bb-b8ba-4551-af8a-984365339fcf | power on    | wait call-back     | False       |
| fcd7941b-636b-4adf-b7b0-52ab6ec5c47f | None | 65944a5f-2050-43d1-8a6c-98dfbd4822d2 | power on    | wait call-back     | False       |
| 4975235d-d2d6-4a64-b42f-80257d23b17c | None | 166c70f4-d223-4e42-b960-d2e9a43c3125 | power on    | wait call-back     | False       |
| 4d62def8-72ae-42f6-9743-fac71f665cd8 | None | 4eefcf32-6792-4010-8303-7d7014aca267 | power on    | wait call-back     | False       |
| ddda37c5-9317-4608-838a-c01291abdd4a | None | c10aab36-476c-43eb-86e4-d03e0bba3329 | power off   | available          | False       |
| e5c15dcd-ee50-4f15-9796-d2c1b9d807f4 | None | 27a7975d-b5c2-45b7-8f38-8a9ed02946a6 | power on    | wait call-back     | False       |
| 4bdb95af-b439-4522-b217-855a443bdcbd | None | b044289e-463d-441c-8c2a-8a221711df34 | power on    | available          | False       |
| 4f20a3d3-7787-426a-81e5-11bb00ea7c7e | None | f8b4f6f8-4985-444e-9562-3ab5e3b70793 | power on    | wait call-back     | False       |
| 4946796b-d6e9-4a4d-8c9c-7cbf9eee9266 | None | ef25e466-133d-41d4-ad12-0cc62492aa01 | power on    | wait call-back     | False       |
| 5aaf184c-35b5-4658-b0f2-d08f9b7d21b6 | None | 87279dc7-a7f9-4294-8952-f760e382b35b | power on    | wait call-back     | False       |
+--------------------------------------+------+--------------------------------------+-------------+--------------------+-------------+
[root@director tmp]# ironic node-show 4975235d-d2d6-4a64-b42f-80257d23b17c
+------------------------+--------------------------------------------------------------------------+
| Property               | Value                                                                    |
+------------------------+--------------------------------------------------------------------------+
| chassis_uuid           |                                                                          |
| clean_step             | {}                                                                       |
| console_enabled        | False                                                                    |
| created_at             | 2016-11-29T16:26:58+00:00                                                |
| driver                 | pxe_ipmitool                                                             |
| driver_info            | {u'ipmi_password': u'******', u'ipmi_address': u'172.23.85.73',          |
|                        | u'ipmi_username': u'root', u'deploy_kernel':                             |
|                        | u'1c66f6ac-e452-403e-a210-ee4cc010df00', u'deploy_ramdisk':              |
|                        | u'5edb0858-b012-4f87-bf52-3be275594410'}                                 |
| driver_internal_info   | {u'agent_url': u'http://172.23.85.91:9999', u'is_whole_disk_image':      |
|                        | False, u'agent_last_heartbeat': 1480448339}                              |
| extra                  | {u'hardware_swift_object': u'extra_hardware-4975235d-d2d6-4a64-b42f-     |
|                        | 80257d23b17c'}                                                           |
| inspection_finished_at | None                                                                     |
| inspection_started_at  | None                                                                     |
| instance_info          | {u'ramdisk': u'84103980-41bf-42fb-9526-26d2aa0c073d', u'kernel': u       |
|                        | '0dfec46c-e29b-4929-96ff-41d2d6fee836', u'root_gb': u'40',               |
|                        | u'display_name': u'overcloud-compute-0', u'image_source': u'eab03f9c-    |
|                        | d58b-497b-99d9-d8159279abaa', u'local_gb': u'837', u'capabilities':      |
|                        | u'{"profile": "compute", "boot_option": "local"}', u'memory_mb':         |
|                        | u'4096', u'vcpus': u'1', u'deploy_key':                                  |
|                        | u'5CZK7QXM7GEQP3MK5D72HQK26VPOPPUX', u'configdrive': u'H4sICEXnPVgC/3Rtc |
|                        | EhOaTBZSgDt3WuT29h54HH02Gs7iitxObOprdQ4gdszlhSKzftNLnmX9/v93l5XF0iCJHgDC |
|                        | IBsks644lebrdraj5CPko+T2hdJ7UfYPSC7pe4ZTUv2KKO5/H8tdZPAAQ6I24PD5xCUJAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcJZMeb2+M6mUr |
|                        | 7R78hcb6quxNnH7v2j87fz+z70/D9Qr/jn/pR/9SPrn06B//vDV6L92fp1LH52efST9yPnzI |
|                        | 8n+85/95S9/9m8f3E4vv2dVQ101bWU4lyv6VpF9gQvfhc8duVAXEd2y5W+9bLqSb1bz5Xg2L |
|                        | YsHciwc9npymaacyZfSzX6zlS7LyUY63qo25CfJp7IvFgvI6Yt+tV3JpuKl9O3AiNvv9Yblw |
|                        | kUtHW80qxVP4aKZzOVLYq/MHss4o50yETmZahTzLbmVjpe/8pfr9/rCPp8/5gsFov6Y1/tvn |
|                        | xvg/QzpcyXe/06L94ugg6+ND27iv1SS8lJFaks9SX7tz1DSpZU0ljRpIrkl/+fGfyb+f+JJv |
|                        | 3X8/9fToH/9L69G/80p/v/y9OyXXxT/v2BZv7qfqmRIqlgvTcmWFLGO5mJYRayprXgmSz4pI |
|                        | F2I385/txQRf1VpIf7qkiXKy9+Cn6yUFq83L15/VfwuS/HjEPlmiCzFpLD48UpXUk7KiGGy+ |
|                        | J0X+1paPO6L/y3xqCyGJqWGeBQXz6vikSw9EUOeHtdgTPwExKO0WHt9MbYt6stKKVG2dKzpz |
|                        | T/vrhDxH8R/fIv8v9v4DwAAAAAAvrXOjjl2p/3/Pelnx0fq0C/92fEN/TNJN9SV5eS3pUfS3 |
|                        | 4ohH0h+rzd25Q2Kfz+Q/u44ZKHYqmU/kn5+nIff6/NfeaNXPu8j6fx2SOA0xSPpF6+G+LxXv |
|                        | sgj6ePbIaHjkNAPpE+OQ05zZfsAAAAAAPBu2v+S07/+zGlzCz+Tzk7tf8npEXV2t/0v/K30w |
|                        | d32v/B30ge37X/h59L37rb/JacL3/futv+FX9wMuWn/Cx8fh7xs/wufSN+j/Q8AAAAAwLts/ |
|                        | //y5l2AH0iPT49UaSj5fyr9/emZfvMJN+v2E24fSk8kJ+8v+SWv+IlJbvE7ePr9Y+npadxCl |
|                        | LXFdGKqDyWXdHx3wSnvE7+dklHx2yd5P5Se3R0XuDuvD8Wfz4wTUxx/Rz6ULu6OC90ZF/qx5 |
|                        | DmNu7MMbGcAAAAAwHe9/S8599c5c9r/wmPnAwCn9r/w985HAD7f/heeOB8FeF37X3jqfCjgb |
|                        | vtfcDmd/F/X/heevRz3mfa/4L437k77X7h4Oe4z7X/B43yEgPY/AAAAAAAn//TGe+w3az88+ |
|                        | 5f/KzUa/+nsD7Xex2fLuFMuvvz+abrvf3aOrczfnP3FzUzu/0mmPzrzngp5b0v/+82f8ZuW4 |
|                        | +wdLIBkHO9xIDmfc3htLd9Th36nnv9ZKf/oeCeEL1nfP9zeGFl+fX1/9vIDFje1/sWdey7cr |
|                        | fuHp9n88I+oGwCALzZ+Q0Q8exeBX/pqovvvj/cokpzPKb62lkevPrwo3cTbvzw73tHI7Q2Kf |
|                        | 3er/+A0pw/evvrt8X5IkvOZyNfW/oObjzTe1PznZzf3OPpytbIHAwD+tPj/cMx8Tfz/E4LUG |
|                        | 68y3kn8/yfJdyrj++g42fc/ehUknVp+slRt5Wqk2MrFzNJXv/LdxuK/OpOcUe6Xo5wF+fgPz |
|                        | jz+8PHNdyOcvf2C/KPkPxXxP/2J8+cnT+8vx483lmqeluPVMoiWvzP4uAxfrnp2agDAW8T/h |
|                        | 1ut36z4HzqVCb3v+B8+FQkT/wEAX9f4L58eyG8d//+EXPRX9f7/z09lfv6F7//f3pzw3vv/P |
|                        | r/bG3X7vF/uIuf3x+87kJx7Hn5h7YHXZB98gXeRffj98bsVJOf+ig/Ufrzp4mdr93ndvsiXr |
|                        | f3jU5GPv7j2mxs83q89dKw99GUzL5+cinxC5gUA3j7+Pxwz31X7/w1XGWfv4irjn6TYqUxse |
|                        | 2r/b/+49v/VO2v/Pz8Vef7Ht/+vaP8DAL6S+P9wq/WbFf9fnMq8CB0n+2HofcX/X5+K/Jr4D |
|                        | wD4usb/h983/mbF//ipTPx9x//EqUji/cT//yWlT2XSt5vqfv0/3aqrkW6+bk385zPpsyO5G |
|                        | AGAb2f8fzhz+82K/5lTmczkFP8n7yf+/28peyqSDR6nOgveX46/Wqn2tW7O7y7KzZL89Zn0u |
|                        | ZFfMgD/o5Q7lcm9r6uR4qlMkasRAPg6xf+H+059s+J/6VSm9L7jf/lUpPz1iP+VU5nK+4r/9 |
|                        | VOZOvEfAL4+zo/f/yc53wHwBfH/jSXOnhy/OVByvj3g9f2vT18pIAWP3ykoOd8r8NpyP/38l |
|                        | w2wgQAA+A+J/w/H7reJ/+HjNwJLzrcCvbbEh6/7qiDp4vhdwZLzfUGvnerHfIEPAAD/YfH/4 |
|                        | dh99uYrhLNfv+G+ex9JSxHFnRa9WxodY7oiov9MxHVdtPWDb7hb3k+ljSipSuadqQEAwJeL/ |
|                        | w+3wt8u/j983703xf+H75ZH/AcA4N3H/4dz8m/3/r/rVML10Pv/PvHbeec/Kn77xN+w9Ow01 |
|                        | bOHpwrcyxqExd8j95uncmpxfkfEVBenqS4enip0Z6qQKOw5TeUhQwEA+LbF/4dj99mbrxBE+ |
|                        | //h++69av9fvbb9//Dd8l61/69o/wMA8I7i/8Ot8LeL/w/fd+9N8f/hu+UR/wEAePfx/+H30 |
|                        | 98u/j983703xf+H75b3uvifeMMd7mRpe/wc4UjUYL62VgAAvtvx/+HM+NvF/4fvu/dw/E+94 |
|                        | W5556KMM/X1MZbPv+Aa4uF73L3+GuLh+9JxDQEA+DbH/4f7uL1d/H/4vntviv8P3y3v7eL/w |
|                        | /e4e338f/i+dMR/AMC3V7rx72ePWv/jrNHI1658sZgv3sql5UY1WZQb+VQ2LecrrXQjmYtXx |
|                        | ONao9qqJqsl50Enn0o35Wa7Vqs2WnKm2pBr1Wa+J2fypbTc7Ddb6bLcTJfjlVY+2ayV0vFmW |
|                        | k5WK614siWn8s2kXGsnSvlmLt04TtyspZP5TD4Zb+WrFblZbTeS6QtZzCF9p6CoUswuk3ceV |
|                        | sRC5MvxRl/uVEvtcloWi5MUL6JVPc3wtq58RTwrH2d7weYGAODod+emaqnmVrE1feXWRufP5 |
|                        | XPTPfEv5sZIH50/k8+numWvlKXqjNG3qjlc6JuRe6gvjY2tur1OEUsdbkzN3rsnpr4xLFHyN |
|                        | +cjdaxsFvb5b8V4U1mONGt+M3vF1Nzek4AztbEZLLShWzO2QWe0M0hZau6lstLGqmW7DcWeO |
|                        | iMy+V457YzVVpatrIaq294bx8W6WZh740513dakhJyRC32oLF5W5Iv4L/yBi2joIhZ5NfYtX |
|                        | q6xUIbqUl3ZoszvzpWtoi2UgbZwVsBBXx2nXOlb5fzTm1eyUDar4dStrUbqToz0vnrNb1PZq |
|                        | eRc3VvH6rzH37qhrixr6gx2pnUempYix4VEoHJQkr790J92nqbi9XjCGRyvp5LeaiQWOOT76 |
|                        | cWkHquWuqltvNBfq5NGuh4sVdKxS2t5ac7308Tlfr2fbrq1Zrw5qs9c/s3KXsZ6qfrOl9Dy4 |
|                        | 6ar01i3tqNmcez356+ne9ckP61uo/50sVrzp2KxpnqohGdTa1OIdPdbc7C9VrfxcLzaj1SSi |
|                        | d6mk1NrtWBxvVQ9laK99EWnk+J+18m34pnAbhkuGuuRy+NNHhrBhR3Lm7FQb9VZbRWjn0rVM |
|                        | 6HrYTc6DGhJJW246mHNfzlSZ+lW3z8o6BvNWPszenU3sAIuv5EJjkPjXjV13W/uVq7QeGDYI |
|                        | 0+teH1olvr+Sinniru2lVqwmzqkZrOux26kI/1OreS7vg4kPTU12uqF/TtPt7KKldXDZtgPB |
|                        | lKrSUSJzBu7RrKvriItNbeVxQ43nP+3kWaqQ1s3L7aqMbxYrobecPhiORz6w96LwMQwbr7W4 |
|                        | UI3J85mvbrd7N4Xt0fKp7f7y81hsnx5mPicKeaquVIXtyPnL0f67+32ytA5kE+74Op4RAzEf |
|                        | j13j9StJkYvFcPQVpPTjrvUjvvOSHGKmbru7M/nHlHS4wz79FPOjsC3W1Jf2SKSuVsilD6Xl |
|                        | +I8pBmKaXuW2k4d/Uoe6JvVSDH3L85f3BcK+iKBaDgWi0RDEW8k6ot6X7w4f1TOl9Pujmpa4 |
|                        | iT0XPZdeB89crvfZtJH9xfEVne25zYarsba5FfycKqYlmq/ON9YbsUaatrrans5F1NZWWPVd |
|                        | KdXQ30kznjP5chAs1+OT2mWoVuafZxQscUZfOoE9F/JY22hOqfmF+d3az9/JPxCTiqGvTFVW |
|                        | VksZGszMEx9qFqWrG9sEa9lbWXrsiIv9IkzE1G8banjzUIe66ZsiwujwUK1puIsK5ZGPs1cW |
|                        | 2liMsvaqNaj00zEeVnM/Ln8+B/EKlBltyJ7torpEfP0vJrEfSp7IYY+/vTLr+CBWCaxXPOvf |
|                        | hXf1nxhTcUa/sXPPQNt5Rko1tRZ2cfLvSfWVBnp16r5VLanmiVWlljDThxVTGfPPK7bO+vSe |
|                        | xG+CMiGc0m7cjaI3B6IK5eNmJvPf+ENyqVW87l4MrVtw3ru8Qw2E+vidHVmKKMLEaI9U1WxP |
|                        | S4xwuPzhyJBn/fRL8QErakq64vR3apGumqtHtvy0BRTqGLpVNn5xiRLPl0ILPaypR+Hiqs5c |
|                        | Sk7smSxd4x0MbPjC1HEbqStZqKkOhJD9M1kKjsXjVcbW1tYF8b+4lhxVcR0+VqVR6ZuiF3OM |
|                        | HTTPr7o4yt95owaKivZUsaqqNFUl+Iq8ljBxXGHFWtgqFiq7Lwq93AsdlB9YclTxZIHqrqSj |
|                        | 1cNi4VYgrGpL2VDXMcoE1UeiJ15pcvWfrnQVnNLzMdZ2r16XKMe3bA9yrV13FaPxDzdpzXgF |
|                        | sPcLycR06R0MRP7dpncp3XhrD/5drPL4nDYiLWqLK6VvSVKioNLvJbN0DmqHqk7Z4N+md3bO |
|                        | ZG5p2LdL1Tzq9+579Yutqezg8t3hx23r1AS12UrS2wDsT+r5nE1xcWWEH9uxjyTbxZRFvuw/ |
|                        | MQpcH4z6vzpr+S9vpGXyv40M2eNi93wtI85yyKru6FqHLec06xYaMpxj9Ls6bGmm/lcyP3TX |
|                        | GR9YCva6jQzRUxiiEHju0XFq71d8iPnWBKH0vX19YVyXGznCtezOBW2PKV8Ml1ppt1i0W8na |
|                        | 68WzlnTVNcbcaiI3WEvi6tSMYUizpDyQrmWxf6tTEzVOTJ0Z8mvReNSbINn4pAa29diZzzNS |
|                        | LQpbVMTe+u9lXe7nJp1r4BYfeJAOY835XzzXE7Em/nmM7mbb+Wq7dZpdt14o+G8XZ1uyqf3j |
|                        | 1N5511j8Swjxyt9uZivpJ7Jqlh1oiZ155xlLGdRNWe1qqMLuakezwP3Nuvp7C8WyzLUoTbWh |
|                        | uIFriYb5zCbOC2+lRMNDNVcijAgNrE4MYiz2kJbavaxRW6dZva5VycOb1GtczIYiWPP1pbq7 |
|                        | XPVNFf67RPdun1k7cVB+Ug0NcTMLfvKaTlbT54+f+TM/XTgPfnN+fGo2TknCucU53zn2vlvn |
|                        | 95Mdtprr5w9+Ikz5pk8dGby7OUe/0zs3fuFroxu5qqNTyXkFy9Ec+dqoE601dXV+Wmkwzb3r |
|                        | 544dOtiqcxVcQK1njw+xT1t4Ll37nr8zAmzT84jXqdxHH369OUMbvbzajNtmrp5f8bq7uq0r |
|                        | OKfPZBfOGvjQkxwpa3G+pOn98qKxVYvjitR/vmL09q8SKd7+Wbr/jyPK07RLPXl0NNqfPS6F |
|                        | 6+uRvde+t2izsYTp+GlIZbrdmNevHyw0q9vFvB4zDrt/tt1I64J7p1jnMuBZ/Jj5fFTWZzgx |
|                        | bNX9YknF85BpD55/In1cos9/8S62Yri0X9fPZY/EWeX26W5u2GPZcS6/txLe/z5Pebxq1o/t |
|                        | 8Sf3ZqeTyyn0lcVPb4+Lfz4/roe3yz87Q726OVYEZqrqeoT0V6dq0/lqahMXHGJSGirzm4vL |
|                        | lzFoSMC6k1oPkVH/X44dPsuAg8u8jFoeZzX9qcv75cIYgtxPv6qo5eIVXcvfx/9zll/z0/rT |
|                        | RkttdWn38CX9CWW+N4e/h6aIuIq63jhfzwlP3r0u3PdEptGXLkN7dsWivOOjhNSxdF7fOx8o |
|                        | alT/GpjLpz3dW7i9Ks3PX3e8POoN+r1bH2eeLuVu4qqQW8kMgj7/LGYWDGR2FBcAo9GkXBgG |
|                        | A6Mg2OPvnVPxcaPTPeBZdjtdQe0/UGdTxamNbPdFXHxmrx54/IwD6qL7V7XBkPTI8K4fxDzK |
|                        | 26vNxx0B6P+qDsaGIXdI3UUGEeCXvEz+K/O8eos6ZWlTV54/QOvNxRW1ME4PFZG6nA8jA79I |
|                        | 1WNRsNKzHkzNxoIjpToL19OJaKxuJSwXvh9wUgwGghFI8c3X29WkW6e3pJWh8f3ym7X0u1bv |
|                        | ue/dcqOVGOh7501fyz820+/2bvLtWIPp27nnX3VFHvMF2x9b+AtX6XbzVslAACQ/yf/T/6f/ |
|                        | D/5fwDk/8n/k/8n/0/+n/w/+X/y/+T/yf+T/yf/T/6f/D/5f/L/5P8BAMDXKP9/vJ4X7XrLu |
|                        | e45b22XNeWyFZgGrWP2cLM5JRx94fAw4h0H3SO/P+AOqkG/exALe8VTNaYEA8OAuFY8Zu7vZ |
|                        | MOv7mXDjynMYxL7N787P17Ikrj+Biaub/tciC3nPL1NY79MYv/27bqMnN51v/p8n4irlz0db |
|                        | mfJbvJN200+vbNjvG7707MAIP9P/p/8P/l/8v/k/8n/k/8n/0/+n/w/+X/y/+T/yf+T/yf/D |
|                        | wAA3kv+X1yNjPTllSWu4pzRu62rMhqt6q1Bvzs9eDrFVGAy3qxD+fqyE66VxkvXclisHQKHe |
|                        | Xy+7Q7tdr44PsyLDdVbHRieXn6o6NY6NByZwfF8rMUWTXNfq+/81XFtqXTWRtsVCiXq3V6xU |
|                        | lp6yvlG8rDPa2VjnLgcu4KusWbH7fRgE24UGsZlKxisFZbdaWy+2UzXoUDD2Cxjq/a8XU+Yl |
|                        | 7tlN3iZDGR9rkwj2+0qrXDlMuvNKftMVfeUDu1uvJDLjYal7SpwXUj1WlZjPV1F07tNxS604 |
|                        | 8uxWorNUovWfDww1r5VJ2JnEqt1rbmuFEu14GLUNSINTdfjg1mxMlj17Xkw5g/GdoWFrjamf |
|                        | WOR3gUup0rQE79cK/5r1357uJwVSr7DLGVOUq1JKDdYjgOxiisfqfUCqeQyMY0W/EG9Etf8i |
|                        | V53Fr6M5teFw/XBo+360UjFuDTya99oVNKboakvW60W7XlaU/ed64raanvVVq1Q0ULdlVGZe |
|                        | bbBjT/edo3nnW7jMm72m4mcN6UtQz2X2vUkc1YxUnSZY7ucng4PxXXAZ7eDIU9/ECvPK9Fyx |
|                        | wgOa/PyPHLd6C06454dToxVf2O4jMVj19V6q7BoJ9pabrivXyZ7NaUXDlZc43KqVzV3uWxM8 |
|                        | Xo3KyOjxdOejc+1HHsyoX091SqUs+Yw0WxXR7PeobBv6tNdel6rj/yVrbU0QuNetxtdmulFO |
|                        | GJovsYqvS/6xnbKm4r0iqNotTbv73uuyDDtqTVDRqcTGZcPrdpsYdVd3f184FEysUzGUy4VP |
|                        | OuVvjBc40Ku5l3sF/UXdF+hXwLdV9hN6L5C/p/8P/l/8v/k/8n/k/8n/0/+n/w/+X/y/+T/y |
|                        | f+T/yf/T/4fAADy/1+c/5+sDOXa0LNzzzy1GvknmXJnnKssUrliJtCfXI8yl7veuhBLxqY+V |
|                        | 65bzW6UVC4QUV3ReHo+yazT4e4iuvFstMvyJGB5svvyolPOrw5GsxyZG7loMZidtc38dhOxC |
|                        | v1dN1ztuTY7Y+zKhjPzUahW3DULiYrmGhjxTjLkHde91eR2PYuYzZF/G1h7F/19rRWyp4Ved |
|                        | 30I1HJ1ddsveLv57mbRL7XaeZfiN4uTSL9cqG0SvVm4V8x36vt9pzcdhrP9TLqU2XtUpeQzu |
|                        | pfVYqK19RrLfVTxzMrVaa7kncXS14XMsG8PEt1pvTSIlvW1VSnU4x2fnR33lHTEX5+MoquJd |
|                        | l1VmuYmvizZZs/j2VujbjGxybsqq0A7PtDHs2Vh1+l6cgeztB/ovng1uS9OdrlGMTUsKMa8M |
|                        | 4qWurX8IDzKVlJG0dPTxn5jVx8F6+HLYNAMVsIla9rcmlq6My23hqVe0diJy/hlstZulNb2L |
|                        | tTNNmej2iS7GCzW/VA/Gb60i5nNxmhuBnZ2E0/5Q9W1mcooVc944WoXOv2pp3o9V0tW1eUr9 |
|                        | cIDI389iI3T1nh9nWsYWnYS6O1W3UBveDgkR8GaXy9U83Wt1NzUl53dQKlkCqFDszG+Xgdiu |
|                        | ZAZ19o+bRzo+pfbnG+k9SbZqtc3D2Xq00k5WkxYreRg5q8EzY1l5QPFZfnaini7Rmw0aPrym |
|                        | bVV1LRGfmTpsVYzHytMApc+r7LJxKP98Ww1VhMJT3e2SRrxdso7GCuTvcfTs1rx8bg1Gfuyv |
|                        | ti4srxcel3LwyFN/p/ELvl/dhPy/+T/yf+T/yf/T/6f/D/5f/L/5P/J/5P/J/9P/p/8P/l/8 |
|                        | v/k/wEA+I7l/7kXNwAA3734/8f1/5sZw10p1w6Y3uFai1T8iXB6NCtMNxNXZDYf7836Mr4Zt |
|                        | DdrrxmuN0K7zqJd3jaHWb2+mQ1myjZQ3o6N/TCbK/aS/WhACZf3+XBuOMsYWs+1Fs939mTkS |
|                        | ZTLWb+6VFPpuVpua+v+2r68ngTteC2v2YvxoNS0etnkMBRXJ6HSIteM5vyHYtM2KuFtOZisJ |
|                        | LOTVaLYNZum3vAVE4l0wqflG9vSvqlv+q5MNX7QkvH8rjywwrFyJKzPi4l2umCGri/bh4a67 |
|                        | Cvr1KypZNTccmDkDmp8ki216pORb9WYpbOmWlp3wik9GE3VK/ZeX8V2G/MwDpfyu+akanY68 |
|                        | eREnS0L7UmhqxZNPb6NW/Y40+qX9snLy0NmWAk2XKvSJBpujwbeXm5RCzSz8aDaSczavniwl |
|                        | ioVt7n6Nh4bZGt63hxdBrTmKBpbbrSKXrpuBtRYpOmaVw7errZfWDXL19ztrdkh3zT9hbJfz |
|                        | a5M3yy3SNX9dtvbmrfj23VzvinUhnZwqKmHbj2WGBgddZurFhrZUCfqHddH/nZlk47V6olwx |
|                        | V+spdd2ZJE6hGLTlhbKGp52IZKbdOb+QipcLXTyxe0hEFOC23YxZGiHgaXZK72x0SK62fUkx |
|                        | x7PrFfMXCYjs2Y5tFZzwfja6vT2o2nb44pEYj5ffzvMmtfRST3arCabWY8ZbhndynzkXeihn |
|                        | hLJbIszr/cw8asVfVOZZS4ji+m46ivbg01k4WmMCoXksND35qZ7r+G1tuP9yBey55NELRfIT |
|                        | hv5VMo+GKFYqKCmNjr9/+jYRf8/dpM/rf+fYepO55yr0+njTamR829sj8HfnTs5Am2onrIez |
|                        | us4rYmbM93Ns5v14A0Mg4rfF3aLdRB1BwOBmDsaCsbcMW9AbEslPA6OjmdKpxOQU95WjJCTx |
|                        | BnGFHcgevf404xt8Go0HRrOwNPMb6ryng7CYz+i0zKoTo8LMfZqqQyvlNHI6XjhTBAZPlf8z |
|                        | wPqc1V9Ho0+j4yceS3tzc0BeVuVvrVeVfL5Jdpq45tXd2dELOYOKt6oWwlHwu5wNDaORlRV9 |
|                        | fsGYuF4xwQA8I1H/3/6/9P/n/7/9P+n/z/9/+n/T/9/+v/T/5/+//T/p/8//f/p/0//fwAAv |
|                        | oX9/8hmAwDw3Yv/f1z//0TNP/W0t7lMyJOIrtV+NJHYWs2qazEq2eWY6c2Mykol2yxv4oXgI |
|                        | pprBSfmuqh18uOgPqhv6oORJ9XrRfzrVnTU8yWXSmEeCw/zVVe4d13d1S8XVk6vGtauqlhmp |
|                        | RXMRsqbWqyyr4VGw+p1OKX5i75idZLxWUNtvb+eemr2vGGM/RVfa5VKtOdq0pPrtztGe7qOa |
|                        | YOoJ5IpJZazbucyWfKmxwWtEDOvm81eexfcZyx7kdfNjRpZ7AdpvdjqNOKKqqVDl1pz2Emq4 |
|                        | 0LyYFjDZm9uxVYlJXodKEQK8fWwNrMP8YUejKVW04nS23v1VEf35SyfGVzoHa8rHEnWL9epa |
|                        | je1Ska62ZhlFIKJcGa7y/ZyYSU5Oizj2Va02wmvk+vqrJSNuurRWiI4XZZz1YxePHTL3WVv6 |
|                        | a9c5gvtQdAfDWz8KcuKmc3qaF0bDwZmfKVlO9NdvJ/LDFQjXtIC8ck8Pdvb2XXOSiQzhYSrv |
|                        | 9y7Fp7JIT4fZ5KGy5tY9VqZRKe96MXzZaPiLaq60R0n+42UVr7sp7L9yFDbLpfJcuqQUwbeb |
|                        | u4QKftK1UYtNQ7vsgdPuzjpzpOuqb2a5Rf14iYab2iFmdaq+lVlXqx7hhM1oTdTdmra2lddj |
|                        | Uosum30DuG0Ud+ONt76ymXHJklvtlIx53mrmzNC5WJ7296tMp6SR+xH5VI81jQPw2Ly8rLrC |
|                        | +w3G984W8rmk1ayXAhvJkXPajQb7oKJy409r6QuPd10ppc0MqXdJmhtrv3edWO36GyCweFka |
|                        | pQa23V926gU8/T/p2M3/f/ZTej//3D8p/8//f8BAN819P+n/z/9/+n/T/9/+v/T/5/+//T/p |
|                        | /8//f/p/0//f/r/0/+f/v/0/wcA4FvY/49sNgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgG+D/A7gownAAQ |
|                        | AcA', u'swap_mb': u'0'}                                                  |
| instance_uuid          | 166c70f4-d223-4e42-b960-d2e9a43c3125                                     |
| last_error             | None                                                                     |
| maintenance            | False                                                                    |
| maintenance_reason     | None                                                                     |
| name                   | None                                                                     |
| power_state            | power on                                                                 |
| properties             | {u'memory_mb': u'262144', u'cpu_arch': u'x86_64', u'local_gb': u'837',   |
|                        | u'cpus': u'40', u'capabilities': u'profile:compute,boot_option:local'}   |
| provision_state        | wait call-back                                                           |
| provision_updated_at   | 2016-11-29T20:39:15+00:00                                                |
| raid_config            |                                                                          |
| reservation            | None                                                                     |
| target_power_state     | None                                                                     |
| target_provision_state | active                                                                   |
| target_raid_config     |                                                                          |
| updated_at             | 2016-11-29T20:39:15+00:00                                                |
| uuid                   | 4975235d-d2d6-4a64-b42f-80257d23b17c                                     |
+------------------------+--------------------------------------------------------------------------+
[root@director tmp]# ironic node-show af6368a9-07b8-45b1-9188-56e45df12f1a
+------------------------+--------------------------------------------------------------------------+
| Property               | Value                                                                    |
+------------------------+--------------------------------------------------------------------------+
| chassis_uuid           |                                                                          |
| clean_step             | {}                                                                       |
| console_enabled        | False                                                                    |
| created_at             | 2016-11-29T16:26:57+00:00                                                |
| driver                 | pxe_ipmitool                                                             |
| driver_info            | {u'ipmi_password': u'******', u'ipmi_address': u'172.23.85.77',          |
|                        | u'ipmi_username': u'root', u'deploy_kernel':                             |
|                        | u'1c66f6ac-e452-403e-a210-ee4cc010df00', u'deploy_ramdisk':              |
|                        | u'5edb0858-b012-4f87-bf52-3be275594410'}                                 |
| driver_internal_info   | {u'is_whole_disk_image': False}                                          |
| extra                  | {u'hardware_swift_object': u'extra_hardware-                             |
|                        | af6368a9-07b8-45b1-9188-56e45df12f1a'}                                   |
| inspection_finished_at | None                                                                     |
| inspection_started_at  | None                                                                     |
| instance_info          | {u'ramdisk': u'84103980-41bf-42fb-9526-26d2aa0c073d', u'kernel': u       |
|                        | '0dfec46c-e29b-4929-96ff-41d2d6fee836', u'root_gb': u'40',               |
|                        | u'display_name': u'overcloud-controller-0', u'image_source':             |
|                        | u'8b2c933a-6166-4152-8b5f-cbaaa280f869', u'local_gb': u'837',            |
|                        | u'capabilities': u'{"profile": "control", "boot_option": "local"}',      |
|                        | u'memory_mb': u'4096', u'vcpus': u'1', u'deploy_key':                    |
|                        | u'TFDXQXFGV4KTQGVOSH07LKI8T9A8GY4E', u'configdrive': u'H4sICD7nPVgC/3Rtc |
|                        | DRfdGVrMwDt3Wtz49h54HFo7LWdjitxORPXVspOYHnG3R02RYJ39lR7l1eR4v0iipTXpQJBk |
|                        | IRIAiQAXu1xJa82W7W1HyEfZT9Oal84tR9h94CUuqWZbnXb05mb/z91SyRwgAMCB3gAPoegJ |
|                        | AEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgKNMNhhUj |
|                        | qRysXreld9Ms8yhMfKH3jT+dn7/596fB+oV/7z/0g9+IP3rYdC/fvhq9E+8X8fSTw/Pfir9w |
|                        | PvzA8n9y5/99S//9g8f3E4vf8Vqc91suao2kavWSpWV8IlyovjjJ/o0bjmu/K13mqsWW7ViJ |
|                        | XWak8UDORmLBQOFfEvOF8u5Vq/VzlXkTDOXatea8pPMU1lJJsNy7qRXO6+eZlPl3O3AuD8UD |
|                        | Mbks5N6LtVs1aqBs5NWplAsi1Z5ui/jjfbKxOVMtlkqtuV2LlX50l9uKKjEFCWUVKLhREgsz |
|                        | R8+NyD4GdLnSnz1jRZfLYIOvjY+uIn/UlkqSlXpXOpK8mt/NMmSTGkoGdJI8kuhz43/TPz/O |
|                        | JB75/j/b4dB//afX43+u0P8/+Xh2S/fFP/fsKxf3k9Nmku6WC8tyZVUsY4mYlhVrKmVeCZLi |
|                        | hSWTsRv779fiou/ujQVfy3JEeXlb8HPqZQTr7coXn9N/K5Iqf0Q+WaILCWlmPgJSldSQcqLY |
|                        | bL4XRRtLSce98T/tnhUEUMzUlM8SonnNfFIlp6IIU/3azApfsLiUU6svZ4Yey7qO5Wyomx5X |
|                        | 9Pbf95fIeI/iP/4Fvl/t/EfAAAAAAB8ax3tc+ze9f93pJ/tH+laSPqL/Rv6R5I1103Hy29Lj |
|                        | 6S/F0M+kELBYPIqGBH/vif9w37IVHV1x30k/Xw/j1BQCV0FE1dK8JF0fDskfJjikfSLV0OU4 |
|                        | JUSfyR9dDskuh8S/Z708X7IYa5sHwAAAAAA3s/1v+T1rz/yrrmFn0lHh+t/yesRdXT3+l/4e |
|                        | +mDu9f/wj9IH9xe/ws/l75z9/pf8rrwfefu9b/wi5shN9f/wkf7IS+v/4WPpe9w/Q8AAAAAw |
|                        | Pu8/v/lzbsA35MeHx7pkiaFfiz94+GZdfMJN+f2E24fSk8kL+8vhaSg+ElKfvE7cvj9Q+npY |
|                        | dxUlHXFdGKqDyWftH93wSuviN9eyYT4rUjBD6Vnd8eF787rQ/HnM+PEFPvf8Q+lk7vjonfGR |
|                        | X8oBQ7j7iwD2xkAAAAA8Od+/S9599c58q7/hcfeBwAO1//CP3ofAfj89b/wxPsowOuu/4Wn3 |
|                        | ocC7l7/Cz6vk//rrv+FZy/Hfeb6X/DfG3fn+l84eTnuM9f/QsD7CAHX/wAAAAAAHPzLW++x3 |
|                        | 6p//+h//1+p2fxPR/9c7350NEt55VKz7x6m++5n59jO/93RX93MZP/nJ3+4eZbJ/fQoeCgUv |
|                        | C397zd/hm9bjqP3sADSfH+PA8n7nMNra/mOroW8ev5HtfKD/Z0Q/qT6Xv6Rfnd7Y2T59fX9x |
|                        | csPWNzU+ld37rlwt+7vH2bz/T+ibgAA3mz4loh49D4Cv/TlRPff7+9RJHmfU3xtLY9efXhRu |
|                        | om3f320v6ORPxgR/+5W/8FhTh+8e8Bd7e+HJHmfiXxt7d+7+UjjTc1/eXRzj6MvVistGADwp |
|                        | 8X/h2Pma+L/Owepu/H/LWcZ7yX+/4ukHMooH+8n++7Hr4KkV8uPZrqrXg1UVz25dizzE+U2F |
|                        | v/NkeSN8r8c5S3IR//szeOfP7r5boSjd4/J/ySFDkVCT3/k/fnR0/vL8cOlo9uH5Xi1DOLK3 |
|                        | xu8X4YvVj2NGgDwDvH/4avWb1b8jx7KRL/q+B87FIkR/wEAX9f4Lx8eyO8c/985F/3lv///8 |
|                        | 0OZn7/x/f/bmxPee/9fCfmDCb8S/GLvxP9+/30HknfPwzfWHn5N9kEJv4/sw+/3360gefdXf |
|                        | KD2/U0XP1u7EvQr8S9a+0eHIh+9ufabGzzerz26rz36RTMvHx+KfEzmBQDePf4/HDPf1/X/W |
|                        | 84yjt7HWca/SMlDmeTvDtf/v/vjrv+v3tv1//NDked//PX/Fdf/AIAvJf4/fNX6zYr/Lw5lX |
|                        | nyyn+z7n3xV8f9XhyK/Iv4DAL6u8f/h942/WfE/dSiT+qrjf/pQJP3VxP//KeUOZXK3m+p+/ |
|                        | T9e6ebAsl+3Jv72SPrsSE5GAODbGf8fztx+s+J//lAmf5j6+7OvJv7/L+n0UOQ0sp/qKHJ/O |
|                        | f7G1N21ZU/uLsrNkvzkSPrcyC8YgP9JKhzKFL6qs5HSoUyJsxEA+DrF/4f7Tn2z4n/5UKb8V |
|                        | cf/yqFI5esR/6uHMtWvKv43DmUaxH8A+Po43n//n+R9B8Ab4v9bSxw92X9zoOR9e8Dr+18fv |
|                        | lJAiuy/U1DyvlfgteV+/PkvG2ADAQDwHxL/H47d7xL/Y/tvBJa8bwV6bYkPX/dVQdLJ/ruCJ |
|                        | e/7gl471Q/5Ah8AAP7D4v/Dsfvo7WcIR796y333firNRBT3ruj90mAf01UR/a9FXLfEtX7kL |
|                        | XfL+7G0FCV1yb4zNQAA+GLx/+Gr8HeL/w/fd+9t8f/hu+UR/wEAeP/x/+Gc/Lu9/+87lPA99 |
|                        | P6/In577/wnxG9F/I1Jzw5TPXt4qvC9rEFM/N3zv30qrxbvd1xMdXKY6uThqaJ3poqKwoHDV |
|                        | AEyFACAb1v8fzh2H739DEFc/z98371X1/9Xr73+f/huea+u/6+4/gcA4D3F/4evwt8t/j983 |
|                        | 723xf+H75ZH/AcA4P3H/4ffT3+3+P/wfffeFv8fvlve6+J/+i13uJOl1f5zhANRg/3aWgEA+ |
|                        | POO/w9nxt8t/j98372H43/2LXfLOxZlvKnX+1g+ecM5xMP3uHv9OcTD96XjHAIA8G2O/w/3c |
|                        | Xu3+P/wfffeFv8fvlveu8X/h+9x9/r4//B96Yj/AIBvr1zz348etf/7UbNZrF8pyaSSahdyc |
|                        | rOWKcnNYvY0Jxer7VwzU0hVxeN6s9auZWpl70GnmM215NZ5vV5rtuV8rSnXa61iV84Xyzm51 |
|                        | Wu1cxW5laukqu1iplUv51KtnJypVdupTFvOFlsZuX6eLhdbhVxzP3GrnssU88VMql2sVeVW7 |
|                        | byZyZ3IYg65OwVFlWJ2+aL3sCoWolhJNXtyp1Y+r+RksTgZ8SLatcMMb+sqVsWzyn62J2xuA |
|                        | AD2fnts645ur1TXsEy/MTh+Lh/b/olq74KDpH38TD4eW45rqjPdG2OtdFubWsuBX7NM17amU |
|                        | 932B71Sjq4tbcPd+ke2tZw7ovCvjwf6UF1O3ePfiPG2OhsYzuSmBtU2/MGDsDf1fNmfGprfm |
|                        | K8i3mhvkDoz/DPVNIa64/rnqjv2RuSL3UrOG2uYjquamu53t/P9kt0sz71xh7pua1JD3sipp |
|                        | anTlxUp8dBJKHySiJ4kI6/Gvtsrnk9VTZ/ppiuK/fZYXanGVO0bU28d7CxzP7FprdTjT29ez |
|                        | FRdmtrYb5gDfSNGBl+97Hes71B4om+dfY3B/W9rrpuOM/YGe5N7D21HlVNCOlzdqRllq4Vy3 |
|                        | tNsqpFKe4NTjWwmWIsnw7tiLzcdNZK18kV2lTrrLfRRM9eIlKu55KUzu7Qn23H6crvYjpcX9 |
|                        | VaqNWhc+0JL050lu9nGRkkbxWHL12ku2qtBqzQMhYrr8dY3Ko5rq0QoV6rVQ9lksqXvqrHrs |
|                        | bM8i19sV3Z/tdZXqViq1otXM+nuslPQ6/VIaTHTA9WSO1MS41Fpu+kU26l8eDOLleaLgS8Qz |
|                        | OyakambLNrJaNfsmCt13stmG/noWrtIaGEjo+bmvkbMCF0O9Otcuxfqn1lLY74I5a3apu+Ef |
|                        | aF5PjKMDru17LrX2pi+6LA/dweBemm9a5V7oWq54Ev5VtV65CK7y15fXwTcZi7e69TLynodz |
|                        | gTqeqLdjYU2gYuqmazou6XWi4Sz5iiuxifNTTPT0814Wy+sZNHstMl/HRi2rrmWfbLS59rJz |
|                        | NSCsdjJTNNCseBJeDSf33y/w4llj7zNenW75YMvbveXT2+bzM3OMnu5s+wb6US3TX16O3Lyc |
|                        | mToXuNXNW+PPrRC0RrFqL5o3RP/QF8ZYvRMnc8Nc3RouzNj33YGqlfMtiyvSR8HRMmAN+zTT |
|                        | zlMAt9KGRFlRAzzt0UcfS7PxOHHmKu2G5gZG33widy3luZAtbcvjl/cF4zH48FYIhGLBqOJa |
|                        | CQUT8RfvDh+VClWcv6Objvi2PNcVk6Cjx75/e8y6aP7C+LqGzfwMg4OjdEnsjZWbUd3XxwvH |
|                        | b/qaIbxutpezsVWTWcoQmfO1KyBONA9l+N9w305Pms4c8sx3P2EqisO3GMvlH8iD42p7h2RX |
|                        | xzfrf34kfALOaPO3aWty+p0KjvL/ty2NN1xZGvpzpeubJiuJavy1Bp5MxHFzx19uJzKQ8uWR |
|                        | SQX4Vt3xuLgKpZGPszcMA0xmeMsdefRYSbicCxm/lx+/DuxCnTZr8qBlWoHxDwDrybxH8qei |
|                        | KGPP/3iK7gvlkks1+TLX8W3NZ84Y7GGf/HzQN8wA33VGXsre3+u98QZqwNrrdtPZXdsOGJli |
|                        | TXshU/V9lrmft3eWZfBk9hJWJ57p7Smt0Hk8744YVmKuSmhk2BELrdbz8WTsevOneeBQH85c |
|                        | k4O52VzdXAiInNgrKtuwCdGBJRQNB5Rgo9+ISZoj3XZmg7uVjWwdMd87MqaLabQxdLpsveNS |
|                        | Y58iP/TrexY+6GaNRPnsQNHFq1jYImZ7V+IKpqRYV6LkvpADLGWo7HsnS5eLV1j6pzMtyf7i |
|                        | msilMtrXR7Y1lw0ufncst39i96/0mfeKE01ZUcd6qJGW5+J88d9BSf7BivWgKY6uuy9Kr82F |
|                        | A3UmjryWHXkvq6b8v5kQZxhivVoWzN5Lk5f1JEu90VjNi3Z2c6mhjlxxHy8pd3q+zUasOZuQ |
|                        | F07+231SMzTf1gDfjHM/3ISMU3WEjNxb5fJf1gX3vqTbze7LHaHpVir6nStbh1RUuxc4rUsN |
|                        | W+veqRvvA36RZq3dyDzj8W6F+fQX37jvlu72J5eA5fvDttvX6EsTsdMR2wD0Z51e7+aUmJLi |
|                        | D83Y57JN4soizYsP/EKHN+MOn76iby1lvJM3R5m5q1x0QwPbcxbFlnfaPp8v+VEQ5xPDXXfo |
|                        | gx3vK/pZj4ncu8wF9nqu6phHmamiknmYtDwblHxam+XfM/bl8SutF6vT9T9YnsntoHpobATK |
|                        | BczuWor5xeLfjvZuTn1jpq2vliKXUU0h60sTkbFFKo4QspTdS2L9q2ObN3bMyxvydfiylJsg |
|                        | 2dilxq6a9EYDzMSF5SubYjWem/l3S6n4dwrIFaf2FGOUy252DqW06lWsfVMvii2C7Xz9mF2F |
|                        | 6lm03u7OteSD+8fZ4veu8biWV5OVXtyqVjNPpN1sepETfrGO8o43qIa3mrVBydyS98fB+5t1 |
|                        | sPRXyyWM9c1Y2ho4gWao6W3m428az3TiwZz3Z6JMCA2sTgwiKPa1JgZ7v6K3DnM7HOvTuzeo |
|                        | lrvYDAQ+55rzPTb57ptm9btE8u5feRsxU75SFxhiJk77pV32ew8efr8kTf3w4735NfH+71m4 |
|                        | x0ovEOc951rx795ejPZodVeeS34iTfmmax5M3n2ssU/E617O7XUwc1cjeGhhPzihbjKuerrI |
|                        | 8O8ujo+jPS49vbVE4/lnMzUiS4OoM6Tx4e4Z/QD945dj595YfbJcTzoXRMnnj59OYObdl5r5 |
|                        | Wzbsu/PWN9cHZZV/HP78gtvbZyICa4Mc2g9eXqvrFhs/WS/EuWfvziszZNcrltste/Pc7/iV |
|                        | MPRXw49rMZHr3vxujm499LvFvU2njgMz+ZiuW435snLB6a1vlnA/T7rXe7frhtxTnDvGOOdD |
|                        | jyTH6uPn8riAC+evapPPDnxdiL9yeOPnZdb7PnHzs1WFI/+m/lY/lgcXW6X5u6G3ZcR6/pzL |
|                        | +3x51vM41e1fm6JP7s1Ax87XqWvKnq8Piz88P66Ht4s/G0De/RyrAjNtWztibhMnehP5bGoT |
|                        | JxxiUjo6l6zFyeuYtcRAfUmNB+io3U/HPqVk/CDi7wPWgHvtf3py/sFgthUHI+/7OglYtXd0 |
|                        | 99Hv/XW3/PDelMHM8P89Bv4kr7AEt9r4V/BpYg4y9qf+O8PyY8e/fbYcsSmEWdumnt7heK9k |
|                        | eOFVLH37h97X2jqFb9a2lPv7ZybOP3qHU8lGHueCCaCgZUSSJ23C1cJPSJWSD+mhJLJiBKPJ |
|                        | zVxCjwYxGNhLRYeRoYBa+W31OVCjU1W0dDCH/QP19vNdBVaqvr42p959X7lcBGyxtPddhoyj |
|                        | UAkEU1Gh5GIfzDsK/7IMDzwJ7Wg6tdCej+hxGIhNRr9L97+6i3plWOMXsRUPR6PKsogEY2qy |
|                        | lCcqgbDkWR/GAuKMeKsYJiIaIlwOPHLl1OJaCxOJZwXISUSjyTC0UR8/7brzSqy7MP70bq2f |
|                        | 4vsdi3dvt97/Buv7ECfT62tt+b3hX/z6Te7uaxVVxv7vXf2dVu0mDds/WD4HV+l389bJQAAk |
|                        | P8n/0/+n/w/+X8A5P/J/5P/J/9P/p/8P/l/8v/k/8n/k/8n/0/+n/w/+X/y/+T/AQDA1yj/v |
|                        | z+fF9f1jrNPFqrh9fV5Z3WaqK+9M6Tl8pBnjMSGqqKFwv5YMizO4vpK0K+G+31/tK/1o7oai |
|                        | odDyj5tfycPfnUvD77PXO5z17/+7fH+RJZ89TcwX33b4UJsOe/pbfb6Ze76N+/cZeTwxvvV5 |
|                        | ztEXL3s43A7V1rKN62lfHqnbbyhCdCtACD/T/6f/D/5f/L/5P/J/5P/J/9P/p/8P/l/8v/k/ |
|                        | 8n/k/8n/w8AAL7k/L84GxlYsytHnHZ5o2fhariYG4yV6OVkZPbqTv7y7CzaDlrX4bGtbdpKN |
|                        | zIqt6Z6+nLWt5qji/hK0aObZC58vrHLtegiFO0WlxOlvvTp2VEpvB6o1810K7Man56X3Ny0Z |
|                        | 8bsaF9d+HqBdXtWzIx2jU48r/tSRieei8Rz15FC0y0Y7dkgPErqo7HjhIPbaaG1rUdr5qoT9 |
|                        | 001K3SRCBe3k808V9yovVn7PKzOtcraypX1TKswctL18+ooM8y0lZbeHmnb0NJXMcKTWS4Wc |
|                        | qu7036/cJ3ol2vps9zpzm1bhXxuZYdShfIoVGgkncS5s9Q6HWV4Vmj5AqF5a1C1rneNi6wxP |
|                        | p03g1rRV0xrOSUyuFjmxrF5IrnpT6fV1Dzstgqr7LSb2iqNzZl7MetMUmnt7GI3SY9qRiRpX |
|                        | gz79ctL1Tfrnvtm1WG560TM82n6Ypg7nWTU8E6LJSeLaVo5z4Vmjd2gut7ZvYTPVlqj0NrWV |
|                        | 7ueu61sM2ogUjX6l05pt81WtEAxFr2OzZzmpBpRFutxalFZONFKMrDIXY9Cm9U4uKnOUrOJH |
|                        | g3kT4eXvvWlNhqbZnZeyzQyymkpMpm4WmkTKu0iu9EyMyuUp91JsqGdpS5LZ+lRd7ddX14UJ |
|                        | uO+73SzHKjznB3Nm43Twexs09Dyy1Uv2XAj1xF3Vp90QpPaKhAPrGbbi9h4piqF00UpHVpdx |
|                        | soJbRVxwoNupx921fTOiqT7lZoxtNRhv2VUnbY6cKaNci6zCNayw0Zj4jvr6e3i6ux80MsPl |
|                        | LUV2uUqqdpZfHFqTHrp4mJzHQ62Bo0XdF+hUwLdV2gpdF8h/0/+n/w/+X/y/+T/yf+T/yf/T |
|                        | /6f/D/5f/L/5P/J/5P/J/8PAAD5/zfn/0fZZbYyjUQD3fAw3WulN+NK2edmE3Flen268fVHi |
|                        | Yzby0Y30V1VH/YX14tqYNPYrgdGqNI5W1hmtjCtzC8bw1g6ftZK1vTFMJjoZdVK/vJsEV4GO |
|                        | istdTmIjbPz5kXZuras2HK7yzrWKD5SChfteLIyqF5mJhc7fdVPRiKJzlafaE5jOFjForNmv |
|                        | beqlFP5M81WrrX1zjEuGnYknLDaoVmlfladnZaXk6R+aQ/m9XLMiE2HzWosthmW1IoxOk03W |
|                        | n2lEV3W6hM7nunNA7N1ednbzKfZaeu6dmq7603fbE4jhq8dPXc3U3OgTH3t5CjYGp4vx8lZN |
|                        | D8Nz8JGsL8M9wqzzjzS21wuep18eXphJ3fRdVOJOWPnelK/2NYmTXNS7yyq5+4ymYqkS8PIq |
|                        | RYJzOxF7bo17C6TvkB+3S8q9V7HScXs8mhWvq5WtGGxnDrPLHIDX1pZBHcJ63xqJLWpo0+UY |
|                        | NuMOKHJOlFwDVcJLZtlpTva5AqBWHblWH1Lv6w6TqPbN8adi+V4lasol9fJsS+iKL5IKBKYx |
|                        | yvlyVmsVO7P4oFdZ1JPZbvl5arVnpXOM75Ya2knwtpsWOut0sqk0Qna1UY7vcjk09Zg0C/NV |
|                        | 31nMy+HjJXbG4a620Y0M8slz1Z63owHHV90HjTHs23EXQUjqUF1UbLjzaxrz7vRrBW47gwXp |
|                        | dNluhseRS6K4c5pPtgpLnNWvLccudXuWa6pl5zr3nQcVMvb3GlvpHd3jr1S9NPi5Vk/XRlt2 |
|                        | oOBue4H1d2Fsh6qNXXUUrVmq2Bb5P/J6pL/p6WQ/yf/T/6f/D/5f/L/5P/J/5P/J/9P/p/8P |
|                        | /l/8v/k/8n/k/8n/w8AwJ9Z/p+7cAMA8OcX//+4/n95K59K5/rt9K5cm2jNpr68sE4LScPcj |
|                        | LqVjjrd1VrX2eQkaqtTRdn0Cu1lpmCPz87cQnhdXNUS3eq6bjUbnUL9eteZlbvtYH27WHeyw |
|                        | dluaeaXRbOTTF0Xg5lS0Vg2hqeD/mJrreeasgoouXgl5pxPG8mLxuoiHYqki6Xh6XK6Lm7Lg |
|                        | WjcdtTSur6LVc+0UjA/c0paNNF3+tmGO0/HIzlHKWZais9pLROFlpFKm+nVxeks6YvF5hkjV |
|                        | 0xpw3Bs5sxH8e5mN5zYM58vpLmB7Jl6ndTzm+lFNRUNr434eNjs+EauFc+6U72SKajninthR |
|                        | 2uhbSiw3Zlqu7h0LufqqhI10+WLbLLYjKqV2LI/OF/ozZJ5Fjsr75LdYnugrbX5Lhp0eq1A5 |
|                        | mI3XI1c5XpUy8XNZWPWUqahpbNZR6vdWKuyDVwmnWl8kbXLy1ChHTS6m8qkeropbQLrotl0B |
|                        | qNhsa0pgU5I7/Ry9vjU1GpxV4mVG5lksDDvOJNNLhLfLNNGORjo9Fv1YbGXczpKcNLpXZans |
|                        | ahqT0P1TmRUDg/zpVBz2T21g0qpHsos+oNU4qztC55fno98zYWZ7uzO6uFloJ2oOJFwZRNWV |
|                        | +FUMFIbxHpapbXcZUdn3YBrqim7ZZxN05N24drum+G6U5vsMmqgv+gFhkarHdlu4oHArlNOx |
|                        | qLF0K58ftlITmbp9fr0fH15euY0LsxhrxsrjrvXjVn/2shXLztn6qWVOjXNyKC4bAa1dDi82 |
|                        | m7b8fN2XFuP+u3T9HaebBmjcqF5Wm8MKuFFS6P/H7266P9HS/mT+//Nbcvrn3N1OIK8LTty/ |
|                        | M3sMfjbYy9HYGj6IevhvYjDarg50t08u1kJwbAWUUNKzC9WQMIfCYeT/kQ0kvQng2GxIdXYM |
|                        | DLYHym9TkBeeVedR6PBaLA/EKtieHf/M+aryNVgrM29gYeZ31QVPOyE+35Eh2XQvR4XYuzVT |
|                        | NWu1MHA63jhTRDXnquh52H9ua4/TySex/ZH8Jm7vNkbb6uyVs6rSj6/RCtjePPq7ozoh/yRe |
|                        | DDm93JP/r6W0AeJgWhWkb5YON4xAQB849H/n/7/9P+n/z/9/+n/T/9/+v/T/5/+//T/p/8// |
|                        | f/p/0//f/r/0/8fAIBvYf8/stkAAPz5xf8/rv9/N5tWY/pwHkwWQktltIv6hvnNwqeW4+lQY |
|                        | JReFtXNptpLdWI5qxjpZsdNOx0INgurWtiobdvZQNoaGc2SWVa3dr22WywWy8hwV0nuNsmIN |
|                        | UkY21rqMpYNp+cF32qVOt8sx91crXXWz1QX2eZpaTqYzky3bG3L7vxy0an0r6eJs0lifG7X1 |
|                        | Uwpus7Xis1ezdErzd21Gj89O7dz6nBWuSg5thGzxuYq0vBt86fritbTLcUXauZ6akvPB/LVm |
|                        | d1MdpzNhc9M5i7WrVE3OhzGS4PmzL7eVUrdVqU9tTrlnNrVesl6aa2vlYh+fW5XLxdpN3ex6 |
|                        | ow6i5JVHgTbkdNx4dJpWLGdNtcq5ub6rGylWpfOdSc/NjqZlqYVZpnmMjAI+87LSioaDvlK9 |
|                        | TMjfBrMRYrVeC+7S+9WamtllB132mgEwqOF0Qv35tHFpVHZlCbWZFfMptRGOt0YX+jTy1Wsm |
|                        | LDtWnbVLDq7sJ525xflzmiWaGXDvY7VzqadrE9N7ebFaK1kThfLulZfzRurdE6JpLZdd96c5 |
|                        | pONhD7fJNXAeWPe86mDkq1Xe438qJYLLfqrZC5YXs+u80M7PQuHjfA2kRwEAs1JspEdO+HrS |
|                        | iFWXju+xnl+3jmPjDZRs1tM+iKJft8YbnyX6sWFlasGzeLgNFSsDeKT8UVlfF1e6pVs9FrJ2 |
|                        | 3qhZEbPzWpvF+iWsuFmpBIZFofn/XXVjtV961LGOsuXisqi66vOCsPaTPM164Fec7UdduoXk |
|                        | bWvN0m0LTHKyRR72W2iWY5GZ9VsvtV21/T/p1c3/f9pKfT/fzj+0/+f/v8AgD839P+n/z/9/ |
|                        | +n/T/9/+v/T/5/+//T/p/8//f/p/0//f/r/0/+f/v/0/wcA4FvY/49sNgAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
|                        | AAAAADgG+D/A3qWSTwAQAcA', u'swap_mb': u'0'}                              |
| instance_uuid          | 46fa1c23-6931-4b10-a3bb-5bcb5ea27321                                     |
| last_error             | None                                                                     |
| maintenance            | False                                                                    |
| maintenance_reason     | None                                                                     |
| name                   | None                                                                     |
| power_state            | power on                                                                 |
| properties             | {u'memory_mb': u'262144', u'cpu_arch': u'x86_64', u'local_gb': u'837',   |
|                        | u'cpus': u'40', u'capabilities':                                         |
|                        | u'node:controller-0,profile:control,boot_option:local'}                  |
| provision_state        | wait call-back                                                           |
| provision_updated_at   | 2016-11-29T20:39:10+00:00                                                |
| raid_config            |                                                                          |
| reservation            | None                                                                     |
| target_power_state     | None                                                                     |
| target_provision_state | active                                                                   |
| target_raid_config     |                                                                          |
| updated_at             | 2016-11-29T20:39:10+00:00                                                |
| uuid                   | af6368a9-07b8-45b1-9188-56e45df12f1a                                     |
+------------------------+--------------------------------------------------------------------------+
[root@director tmp]# 

