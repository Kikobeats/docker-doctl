FROM docker

# basics dependencies
RUN apk add --no-cache -q curl openssh openssl sshpass jq bash nano

# install `helm v3.x`
RUN curl -fsL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# install `doctl v1.x`
ENV DOCTL_VERSION=1.55.0
RUN curl -fsL https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz | tar xz \
  && mv doctl /usr/local/bin
