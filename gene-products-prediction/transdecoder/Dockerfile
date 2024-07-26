FROM bioperl/bioperl

MAINTAINER Anton Kulaga antonkulaga@gmail.com

ENV VERSION 5.7.1

RUN apt update && \
 apt upgrade -y && \
 apt install -y cmake zip wget gcc git build-essential

WORKDIR /opt/

RUN wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v$VERSION.zip && \
    unzip TransDecoder-v$VERSION.zip && \
    rm -rf TransDecoder-v$VERSION.zip && \
    mv TransDecoder-TransDecoder-v$VERSION TransDecoder

WORKDIR /opt/TransDecoder

ENV PATH "$PATH:/opt/TransDecoder"

RUN mkdir /data
WORKDIR /data

CMD ["/bin/bash"]
