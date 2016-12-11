

## Symptom 

7393 2016-12-07 17:23:34.568 14076 INFO nova.osapi_compute.wsgi.server [req-5a688b2d-5211-4439-94bf-d1160895e28f 3c446ce467ce437bbe12b224adac4a27      fe50aad050494868a67d8d05d5313869 - - -] 172.19.85.19 "GET /v2/fe50aad050494868a67d8d05d5313869/flavors/detail?minRam=16384 HTTP/1.1" status:      200 len: 2112 time: 0.7733791
7394 2016-12-07 17:24:10.257 14076 INFO nova.osapi_compute.wsgi.server [req-57b3ab59-6e40-4704-8b36-544d1fa1ffed d27e186502944e06999726e454b80702      2a91aa4eedba4cf28631d6f0afb66e99 - - -] 172.19.85.19 "GET /v2.1/2a91aa4eedba4cf28631d6f0afb66e99 HTTP/1.1" status: 404 len: 240 time: 1.23598     72
7395 2016-12-07 17:25:51.356 14065 INFO nova.api.openstack.wsgi [req-717fcf8e-c892-4a79-9523-f9de89f15c81 3c446ce467ce437bbe12b224adac4a27 fe50aad     050494868a67d8d05d5313869 - - -] HTTP exception thrown: Block Device Mapping is Invalid: failed to get volume 5a8fee03-7fa6-4763-bee2-0a32dc5     effd3.
7396 2016-12-07 17:25:51.358 14065 INFO nova.osapi_compute.wsgi.server [req-717fcf8e-c892-4a79-9523-f9de89f15c81 3c446ce467ce437bbe12b224adac4a27      fe50aad050494868a67d8d05d5313869 - - -] 172.19.85.19 "POST /v2/fe50aad050494868a67d8d05d5313869/servers HTTP/1.1" status: 400 len: 332 time:      0.8773439
7397 2016-12-07 17:29:33.605 14056 INFO nova.osapi_compute.wsgi.server [req-1751b0c3-05aa-4c87-8add-f66b7f8639d5 58382fa1563646c5bc0f347a8dbdef4a      041d997e145f4cfcb14a47d1540022f0 - - -] 172.19.85.24 "GET /v2.1/041d997e145f4cfcb14a47d1540022f0/servers/detail?all_tenants=True&changes-sinc     e=2016-12-07T16%3A19%3A32.968223%2B00%3A00 HTTP/1.1" status: 200 len: 258 time: 1.0044761



