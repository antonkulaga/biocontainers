FROM quay.io/comp-bio-aging/base:latest

WORKDIR /src

ENV   GRAAL_VERSION=21.2.0
ENV   GRAAL_CE_URL=https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-java11-linux-amd64-${GRAAL_VERSION}.tar.gz

RUN   apt-get update && \
      apt-get install -y tar gzip libz-dev

RUN   cd /tmp && \
      wget -q $GRAAL_CE_URL -O graalvm-ce-java11-linux-amd64.tar.gz && \
      tar -xvzf graalvm-ce-java11-linux-amd64.tar.gz && \
      mkdir -p /usr/lib/jvm/graalvm && \
      mv graalvm-ce-java11-${GRAAL_VERSION} /usr/lib/jvm/graalvm && \
      rm graalvm-ce-java11-linux-amd64.tar.gz && \
      rm -rf /tmp/graalvm-ce-java11-${GRAAL_VERSION} && \
      rm -rf /tmp/*

RUN   apt-get clean

ENV   JAVA_HOME=/usr/lib/jvm/graalvm/graalvm-ce-java11-${GRAAL_VERSION}
ENV   PATH=$PATH:$JAVA_HOME/bin
ENV   GRAALVM_HOME=/usr/lib/jvm/graalvm/graalvm-ce-java11-${GRAAL_VERSION}

RUN   gu install native-image

# Define working directory.
WORKDIR /data