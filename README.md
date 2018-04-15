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

### Arguments

```
  -config string
        Path to registry config file
  -debug
        Print debug messages
  -delete
        Delete data, instead of dry run
  -delete-old-tag-versions
        Delete old tag versions (default true)
  -ignore-blobs
        Ignore blobs processing and recycling
  -jobs int
        Number of concurrent jobs to execute (default 10)
  -parallel-blob-walk
        Allow to use parallel blob walker (default true)
  -parallel-repository-walk
        Allow to use parallel repository walker (default true)
  -parallel-walk-jobs int
        Number of concurrent parallel walk jobs to execute (default 10)
  -repository-csv-output string
        File to which CSV will be written with all metrics (default "repositories.csv")
  -s3-storage-cache string
        s3 cache (default "tmp-cache")
  -soft-delete
        When deleting, do not remove, but move to backup/ folder (default true)
  -soft-errors
        Print errors, but do not fail
  -verbose
        Print verbose messages (default true)

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

### Soft Delete

To soft delete the data, add `-delete` argument after config path. It will produce a backup directory which can be restored if needed.

```
-config=/path/to/registry/configuration -delete
```

#### **Caution**
As stated on [this issue](https://gitlab.com/gitlab-org/docker-distribution-pruner/issues/10) running in soft delete mode will produce a `docker_backup` directory in gitlab registry data (on omnibus: `/var/opt/gitlab/gitlab-rails/shared/registry`). 

The permissions set to this directory to `root:root` by the pruner may prevent regular backups to run (causing `tar: ./docker_backup: Cannot open: Permission denied` error). As solution you can move the backup elsewhere in a temporary directory or delete this directory when you feel confident your pruned data is correct.

### Delete

You can run the command using `-soft-delete=false` arguments. It will delete the data and not create any backup.

```
-config=/path/to/registry/configuration -delete -soft-delete=false
```

## Advanced Usage

See [original package readme](https://gitlab.com/gitlab-org/docker-distribution-pruner)

## Licence

Ayufan (Kamil Trzciński) - GitLab, MIT, 2017
