FROM ubuntu:18.04

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

RUN apt update && \
    apt upgrade -y && \
    apt install -y software-properties-common python3-software-properties automake nano cmake zip wget gcc git build-essential curl gosu libbz2-dev zlib1g-dev gawk libxml2-dev

RUN ln -s /usr/bin/python3 /usr/bin/python

# Define default command.
CMD ["/bin/bash"]