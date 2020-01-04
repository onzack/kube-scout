# Pod Collector
## Comment
For the moment, the pod collector is kept as simple as possible with just a few bash scripts.

## Start the pod collector
### Needed environment variables
* MONGODB_HOST -> The FQDN or IP of the MongoDB Host
* MONGODB_PORT -> The Port on which the MongoDB is listening, like 27017

### Start
```
sudo docker run -tid --name pod-collector \
  --link mongodb:mongo \
  -v /home/domenic/.kube/config:/home/kube-scout/.kube/config \
  -e MONGODB_HOST="mongo" \
  -e MONGODB_PORT="27017" \
  kube-scout-pod-collector:v0.0.
```