
# -it: interactive section with the tty..
# --network: connect a container to a network.
# -v: volume.
docker run --network host -v $RINGER_VOLUME:/volume -it jodafons/saphyra /bin/bash
