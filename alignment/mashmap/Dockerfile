FROM quay.io/comp-bio-aging/bowtie2:master

MAINTAINER Anton Kulaga

ENV PLATFORM=Linux64

ENV MASHMAP=v2.0

WORKDIR /opt

RUN wget https://github.com/marbl/MashMap/releases/download/v2.0/mashmap-${PLATFORM}-${MASHMAP}.tar.gz && tar -xzf mashmap-${PLATFORM}-${MASHMAP}.tar.gz


ENV PATH "$PATH:/opt/bowtie2"