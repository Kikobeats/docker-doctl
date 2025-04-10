FROM docker

# basics dependencies
RUN apk add --no-cache -q git curl jq bash npm nodejs

# install `helm v3.x`
RUN curl -fsL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# install `doctl v1.x`
RUN DOCTL_VERSION=$(curl -s https://api.github.com/repos/digitalocean/doctl/releases/latest | jq -r .tag_name | sed 's/^v//') \
    && curl -fsLO https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz \
    && tar -xzf "doctl-${DOCTL_VERSION}-linux-amd64.tar.gz" -C /usr/local/bin \
    && rm "doctl-${DOCTL_VERSION}-linux-amd64.tar.gz"

# install `kubectl`
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

# install `pnpm`
RUN npm install -g pnpm