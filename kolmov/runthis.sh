
# -it: interactive section with the tty..
# --network: connect a container to a network.
# -v: volume.
# if [ $1 == '' ]; then 
#     echo 'Give a container name... '

# else
#     docker run --name $1 --network host -v $RINGER_VOLUME:/volume -t mverissi/light_saphyra /bin/bash

# fi
# orchestra not support name for containers yet.
docker run --network host -v $RINGER_VOLUME:/volume -t mverissi/kolmov /bin/bash

