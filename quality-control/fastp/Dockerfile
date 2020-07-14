FROM quay.io/comp-bio-aging/base:latest

# set the environment variables
ENV fastp_version 0.20.1

# run update and install necessary tools
RUN apt-get update -y && apt-get install -y \
    libnss-sss \
    vim \
    less \
    unzip \
    zlib1g-dev

WORKDIR /usr/local/bin/
RUN wget https://github.com/OpenGene/fastp/archive/v${fastp_version}.zip
RUN unzip v${fastp_version}.zip
WORKDIR /usr/local/bin/fastp-${fastp_version}
RUN make
RUN make install
WORKDIR /usr/local/bin

# set default command
CMD ["fastp"]