FROM tensorflow/tensorflow:1.14.0-gpu 

# Perform the installation as root:
USER root

RUN mkdir /home/atlas
ENV HOME /home/atlas
WORKDIR ${HOME}

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


RUN cd /opt && mkdir root-cern && cd root-cern && git clone https://gitlab.cern.ch/jodafons/root.git && \
cd root && git checkout v6-16-00-custom && cd .. && mkdir build && cd build && cmake ../root && make -j30
RUN echo 'source /opt/root-cern/build/bin/thisroot.sh' >> ${HOME}/.bashrc




RUN apt-get install -y libboost-all-dev
RUN pip install --upgrade pip 
RUN pip install scipy keras pandas sklearn

RUN apt-get install -y vim
RUN git clone https://github.com/amix/vimrc.git ${HOME}/.vim_runtime
RUN cd ${HOME}/.vim_runtime/ && source install_awesome_vimrc.sh 

RUN mkdir -p /alrb /cvmfs /afs /eos /grid






ENV Athena_SETUP "off"
ENV ROOTSYS "/opt/root-cern/build/"
ENV PATH "$ROOTSYS/bin:$PATH"
ENV LD_LIBRARY_PATH "$ROOTSYS/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH "/opt/root-cern/build/lib"
ENV RCM_NO_COLOR 0
ENV RCM_GRID_ENV 0
RUN cd ${HOME} && git clone https://gitlab.cern.ch/jodafons/saphyra.git && cd saphyra && \
ls -lisah  && bash setup_module.sh && bash setup_module.sh --head && git pull && bash buildthis.sh


RUN ln -sf ${HOME}/saphyra/build/Core/TuningTools/libTuningTools_rdict.pcm ${HOME}/saphyra/build/lib
RUN ln -sf ${HOME}/saphyra/build/Gaugi/libGaugi_rdict.pcm ${HOME}/saphyra/build/lib
RUN ln -sf ${HOME}/saphyra/build/libsaphyra.so ${HOME}/saphyra/build/lib
ENV LD_LIBRARY_PATH  "${HOME}/saphyra/build/lib:$LD_LIBRARY_PATH"
#ENV PYTHONPATH "${HOME}/saphyra/build/lib:$PYTHONPATH"
#ENV PYTHONPATH "${HOME}/saphyra/build/python:$PYTHONPATH"
#ENV PATH "${HOME}/saphyra/build/scripts:$PATH"
#RUN cd /usr/local/lib/python2.7/dist-packages/ && cp -r /home/atlas/saphyra/build/python/* .



# Create user "atlas" with sudo powers
RUN useradd -m atlas && \
    usermod -aG sudo atlas && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/atlas/ && \

    chown -R --from=root atlas /home/atlas



RUN echo 'export PYTHONPATH=/home/atlas/saphyra/build/lib:$PYTHONPATH' >> /home/atlas/.bashrc
RUN echo 'export PYTHONPATH=/home/atlas/saphyra/build/python:$PYTHONPATH' >> /home/atlas/.bashrc

# Start the image not in /root to protect config files
ENV HOME /home/atlas
RUN mkdir /home/atlas/data 
WORKDIR /home/atlas/saphyra/build/python
ENV USER atlas
USER atlas

CMD ["/bin/bash"]











