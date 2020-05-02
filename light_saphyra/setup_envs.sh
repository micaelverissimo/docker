#!/bin/bash
CURRENT_DIR=`pwd`
export LC_ALL=''
export RCM_NO_COLOR=0
export RCM_GRID_ENV=0
# saphyra
cd /code/saphyra/
export SAPHYRA_PATH=`pwd`
git pull
mkdir .__python__
cd .__python__
ln -s ../gaugi/python Gaugi
ln -s ../saphyra/python saphyra
ln -s ../external/ringerdb/python ringerdb
export PYTHONPATH=`pwd`:$PYTHONPATH
cd $CURRENT_DIR