# docker-doctl

> A docker image for deploying to DigitalOcean kubernetes.

## Getting Started

### GitLab

Suggested configuration for deploying any new release to `my-cluster-name` cluster.

```yaml
deploy:
  stage: deploy
  only:
    - tags
  image: kikobeats/docker-doctl
  variables:
    DOCKER_DRIVER: overlay2
  services:
    - docker:dind
  before_script:
    # initialize `doctl`
    - doctl kubernetes cluster kubeconfig save my-cluster-name
    # initialize `helm`
    - helm init --client-only
    # initialize `docker`
    - echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  script:
    - ./bin/publish
    - ./bin/deploy
```

## Environment Variables

- [`DIGITALOCEAN_ACCESS_TOKEN`](https://github.com/digitalocean/doctl#authenticating-with-digitalocean): The variable  should be exposed in order to authenticate `doctl`.

## License

**docker-doctl** © [Kiko Beats](https://kikobeats.com), released under the [MIT](https://github.com/Kikobeats/docker-doctl/blob/master/LICENSE.md) License.<br>
Authored and maintained by Kiko Beats with help from [contributors](https://github.com/Kikobeats/docker-doctl/contributors).

> [kikobeats.com](https://kikobeats.com) · GitHub [@Kiko Beats](https://github.com/Kikobeats) · X [@Kikobeats](https://x.com/Kikobeats)
