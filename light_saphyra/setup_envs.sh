#!/bin/bash

CURRENT_DIR=`pwd`

export LC_ALL=''
export RCM_NO_COLOR=0
export RCM_GRID_ENV=0
export Athena_SETUP="off"

# saphyra
cd /code/saphyra/
export SAPHYRA_PATH=`pwd`
git pull
mkdir .python_dir
cd .python_dir
mkdir python
cd python
ln -s ../../Gaugi/python Gaugi
ln -s ../../saphyra/python saphyra
ln -s ../../External/ringerdb/python ringerdb
ln -s ../../Tools/panda/python panda
export PYTHONPATH=`pwd`:$PYTHONPATH

# orchestra
cd /code/orchestra
git pull
mkdir .python_dir
cd .python_dir
ln -s ../orchestra/python orchestra
export PYTHONPATH=`pwd`:$PYTHONPATH
cd ..
export PATH=`pwd`/scripts:$PATH


cd $CURRENT_DIR