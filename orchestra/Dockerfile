FROM jodafons/saphyra

USER root
SHELL [ "/bin/bash", "-c" ]

COPY setup_envs.sh /
RUN chmod 777 /setup_envs.sh
ENTRYPOINT /setup_envs.sh







