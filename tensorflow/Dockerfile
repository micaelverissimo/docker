FROM tensorflow/tensorflow:2.0.0b1-gpu

# Perform the installation as root:
USER root

RUN mkdir /home/atlas
ENV HOME /home/atlas
WORKDIR ${HOME}


RUN apt-get install wget
RUN wget https://cmake.org/files/v3.8/cmake-3.8.2-Linux-x86_64.sh -P /usr/
RUN chmod 755 /usr/cmake-3.8.2-Linux-x86_64.sh
RUN cd /usr && ./cmake-3.8.2-Linux-x86_64.sh --skip-license
RUN cmake --version


RUN apt-get install -y git dpkg-dev g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
#RUN apt-get install -y gfortran libssl-dev libpcre3-dev \
#    xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
#    libmysqlclient-dev libfftw3-dev libcfitsio-dev \
#    graphviz-dev libavahi-compat-libdnssd-dev \
#    libldap2-dev python-dev libxml2-dev libkrb5-dev \
#    libgsl0-dev libqt4-dev

RUN cd /opt && mkdir root-cern && cd root-cern && git clone https://gitlab.cern.ch/jodafons/root.git && \
cd root && git checkout v6-16-00-custom && cd .. && mkdir build && cd build && cmake ../root && make -j8








RUN mkdir -p /alrb /cvmfs /afs /eos /grid



