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

RUN pip3 install sklearn keras sqlalchemy numpy kubernetes psycopg2-binary benedict flask-login 

# get the saphyra repository
RUN mkdir -p /code
RUN cd /code && git clone https://github.com/jodafons/saphyra.git && cd saphyra && \
ls  && bash setup_module.sh && bash setup_module.sh --head && git pull

# get orchestra repository
RUN cd /code && git clone https://github.com/jodafons/orchestra.git && cd orchestra && git pull

COPY setup_envs.sh /
