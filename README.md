# docker-openrefine

> Original Dockerfile from https://github.com/vimagick/dockerfiles/tree/master/openrefine

## Pre-build

Copy the Linux dist of OpenRefine in the directory.

> The script `refine` is provided due to a problem with the `grep` command.

## Build

```sh
./docker.sh build
```

## Push

```sh
./docker.sh push <your docker id> <version>
```

