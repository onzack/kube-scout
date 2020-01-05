FROM ubuntu:19.10
LABEL maintainer="dmlabs"
RUN groupadd -g 10000 kube-scout && useradd -u 10000 -g 10000 -s /bin/bash -m kube-scout
RUN echo "BUILD INFO: Update base image" && \
    apt-get update && \
    apt-get upgrade -y && \
    echo "BUILD INFO: Install needed packages" && \
    apt-get install -y --no-install-recommends tzdata curl ca-certificates jq bc mongo-tools docker.io && \
    echo "BUILD INFO: Install aquasecurity/trivy" && \
    export VERSION=$(curl --silent "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/') && \
    echo $VERSION && \
    wget https://github.com/aquasecurity/trivy/releases/download/v${VERSION}/trivy_${VERSION}_Linux-64bit.tar.gz && \
    tar zxvf trivy_${VERSION}_Linux-64bit.tar.gz && \
    echo "BUILD INFO: Remove obsolete packages" && \
    apt-get purge -y curl gnupg gnupg2 gnupg1 apt-transport-https && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY --chown=kube-scout:kube-scout pod-collector.bash /opt/pod-collector.bash
RUN chmod u+x /opt/pod-collector.bash
USER kube-scout
WORKDIR /home/kube-scout
ENTRYPOINT ["/opt/pod-collector.bash"]


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