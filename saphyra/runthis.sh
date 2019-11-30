#docker run --gpus all --network host -v jodafons:/volume -it jodafons/tensorflow /bin/bash
#docker run -u $(id -u):$(id -g) --network host -v jodafons:/volume -it jodafons/saphyra /bin/bash
#docker run --user `id -u` --network host -v jodafons:/volume -it jodafons/saphyra /bin/bash
docker run --network host -v jodafons:/volume -it jodafons/saphyra /bin/bash
