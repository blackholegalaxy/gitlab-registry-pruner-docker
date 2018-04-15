# Gitlab Registry Pruner

[![Build Status](https://travis-ci.org/blackholegalaxy/gitlab-registry-pruner-docker.svg?branch=master)](https://travis-ci.org/blackholegalaxy/gitlab-registry-pruner-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/blackholegalaxy/gitlab-registry-pruner.svg?maxAge=8600)][hub]

[hub]: https://hub.docker.com/r/blackholegalaxy/gitlab-registry-pruner/

Docker version of the Gitlab Registry pruner by Ayufan https://gitlab.com/gitlab-org/docker-distribution-pruner

## CAUTION

As stated in the [original package readme](https://gitlab.com/gitlab-org/docker-distribution-pruner) **this tool is not recommanded to be used on production data. There's no warranty that it will not break repository.**

## Basic Usage

```
docker run --rm blackholegalaxy/gitlab-registry-pruner [ARGUMENTS]
```

### Dry run

You must specify path to the registry configuration as argument. 

```
-config=/path/to/registry/configuration
```

You may have to mount **gitlab data directory** as Docker volume depending on your setup. Omnibus example:

```
docker run --rm -v /local/gitlab-data/path:/var/opt/gitlab blackholegalaxy/gitlab-registry-pruner -config=/var/opt/gitlab/registry/config.yml
```

### Delete

To Actually delete the data, add `-delete` argument after config path.

```
-config=/path/to/registry/configuration -delete
```

## Advanced Usage

See [original package readme](https://gitlab.com/gitlab-org/docker-distribution-pruner)

## Licence

Ayufan (Kamil Trzciński) - GitLab, MIT, 2017
