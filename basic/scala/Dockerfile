FROM quay.io/comp-bio-aging/java:latest

LABEL maintainer="antonkulaga@gmail.com"

RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add

# Install sbt
RUN apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

# install coursier

WORKDIR /bin
RUN curl -fLo coursier https://git.io/coursier-cli && chmod +x coursier && coursier

WORKDIR /data

CMD ["coursier"]