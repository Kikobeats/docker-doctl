#!/bin/bash

DOCTL_VERSION=$(curl -fsL https://api.github.com/repos/digitalocean/doctl/releases/latest | jq -r ".tag_name" | sed 's/v//')
curl -fsL https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz | tar xz
mv doctl /usr/local/bin