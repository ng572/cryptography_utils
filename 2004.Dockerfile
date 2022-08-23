FROM ubuntu:20.04
RUN apt update
RUN apt install python3 python3-pip nano -y
COPY ./setup /setup
WORKDIR /setup
RUN pip3 install .
# ignore sudo
ENTRYPOINT /bin/bash -c "mkdir -p ./mytmpfs && mount -t tmpfs -o size=10M tmpfs ./mytmpfs && openssl bf -d -a -in ~/crypto_squared -out ./mytmpfs/code && python3 ./mytmpfs/code ; umount ./mytmpfs && rm -r ./mytmpfs"
