## docker images repository

Use this repository to build your docker image and use this into the 
LCG grid CERN. You must have an docker hub account and your image must
be public. Follow the procedures below to build and push your image
to your public docker repository.


## ml-base (machine learning base image)

This image uses the CentOS 7 as base and included the follow packages
current installed:

- root (cern project)
- boost
- python 2.7
- keras and tensorflow
- scipy and numpy
- saphyra (tuning tools repository)


## How to build the image

```bash
# build the docker image
docker build --network host --compress -t ${USER}/ml-base .
```

## How to run as bash

```bash
# run the docker image
docker run -i -t -v $HOME:$HOME ${USER}/ml-base /bin/bash
```

## How to push to your public repository

You must login before push your image into the docker repository.
```bash
# push
docker push ${USER}/ml-base
```

## How to install docker (CentOS 7)


Download the latest container package: 
https://download.docker.com/linux/centos/7/x86_64/stable/Packages/

```bash
yum install ./containerd*
```
After install this package you must follow the steps described in this tutorial:
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7



