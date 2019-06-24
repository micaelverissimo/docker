
FROM ubuntu:bionic

USER root
WORKDIR /root

SHELL [ "/bin/bash", "-c" ]

ARG PYTHON_VERSION_TAG=3.7.2
ARG LINK_PYTHON_TO_PYTHON3=0

# Existing lsb_release causes issues with modern installations of Python3
# https://github.com/pypa/pip/issues/4924#issuecomment-435825490
# Set (temporarily) DEBIAN_FRONTEND to avoid interacting with tzdata
RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        gcc \
        g++ \
        zlibc \
        zlib1g-dev \
        libssl-dev \
        libbz2-dev \
        libsqlite3-dev \
        libncurses5-dev \
        libgdbm-dev \
        libgdbm-compat-dev \
        liblzma-dev \
        libreadline-dev \
        uuid-dev \
        libffi-dev \
        tk-dev \
        wget \
        curl \
        git \
        make \
        sudo \
        bash-completion \
        tree \
        vim-tiny \
        jq \
        hdf5-tools \
        software-properties-common && \
    mv /usr/bin/lsb_release /usr/bin/lsb_release.bak && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/*

RUN apt-get install python-pip -y
RUN pip install tensorflow
RUN pip install keras
RUN apt-get install git -y

# Enable tab completion by uncommenting it from /etc/bash.bashrc
# The relevant lines are those below the phrase "enable bash completion in interactive shells"
RUN export SED_RANGE="$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+1)),$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+7))" && \
    sed -i -e "${SED_RANGE}"' s/^#//' /etc/bash.bashrc && \
    unset SED_RANGE


# Add alias for vim-tiny
RUN printf "\nalias vim=vi\n" >> ${HOME}/.bashrc

# Make images Grid / Singularity compatible
RUN mkdir -p /alrb /cvmfs /afs /eos

# Create user "atlas" with sudo powers
RUN useradd -m atlas && \
    usermod -aG sudo atlas && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/atlas/ && \
    mkdir /home/atlas/data && \
    chown -R --from=root atlas /home/atlas


# Start the image not in /root to protect config files
ENV HOME /home/atlas
WORKDIR ${HOME}/data

RUN git clone https://gitlab.cern.ch/jodafons/docker





ENV USER atlas
USER atlas
ENV PATH /home/atlas/.local/bin:$PATH
# Avoid first use of sudo warning. c.f. https://askubuntu.com/a/22614/781671
RUN touch $HOME/.sudo_as_admin_successful

RUN python -c "from keras.datasets import cifar10; (x_train, y_train), (x_test, y_test) = cifar10.load_data()"
# Start the image with BASH by default
CMD ["/bin/bash"]


