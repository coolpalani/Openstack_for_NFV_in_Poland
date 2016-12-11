

```bash 
2016-12-02 09:24:38 [ControllerPrePuppet]: CREATE_COMPLETE state changed
2016-12-02 09:24:38 [ControllerPrePuppetMaintenanceModeDeployment]: CREATE_COMPLETE state changed
2016-12-02 09:24:38 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerPrePuppet-l2t5nm4tt5ut]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-02 09:24:38 [ControllerPrePuppet]: CREATE_COMPLETE state changed
2016-12-02 09:24:57 [ControllerArtifactsDeploy]: CREATE_COMPLETE state changed
2016-12-02 09:24:57 [1]: SIGNAL_IN_PROGRESS Signal: deployment succeeded
2016-12-02 09:24:57 [1]: CREATE_COMPLETE state changed
2016-12-02 09:24:57 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerArtifactsDeploy-tjglktr5he2l]: CREATE_COMPLETE Stack CREATE completed successfully
2016-12-02 09:24:58 [ControllerLoadBalancerDeployment_Step1]: CREATE_IN_PROGRESS state changed
2016-12-02 09:24:58 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah]: CREATE_IN_PROGRESS Stack CREATE started
2016-12-02 09:24:58 [1]: CREATE_IN_PROGRESS state changed
2016-12-02 09:24:58 [0]: CREATE_IN_PROGRESS state changed
2016-12-02 09:24:59 [2]: CREATE_IN_PROGRESS state changed
2016-12-02 10:26:51 [1]: SIGNAL_IN_PROGRESS Signal: deployment failed (6)
2016-12-02 10:26:52 [0]: SIGNAL_IN_PROGRESS Signal: deployment failed (6)
2016-12-02 10:26:52 [1]: CREATE_FAILED Error: resources[1]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:53 [0]: CREATE_FAILED Error: resources[0]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:53 [2]: SIGNAL_IN_PROGRESS Signal: deployment failed (6)
2016-12-02 10:26:54 [2]: CREATE_FAILED Error: resources[2]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:55 [ControllerLoadBalancerDeployment_Step1]: CREATE_FAILED Error: resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
2016-12-02 10:26:55 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah]: CREATE_FAILED Resource CREATE failed: Error: resources[1]: Deployment to server failed: deploy_status_code : Deployment exited with non-zero status code: 6
2016-12-02 10:26:55 [ControllerLoadBalancerDeployment_Step1]: CREATE_FAILED Error: resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
2016-12-02 10:26:56 [overcloud-ControllerNodesPostDeployment-arat4bdirlwy]: CREATE_FAILED Resource CREATE failed: Error: resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
2016-12-02 10:26:57 [ControllerNodesPostDeployment]: CREATE_FAILED Error: resources.ControllerNodesPostDeployment.resources.ControllerLoadBalancerDeployment_Step1.resources[1]: Deployment to server failed: deploy_status_code: Deployment exited with non-zero status code: 6
Stack overcloud CREATE_FAILED
Deployment failed:  Heat Stack create failed.

real	91m1.914s
user	1m56.202s
sys	0m12.559s



[stack@director ~]$ heat stack-list -n  | egrep -i "fail" 
WARNING (shell) "heat stack-list" is deprecated, please use "openstack stack list" instead
| ffaaa26b-e1b0-49af-a604-90aa73188536 | overcloud                                                                                                                                       | CREATE_FAILED      | 2016-12-02T09:00:06 | None         | None                                 |
| 76bf541e-baea-4d84-9f22-c4d65a790e75 | overcloud-ControllerNodesPostDeployment-arat4bdirlwy                                                                                            | CREATE_FAILED      | 2016-12-02T09:24:12 | None         | ffaaa26b-e1b0-49af-a604-90aa73188536 |
| 9238cea3-b0bc-49c6-9b91-1a66f5df63d0 | overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah                                        | CREATE_FAILED      | 2016-12-02T09:24:58 | None         | 76bf541e-baea-4d84-9f22-c4d65a790e75 |
[stack@director ~]$ heat resource-list -n5 overcloud | egrep -i "fail" 
WARNING (shell) "heat resource-list" is deprecated, please use "openstack stack resource list" instead
| ComputeNodesPostDeployment                   | c41f84f0-da2a-4afe-bc9e-899c73de1cae          | OS::TripleO::ComputePostDeployment                                     | CREATE_FAILED      | 2016-12-02T09:00:07 | overcloud                                                                                                                                       |
| ControllerNodesPostDeployment                | 76bf541e-baea-4d84-9f22-c4d65a790e75          | OS::TripleO::ControllerPostDeployment                                  | CREATE_FAILED      | 2016-12-02T09:00:07 | overcloud                                                                                                                                       |
| ControllerLoadBalancerDeployment_Step1       | 9238cea3-b0bc-49c6-9b91-1a66f5df63d0          | OS::Heat::StructuredDeployments                                        | CREATE_FAILED      | 2016-12-02T09:24:12 | overcloud-ControllerNodesPostDeployment-arat4bdirlwy                                                                                            |
| 0                                            | d9a70ed4-36ba-44b3-a4be-8c01dd02c2d7          | OS::Heat::StructuredDeployment                                         | CREATE_FAILED      | 2016-12-02T09:24:58 | overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah                                        |
| 1                                            | 7cd6f170-47e7-4141-9289-0c823edaa517          | OS::Heat::StructuredDeployment                                         | CREATE_FAILED      | 2016-12-02T09:24:58 | overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah                                        |
| 2                                            | a2a12aab-b5c1-4c1d-a27a-bf76775d5a2a          | OS::Heat::StructuredDeployment                                         | CREATE_FAILED      | 2016-12-02T09:24:58 | overcloud-ControllerNodesPostDeployment-arat4bdirlwy-ControllerLoadBalancerDeployment_Step1-xoz3bymhxrah                                        |



```




# Solution 
please refer the link: <https://access.redhat.com/solutions/2385241>



















