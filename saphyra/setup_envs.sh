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










#RUN cd ${HOME} && git clone https://gitlab.cern.ch/jodafons/saphyra.git && cd saphyra && \
#ls -lisah  && bash setup_module.sh && bash setup_module.sh --head && git pull && bash buildthis.sh
#RUN ln -sf ${HOME}/saphyra/build/Core/TuningTools/libTuningTools_rdict.pcm ${HOME}/saphyra/build/lib
#RUN ln -sf ${HOME}/saphyra/build/Gaugi/libGaugi_rdict.pcm ${HOME}/saphyra/build/lib
#RUN ln -sf ${HOME}/saphyra/build/libsaphyra.so ${HOME}/saphyra/build/lib
#ENV LD_LIBRARY_PATH  "${HOME}/saphyra/build/lib:$LD_LIBRARY_PATH"
#ENV PYTHONPATH "${HOME}/saphyra/build/lib:$PYTHONPATH"
#ENV PYTHONPATH "${HOME}/saphyra/build/python:$PYTHONPATH"
#ENV PATH "${HOME}/saphyra/build/scripts:$PATH"
#RUN cd /usr/local/lib/python2.7/dist-packages/ && cp -r /home/atlas/saphyra/build/python/* .



