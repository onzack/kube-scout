#!/bin/bash

STARTTIME=$(date +%s.%N)
echo "Start script to scan images"

# Define global varialbes
i="0"
LENGTH="0"

# Define global functions
ECHO_DURATION () {
  ENDTIME=$(date +%s.%N)
  DURATION=$(echo "$ENDTIME - $STARTTIME" | bc -l | sed -e 's/^\./0./')
  echo "Pod collection duration: $DURATION"
}

echo "Get images"
docker images --format '{{.Repository}}:{{.Tag}}' > /home/kube-scout/all-images.txt

for i in $(cat /home/kube-scout/all-images.txt)
  do
    echo "Scan $i"
    /opt/trivy -f json -o /home/kube-scout/trivy-scan.json $i
    echo "Remove fist and last line of scan-results"
    tail -n +2 trivy-scan.json > /home/kube-scout/trivy-scan-headless.json
    head -n -1 trivy-scan-headless.json > /home/kube-scout/trivy-scan-head-and-tailless.json
    echo "Store scan results in MongoDB"
    cat /home/kube-scout/trivy-scan.json
    mongoimport --host $MONGODB_HOST --port $MONGODB_PORT --db kube-scout --collection trivy-scanns --file /home/kube-scout/trivy-scan-head-and-tailless.json
    rm /home/kube-scout/trivy-scan.json
    rm /home/kube-scout/trivy-scan-headless.json
    rm /home/kube-scout/trivy-scan-head-and-tailless.json
done

echo "Clean up files"
rm /home/kube-scout/all-images.txt

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