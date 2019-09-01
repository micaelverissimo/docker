# docker images repository

Use this repository to build your docker image and use this into the 
LCG grid CERN. You must have an docker hub account and your image must
be public. Follow the procedures below to build and push your image
to your public docker repository.


## gpu-base (machine learning base image from tensorflow)

This image uses the Ubuntu (tensorflow) as base and included the follow packages
current installed:

- root (cern project)
- boost
- python 2.7
- keras and tensorflow
- scipy and numpy
- saphyra (tuning tools repository)


### How to build the image

```bash
# build the docker image
source buildthis.sh
```

### How to run as bash

```bash
# run the docker image
source runthis.sh
```

### How to push to your public repository

You must login before push your image into the docker repository.
```bash
# push
docker push ${USER}/gpu-base
```


### How to test on LCG grid with GPU

setup_envs.sh is mandatory becouse of singularity envs overriding.

```bash
prun \
     --exec \
       "sh -c '. /setup_envs.sh && python /test-gpu.py';" \
     --excludedSite=ANALY_DESY-HH_UCORE,ANALY_MWT2_SL6,ANALY_MWT2_HIMEM,ANALY_DESY-HH,ANALY_FZK_UCORE,ANALY_FZU,DESY-HH_UCORE,FZK-LCG2_UCORE \
     --containerImage=docker://jodafons/gpu-base:latest \
     --excludeFile="*.o,*.so,*.a,*.gch,Download/*,InstallArea/*,RootCoreBin/*,RootCore/*,*new_env_file.sh," \
     --noBuild \
     --outDS=user.jodafons.test_1 \
     --site=ANALY_MANC_GPU_TEST \
     --cmtConfig nvidia-gpu \
     --disableAutoRetry \
```


## How to install docker (CentOS 7)


Download the latest container package: 
https://download.docker.com/linux/centos/7/x86_64/stable/Packages/

```bash
yum install ./containerd*
```
After install this package you must follow the steps described in this tutorial:
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7



