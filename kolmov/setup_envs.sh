#!/bin/bash

CURRENT_DIR=`pwd`

# kolmov
cd /code/kolmov/
export KOLMOV_PATH=`pwd`
git pull
mkdir .python_dir
cd .python_dir
mkdir python
cd python
ln -s ../../Gaugi/python gaugi
ln -s ../../kolmov/python kolmov

export PYTHONPATH=`pwd`:$PYTHONPATH

cd $CURRENT_DIR