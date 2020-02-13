FROM quay.io/comp-bio-aging/ammonite:master

LABEL maintainer="antonkulaga@gmail.com"

ADD predef.sc /root/.ammonite/

RUN echo 'println("loaded dependencies")' > /data/init.scala && /usr/local/bin/amm /data/init.scala && rm /data/init.scala
RUN mkdir /scripts
ENV PATH /scripts:$PATH
RUN amm /root/.ammonite/predef.sc