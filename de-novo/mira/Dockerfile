FROM quay.io/comp-bio-aging/base:master

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

ENV MIRA_VERSION="V5rc1"
ENV MIRA_PLATFORM="linux-gnu_x86_64"

WORKDIR /opt

ENV MIRA_NAME=mira_${MIRA_VERSION}_${MIRA_PLATFORM}_static
ENV MIRA_PATH /opt/$MIRA_NAME
RUN mkdir $MIRA_PATH

RUN wget https://github.com/bachev/mira/releases/download/$MIRA_VERSION/${MIRA_NAME}.tar.bz2 && \
    tar -xjvf ${MIRA_NAME}.tar.bz2 && \
    rm -rf *.tar.bz2

WORKDIR $MIRA_PATH

ENV PATH $PATH:$MIRA_PATH:$MIRA_PATH/bin
CMD ["mira"]