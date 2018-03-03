FROM quay.io/comp-bio-aging/ammonite:latest

LABEL maintainer "antonkulaga@gmail.com"

ADD predefShared.sc /root/.ammonite/

RUN echo 'println("loaded dependencies)' > /data/init.scala
RUN /usr/local/bin/amm /data/init.scala
RUN rm /data/init.scala