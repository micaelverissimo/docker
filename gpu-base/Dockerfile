FROM tensorflow/tensorflow:latest-gpu

USER root
SHELL [ "/bin/bash", "-c" ]
RUN ls
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
cd root && git checkout v6-16-00-custom && cd .. && mkdir build && cd build && cmake ../root && make -j30
RUN . /opt/root_cern/build/bin/thisroot.sh
#RUN rm -rf /opt/root_cern/root 
RUN pip install sklearn keras


# Make images Grid / Singularity compatible
RUN mkdir -p /alrb /cvmfs /afs /eos /code /data

RUN ls
ENV Athena_SETUP "off"
ENV RCM_NO_COLOR 0
ENV RCM_GRID_ENV 0
ENV ROOTSYS "/opt/root_cern/build/"
ENV PATH "$ROOTSYS/bin:$PATH"
ENV LD_LIBRARY_PATH "$ROOTSYS/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH "/opt/root_cern/build/lib:$PYTHONPATH"
RUN cd /code && git clone https://gitlab.cern.ch/jodafons/saphyra.git && cd saphyra && \
ls -ls  && bash setup_module.sh && bash setup_module.sh --head && git pull && bash buildthis.sh





COPY setup_envs.sh /
COPY ./test-gpu.py /
RUN chmod 777 /setup_envs.sh









