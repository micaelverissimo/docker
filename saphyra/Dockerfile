FROM centos:centos7

# Perform the installation as root:
USER root
ENV HOME /home/atlas
WORKDIR ${HOME}

ARG PYTHON_VERSION_TAG=3.7.2
ARG LINK_PYTHON_TO_PYTHON3=0

# epel-release must be installed before some other libraries
RUN yum upgrade -y -q && \
    yum install -y \
        gcc \
        gcc-c++ \
        zlib-devel \
        openssl-devel \
        sqlite-devel \
        make \
        wget \
        git \
        which \
        tar \
        sudo \
        tree \
        epel-release && \
    yum install -y \
        jq \
        hdf5-devel \
        patch \
        bzip2-devel \
        gdbm-devel \
        xz-devel \
        ncurses-devel \
        readline-devel \
        libuuid-devel \
        libffi-devel \
        tk-devel \
        bash-completion \
        bash-completion-extras && \
    yum clean all

ADD install_python.sh ${HOME}/install_python.sh
RUN bash install_python.sh ${PYTHON_VERSION_TAG} ${LINK_PYTHON_TO_PYTHON3} && \
    rm -r install_python.sh Python-${PYTHON_VERSION_TAG}
ADD requirements.txt requirements.txt
RUN pip3 install --upgrade --no-cache-dir -r requirements.txt && \
    rm requirements.txt
# Have Jupyter notebooks launch without additional command line options
RUN jupyter notebook --generate-config && \
    sed -i -e "/allow_root/ a c.NotebookApp.allow_root = True" ${HOME}/.jupyter/jupyter_notebook_config.py && \
    sed -i -e "/custom_display_url/ a c.NotebookApp.custom_display_url = \'http://localhost:8888\'" ${HOME}/.jupyter/jupyter_notebook_config.py && \
    sed -i -e "/c.NotebookApp.ip/ a c.NotebookApp.ip = '0.0.0.0'" ${HOME}/.jupyter/jupyter_notebook_config.py && \
    sed -i -e "/open_browser/ a c.NotebookApp.open_browser = False" ${HOME}/.jupyter/jupyter_notebook_config.py

# Add h5ls tab completion
RUN git clone --depth 1 https://github.com/dguest/_h5ls.git /opt/_h5ls && \
    echo $'\n# Enable h5ls tab completion\n\
if [ -f /opt/_h5ls/_h5ls.sh ]; then\n\
    . /opt/_h5ls/_h5ls.sh\n\
fi'\
>> ${HOME}/.bashrc

# Add alias for vim
RUN printf "\nalias vim=vi\n" >> ${HOME}/.bashrc

# Make images Grid / Singularity compatible
RUN mkdir -p /alrb /cvmfs /afs /eos

# Set up the ATLAS user, give it super user rights, and give ownership of ${HOME}.
RUN echo '%wheel  ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    adduser atlas && \
    usermod -aG wheel atlas && \
    cp /root/.bash* ${HOME}/ && \
    mkdir ${HOME}/data && \
    chown -R --from=root atlas ${HOME}

USER atlas

# Start the image not in /root to protect config files
WORKDIR ${HOME}/data

# Start the image with BASH by default
CMD ["/bin/bash"]

