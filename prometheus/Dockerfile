FROM tensorflow/tensorflow:latest-gpu-py3

USER root
SHELL [ "/bin/bash", "-c" ]
RUN ls -lsiah
RUN apt-get update
RUN apt-get install wget
RUN wget https://cmake.org/files/v3.8/cmake-3.8.2-Linux-x86_64.sh -P /usr/
RUN chmod 755 /usr/cmake-3.8.2-Linux-x86_64.sh
RUN cd /usr && ./cmake-3.8.2-Linux-x86_64.sh --skip-license
RUN cmake --version



RUN apt-get install -y git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
RUN apt-get install -y gfortran 
RUN apt-get install -y libssl-dev 
RUN apt-get install -y libpcre3-dev 
RUN apt-get install -y libglew1.5-dev 
RUN apt-get install -y libftgl-dev 
RUN apt-get install -y libldap2-dev 
RUN apt-get install -y python-dev 
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libkrb5-dev 
RUN apt-get install -y libgsl0-dev 
RUN apt-get install -y libqt4-dev 
RUN apt-get install -y libfftw3-dev 
RUN apt-get install -y libcfitsio-dev 
RUN apt-get install -y graphviz-dev 
RUN apt-get install -y libavahi-compat-libdnssd-dev 
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y vim
RUN git clone https://github.com/amix/vimrc.git ${HOME}/.vim_runtime
RUN cd ${HOME}/.vim_runtime/ && source install_awesome_vimrc.sh 


RUN cd /opt && mkdir root_cern && cd root_cern && git clone https://gitlab.cern.ch/jodafons/root.git && \
cd root && git checkout v6-16-00 && cd .. && mkdir build && cd build && cmake  --Dpython_version=3 ../root && make -j30

RUN apt install -y screen htop
RUN pip3 install sklearn keras sqlalchemy numpy kubernetes psycopg2-binary benedict flask-login 


# Make images Grid / Singularity compatible
RUN mkdir -p /alrb /cvmfs /afs /eos /code /data



ENV Athena_SETUP "off"
ENV G4_SETUP "on"
ENV RCM_NO_COLOR 0
ENV RCM_GRID_ENV 0
ENV ROOTSYS "/opt/root_cern/build/"
ENV PATH "$ROOTSYS/bin:$PATH"
ENV LD_LIBRARY_PATH "$ROOTSYS/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH "/opt/root_cern/build/lib:$PYTHONPATH"



RUN cd /opt && git clone https://github.com/jodafons/geant4_10.5.git && cd geant4_10.5 && source buildthis.sh
# Setup Geant4 binary and library paths...
ENV geant4_envbindir "/opt/geant4_10.5/build"
ENV PATH $geant4_envbindir:${PATH}
ENV LD_LIBRARY_PATH $geant4_envbindir/BuildProducts/lib:${LD_LIBRARY_PATH}
ENV G4NEUTRONHPDATA $geant4_envbindir/data/G4NDL4.5
ENV G4LEDATA $geant4_envbindir/data/G4EMLOW7.7
ENV G4LEVELGAMMADATA $geant4_envbindir/data/PhotonEvaporation5.3
ENV G4RADIOACTIVEDATA $geant4_envbindir/data/RadioactiveDecay5.3
ENV G4PARTICLEXSDATA $geant4_envbindir/data/G4PARTICLEXS1.1
ENV G4PIIDATA $geant4_envbindir/data/G4PII1.3
ENV G4REALSURFACEDATA $geant4_envbindir/data/RealSurface2.1.1
ENV G4SAIDXSDATA $geant4_envbindir/data/G4SAIDDATA2.0
ENV G4ABLADATA $geant4_envbindir/data/G4ABLA3.1
ENV G4INCLDATA $geant4_envbindir/data/G4INCL1.0
ENV G4ENSDFSTATEDATA $geant4_envbindir/data/G4ENSDFSTATE2.2



# Install prometheus framework
RUN cd /code && git clone https://github.com/jodafons/prometheus.git && cd prometheus && source setup_module.sh && source setup_module.sh --head && mkdir build && cd build && cmake .. && make 




COPY setup_envs.sh /
RUN chmod 777 /setup_envs.sh





