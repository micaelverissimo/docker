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







#-----------------------------------------------------------------------
# Setup Geant4 binary and library paths...
export geant4_envbindir=/opt/geant4_10.5/build
export PATH="$geant4_envbindir":${PATH}
export LD_LIBRARY_PATH="$geant4_envbindir/BuildProducts/lib":${LD_LIBRARY_PATH}
export G4NEUTRONHPDATA="$geant4_envbindir/data/G4NDL4.5"
export G4LEDATA="$geant4_envbindir/data/G4EMLOW7.7"
export G4LEVELGAMMADATA="$geant4_envbindir/data/PhotonEvaporation5.3"
export G4RADIOACTIVEDATA="$geant4_envbindir/data/RadioactiveDecay5.3"
export G4PARTICLEXSDATA="$geant4_envbindir/data/G4PARTICLEXS1.1"
export G4PIIDATA="$geant4_envbindir/data/G4PII1.3"
export G4REALSURFACEDATA="$geant4_envbindir/data/RealSurface2.1.1"
export G4SAIDXSDATA="$geant4_envbindir/data/G4SAIDDATA2.0"
export G4ABLADATA="$geant4_envbindir/data/G4ABLA3.1"
export G4INCLDATA="$geant4_envbindir/data/G4INCL1.0"
export G4ENSDFSTATEDATA="$geant4_envbindir/data/G4ENSDFSTATE2.2"


#-----------------------------------------------------------------------
# Setup Pythia binary and library paths...
export PYTHIA_LIB=/opt/pythia/lib
export PYTHIA_INCLUDE=/opt/pythia/include


#-----------------------------------------------------------------------
# Setup HEPMC binary and library paths...
export HEPMC_LIB=/opt/hepmc_build/lib
export LD_LIBRARY_PATH=/opt/hepmc_build/lib








cd $CURRENT_DIR







