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

# Check the libs to ROOT and remove then
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

RUN apt install -y screen htop
RUN pip3 install sklearn keras sqlalchemy numpy kubernetes psycopg2-binary benedict flask-login 

# get the saphyra repository
RUN mkdir -p /code
RUN cd /code && git clone https://github.com/jodafons/saphyra.git && cd saphyra && \
ls  && bash setup_module.sh && bash setup_module.sh --head && git pull

# get orchestra repository
RUN cd /code && git clone https://github.com/jodafons/orchestra.git && cd orchestra && git pull

COPY setup_envs.sh /
