FROM tensorflow/tensorflow:latest-gpu-py3

USER root
SHELL [ "/bin/bash", "-c" ]
RUN ls -lsiah

RUN apt-get install -y git
RUN pip3 install --upgrade pip
RUN pip3 install -U sklearn keras sqlalchemy numpy kubernetes psycopg2-binary benedict flask-login future
RUN pip3 install -U Gaugi

# get the saphyra repository
RUN mkdir -p /code
RUN cd /code && git clone https://github.com/micaelverissimo/saphyra.git && cd saphyra && git pull origin master

# get orchestra repository
RUN cd /code && git clone https://github.com/jodafons/orchestra.git && cd orchestra && git pull origin master

COPY setup_envs.sh /
