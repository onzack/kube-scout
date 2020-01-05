#!/bin/bash

STARTTIME=$(date +%s.%N)
echo "Start script to collect information about Pods"

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

echo "Start while loop to extract single Pods and store them in MongoDB"
while [ $i -lt $LENGTH ]
  do
    echo "Extract single Pod"
    jq ".items[$i]" /home/kube-scout/all-pods.json > /home/kube-scout/pod.json
    
    echo "Store single Pod in MongoDB"
    mongoimport --host $MONGODB_HOST --port $MONGODB_PORT --db kube-scout --collection pods --file /home/kube-scout/pod.json
    rm /home/kube-scout/pod.json
    i=$[$i+1]
done

echo "Clean up files" 
rm /home/kube-scout/all-pods.json

ECHO_DURATION

exit 0

#   Copyright 2020 dmlabs.ch
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.