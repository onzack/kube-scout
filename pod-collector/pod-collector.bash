#!/bin/bash

STARTTIME=$(date +%s.%N)
echo "Start infinite while loop to collect Pods"

# Define global varialbes
i="0"
LENGTH="0"

# Define global functions
ECHO_DURATION () {
  ENDTIME=$(date +%s.%N)
  DURATION=$(echo "$ENDTIME - $STARTTIME" | bc -l | sed -e 's/^\./0./')
  echo "Pod collection duration: $DURATION"
}

echo "Get Pods via kubectl"
kubectl get pods --all-namespaces -o json > /home/kube-scout/all-pods.json

echo "Determin length of items array in file with all Pods"
LENGTH=$(jq '.items | length' /home/kube-scout/all-pods.json)

echo "Create directory for temporary store of files with single Pods"
mkdir -p /home/kube-scout/single-pods

echo "Start while loop to extract single Pods and store them in MongoDB"
while [ $i -lt $LENGTH ]
  do
    echo "Extract single Pod"
    jq ".items[$i]" /home/kube-scout/all-pods.json > /home/kube-scout/single-pods/pod$i.json
    
    echo "Store single Pod in MongoDB"
    mongoimport --host $MONGODB_HOST --port $MONGODB_PORT --db k8sresources --collection pods --file /home/kube-scout/single-pods/pod$i.json
    i=$[$i+1]
  done
echo "Remove directory for temporary store of files with single Pods"  
rm -rf /home/kube-scout/single-pods

echo "Remove all-pods.json file"
rm /home/kube-scout/all-pods.json

ECHO_DURATION

exit 0