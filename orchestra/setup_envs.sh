#!/bin/bash

CURRENT_DIR=`pwd`

export LC_ALL=''
export RCM_NO_COLOR=0
export RCM_GRID_ENV=0
export Athena_SETUP="off"
# Set ROOT by hand
export ROOTSYS="/opt/root_cern/binary/"
export PATH="$ROOTSYS/bin:$PATH"
export LD_LIBRARY_PATH="$ROOTSYS/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="$ROOTSYS/lib:$PYTHONPATH"



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
ln -s ../../External/monet/python monet
ln -s ../../External/pytex/python pytex
ln -s ../../Tools/panda/python panda
export PYTHONPATH=`pwd`:$PYTHONPATH



cd /code/orchestra
git pull
mkdir .python_dir
cd .python_dir
ln -s ../orchestra/python orchestra
export PYTHONPATH=`pwd`:$PYTHONPATH
cd ..
export PATH=`pwd`/scripts:$PATH


cd $CURRENT_DIR


python3 /code/orchestra/orchestra/scripts/run_sdumont.py -q $ORCHESTRA_QUEUE -s $ORCHESTRA_TIME





