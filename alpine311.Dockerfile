FROM python:3.8-alpine3.11
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN apk add --update openssl gcc libc-dev
COPY ./setup /setup
WORKDIR /setup
RUN pip3 install .
# ignore sudo
ENTRYPOINT /bin/ash -c "mkdir -p ./mytmpfs && mount -t tmpfs -o size=10M tmpfs ./mytmpfs && openssl bf -d -a -in ./crypto_squared -out ./mytmpfs/code && python3 ./mytmpfs/code ; umount ./mytmpfs && rm -r ./mytmpfs"
