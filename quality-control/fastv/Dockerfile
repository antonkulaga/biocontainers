FROM quay.io/comp-bio-aging/base:latest

# set the environment variables
ENV fastv_version 0.3.0

# run update and install necessary tools
RUN apt-get update -y && apt-get install -y \
    libnss-sss \
    vim \
    less \
    unzip \
    zlib1g-dev

WORKDIR /usr/local/bin/
RUN wget https://github.com/OpenGene/fastv/archive/v${fastv_version}.zip
RUN unzip v${fastv_version}.zip
WORKDIR /usr/local/bin/fastv-${fastv_version}
RUN make
RUN make install
WORKDIR /usr/local/bin

# set default command
CMD ["fastv"]