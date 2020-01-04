FROM ubuntu:19.10
LABEL maintainer="dmlabs"
RUN groupadd -g 10000 kube-scout && useradd -u 10000 -g 10000 -s /bin/bash -m kube-scout
RUN echo "BUILD INFO: Update base image" && \
    apt-get update && \
    apt-get upgrade -y && \
    echo "BUILD INFO: Install needed packages" && \
    apt-get install -y --no-install-recommends tzdata curl ca-certificates webhook jq gnupg gnupg2 gnupg1 apt-transport-https bc mongo-tools && \
    echo "BUILD INFO: Add kubectl packages and install kubectl" && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends kubectl  && \
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