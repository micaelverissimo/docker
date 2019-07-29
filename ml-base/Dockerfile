FROM centos:centos7
SHELL ["/bin/bash", "-c"] 
# Perform the installation as root:
USER root
ENV HOME /home/atlas
WORKDIR ${HOME}

RUN yum update -y
RUN python --version
#RUN yum updade -y
#RUN yum install -y python27
RUN yum install -y gcc 
RUN yum install -y gcc-c++
RUN yum install -y zlib-devel
RUN yum install -y openssl-devel
RUN yum install -y sqlite-devel
RUN yum install -y make
RUN yum install -y wget 
RUN yum install -y git 
RUN yum install -y which 
RUN yum install -y tar
RUN yum install -y sudo 
RUN yum install -y tree 
RUN yum install -y epel-release
RUN yum install -y hdf5-devel
RUN yum install -y patch 
RUN yum install -y bzip2-devel 
RUN yum install -y gdbm-devel 
RUN yum install -y xz-devel 
RUN yum install -y ncurses-devel 
RUN yum install -y readline-devel 
RUN yum install -y libuuid-devel
RUN yum install -y libffi-devel
RUN yum install -y tk-devel
RUN yum install -y bash-completion
RUN yum install -y bash-completion-extras
RUN yum install -y python-pip
RUN yum install -y boost boost-thread boost-devel boost-python

RUN yum install -y git cmake gcc-c++ gcc binutils libX11-devel libXpm-devel libXft-devel libXext-devel
RUN yum install -y gcc-gfortran openssl-devel pcre-devel \
mesa-libGL-devel mesa-libGLU-devel glew-devel ftgl-devel mysql-devel \
fftw-devel cfitsio-devel graphviz-devel \
avahi-compat-libdns_sd-devel libldap-dev python-devel \
libxml2-devel gsl-static

RUN yum install -y cmake3
RUN pip install --upgrade pip 
RUN pip install numpy scipy tensorflow keras pandas 

RUN cd /opt && mkdir root-cern && cd root-cern && git clone https://gitlab.cern.ch/jodafons/root.git && cd root && git checkout v6-16-00-custom && cd .. && \
mkdir build && cd build && cmake3 ../root && make -j30

RUN pip install numpy==1.16.1
RUN pip install sklearn

# Set up the ATLAS user, give it super user rights, and give ownership of ${HOME}.
RUN echo '%wheel  ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    adduser atlas && \
    usermod -aG wheel atlas && \
    cp /root/.bash* ${HOME}/ && \
    chown -R --from=root atlas ${HOME}

# setup root cern
RUN echo 'source /opt/root-cern/build/bin/thisroot.sh' >> ${HOME}/.bashrc
RUN echo 'source /opt/root-cern/build/bin/thisroot.sh' >> ${HOME}/.bash_profile
RUN source /opt/root-cern/build/bin/thisroot.sh

# Make images Grid / Singularity compatible
RUN mkdir -p /alrb /cvmfs /afs /eos /grid


USER atlas

ENV Athena_SETUP "off"

ENV ROOTSYS "/opt/root-cern/build/"

ENV PATH "$ROOTSYS/bin:$PATH"
ENV LD_LIBRARY_PATH "$ROOTSYS/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH "/opt/root-cern/build/lib"

ENV CPLUS_INCLUDE_PATH "$CPLUS_INCLUDE_PATH:/usr/include/python2.7/"
ENV LC_ALL ''
ENV RCM_NO_COLOR 0
ENV RCM_GRID_ENV 0

RUN cd ${HOME} && git clone https://gitlab.cern.ch/jodafons/saphyra.git && cd saphyra && \
ls -lisah  && bash setup_module.sh && bash setup_module.sh --head && bash buildthis.sh

RUN mkdir ${HOME}/data
RUN ln -sf ${HOME}/saphyra/build/Core/TuningTools/libTuningTools_rdict.pcm ${HOME}/saphyra/build/lib
RUN ln -sf ${HOME}/saphyra/build/Gaugi/libGaugi_rdict.pcm ${HOME}/saphyra/build/lib
RUN ln -sf ${HOME}/saphyra/build/libsaphyra.so ${HOME}/saphyra/build/lib
ENV LD_LIBRARY_PATH  "${HOME}/saphyra/build/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH "${HOME}/saphyra/build/lib:$PYTHONPATH"
ENV PYTHONPATH "${HOME}/saphyra/build/python:$PYTHONPATH"
ENV PATH "${HOME}/saphyra/build/scripts:$PATH"


RUN python -c "from keras.datasets import cifar10; (x_train, y_train), (x_test, y_test) = cifar10.load_data()"
ADD saphyra_pull.sh ${HOME}/data

# Start the image not in /root to protect config files
WORKDIR ${HOME}/data
CMD ["/bin/bash"]
