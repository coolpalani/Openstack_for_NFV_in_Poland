
# How to trouble-shooting after overcloud deployment failed.
(14:39:29) Robin Cernin said to everyone:

## Source stackrc file
source $HOME/stackrc

## Get failed deployment and print output
for stack in $(heat stack-list | grep -i failed | awk '{ print $2 }'); do
  for nstack in $(heat stack-list --show-nested | grep $stack | grep -i failed | awk '{ print $2 }'); do
    for resource in $( heat resource-list -n10 $nstack | grep -i failed | awk '{ print $2 }'); do
      deployments=$(heat resource-list -n10 $nstack | grep -i failed | grep -i $resource | grep Deployment | awk '{ print $4 }')
      if [ ! -z "$deployments"  ]; then
        for deployment in $deployments; do
          heat deployment-show $deployment
        done
      fi
    done
  done
done

(14:39:42) Robin Cernin said to everyone:
For the debug of the FAILED resources.




# monitor heat stack when deploying 
for watching the progress
watch "ironic node-list && nova list && heat resource-list -n10 overcloud | grep -vi complete"

# search any errors on node 
journalctl -u os-collect-config
os-collect-config --force --one-time --debug
