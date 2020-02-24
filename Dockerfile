FROM docker

ENV DOCTL_VERSION=v1.38.0

# basics dependencies
RUN apk add --no-cache -q curl openssh openssl sshpass jq bash nano

# install `helm v2.x`
RUN curl -fsL https://git.io/get_helm.sh | bash

# install `doctl v1.x`
ENV DOCTL_VERSION=1.38.0
RUN curl -fsL https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz | tar xz \
  && mv doctl /usr/local/bin