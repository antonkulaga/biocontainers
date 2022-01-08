FROM quay.io/comp-bio-aging/scala:latest

LABEL maintainer="antonkulaga@gmail.com"

ENV AMM_VERSION 2.5.0
ENV SCALA_VERSION 2.13

RUN  sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/$AMM_VERSION/$SCALA_VERSION-$AMM_VERSION) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm'

RUN echo 'println("Ammonite installed!")' > hw.scala && /usr/local/bin/amm hw.scala 2>/dev/null && rm hw.scala