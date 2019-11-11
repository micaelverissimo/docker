#!/bin/bash

CURRENT_DIR=`pwd`

export LC_ALL=''
export RCM_NO_COLOR=0
export RCM_GRID_ENV=0
export Athena_SETUP="off"
# Set ROOT by hand
export ROOTSYS="opt/root_cern/build/bin"
export PATH="$ROOTSYS/bin:$PATH"
export LD_LIBRARY_PATH="$ROOTSYS/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="$ROOTSYS/lib:$PYTHONPATH"



cd code
git clone https://github.com/jodafons/prometheus.git
cd prometheus/
export PROMETHEUS_PATH=`pwd`
source setup_module.sh
source setup_module.sh --head
mkdir build
cd build
cmake ..
make
cd ..
source setup.sh



cd $CURRENT_DIR








