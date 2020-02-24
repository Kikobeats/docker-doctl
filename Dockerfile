FROM docker

# basics dependencies
RUN apk add --no-cache -q curl openssh openssl sshpass jq bash nano

# install `helm`
RUN curl -fsL https://git.io/get_helm.sh | bash

# installing `doctl`
CMD ["./doctl.sh"]
