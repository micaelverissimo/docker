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


# ROOT CERN - Remove after validate the saphyra
# RUN cd /opt && mkdir root_cern && cd root_cern && git clone https://gitlab.cern.ch/jodafons/root.git && \
# cd root && git checkout v6-16-00-custom && cd .. && mkdir build && cd build && cmake  --Dpython_version=3 ../root && make -j30

# RUN cd /opt/root_cern && mkdir binary && cd binary && cp -r ../build/bin . && cp -r ../build/etc . && cp -r ../build/lib . && cp -r ../build/include . 
# RUN rm -rf /opt/root_cern/build 
# RUN rm -rf /opt/root_cern/root 
# RUN . /opt/root_cern/binary/bin/thisroot.sh

RUN apt install -y screen htop
RUN pip3 install sklearn keras sqlalchemy numpy kubernetes psycopg2-binary benedict flask-login 



# # Make images Grid / Singularity compatible
# RUN mkdir -p /alrb /cvmfs /afs /eos /code /data
# ENV Athena_SETUP "off"
# ENV RCM_NO_COLOR 0
# ENV RCM_GRID_ENV 0
# ENV ROOTSYS "/opt/root_cern/build/"
# ENV PATH "$ROOTSYS/bin:$PATH"
# ENV LD_LIBRARY_PATH "$ROOTSYS/lib:$LD_LIBRARY_PATH"
# ENV PYTHONPATH "/opt/root_cern/build/lib:$PYTHONPATH"
RUN mkdir -p /code
RUN cd /code && git clone https://github.com/jodafons/saphyra.git && cd saphyra && \
ls  && bash setup_module.sh && bash setup_module.sh --head && git pull


RUN cd /code && git clone https://github.com/jodafons/orchestra.git && cd orchestra && git pull

COPY setup_envs.sh /
COPY ./test-gpu.py /


#ENTRYPOINT /setup_envs.sh
#RUN adduser --disabled-password --gecos '' jodafons && adduser jodafons sudo && echo '%sudo ALL=(ALL:ALL) ALL' >> /etc/sudoers
#RUN chown jodafons /
#USER jodafons
#WORKDIR /





