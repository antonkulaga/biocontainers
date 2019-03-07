FROM quay.io/comp-bio-aging/base:latest

RUN add-apt-repository ppa:linuxuprising/java && apt update

# Install Java.
RUN  apt install -y openjdk-11-jdk

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64