FROM ubuntu:20.04
RUN apt update
RUN apt install python3 python3-pip nano -y
COPY ./setup /setup
WORKDIR /setup
RUN pip3 install .
# ignore sudo
RUN echo 'alias sudo=""' >> ~/.bashrc
