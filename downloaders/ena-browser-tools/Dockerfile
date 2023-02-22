FROM quay.io/comp-bio-aging/java:master

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

WORKDIR /opt

ENV VERSION "1.1.0"
ENV FOLDER /opt/enaBrowserTools-$VERSION/python3

WORKDIR /opt
RUN wget https://github.com/enasequence/enaBrowserTools/archive/refs/tags/v$VERSION.zip && \
    unzip v$VERSION.zip && \
    rm -rf *.zip
ENV PATH "$PATH:$FOLDER"
WORKDIR $FOLDER
CMD enaGroupGet