FROM tensorflow/tensorflow:latest-gpu-py3

USER root
SHELL [ "/bin/bash", "-c" ]
RUN ls -lsiah

RUN apt-get install -y git
RUN pip install --upgrade pip
RUN pip install -U matplotlib 
RUN pip install -U seaborn
RUN pip install -U sklearn
RUN pip install -U numpy 
RUN pip install -U pandas 
RUN pip install -U jupyter
RUN pip install -U Gaugi

# get the kolmov repository
RUN mkdir -p /code
RUN cd /code && git clone https://github.com/micaelverissimo/kolmov.git && cd kolmov && git pull

COPY setup_envs.sh /