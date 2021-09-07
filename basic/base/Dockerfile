FROM ubuntu:20.04

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

ENV TZ=Europe/Bucharest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt upgrade -y && \
    apt install -y tar gzip libz-dev software-properties-common python3-software-properties automake nano cmake zip wget gcc git build-essential curl gosu libbz2-dev zlib1g-dev gawk libxml2-dev

RUN ln -s /usr/bin/python3 /usr/bin/python

ENV PATH /opt/conda/bin:$PATH

WORKDIR /opt


# Setting $BASH_ENV and the SHELL command will not result in .bashrc being sourced when
# you supply the program to run as an argument to the "docker run" command.
# Manually add directory for micromamba installed executables to PATH as a workaround.
ENV PATH "$MAMBA_ROOT_PREFIX/bin:$PATH"

WORKDIR /
RUN wget -qO- https://micromamba.snakepit.net/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

WORKDIR /opt

ENV ENV_NAME="base"
ENV MAMBA_ROOT_PREFIX="/opt/conda"

ENV PATH "$MAMBA_ROOT_PREFIX/bin:$PATH"

# Use bash in Dockerfile RUN commands and make sure bashrc is sourced when
# executing commands with /bin/bash -c
# Needed to have the micromamba activate command configured etc.
SHELL ["/bin/bash", "-c"]

RUN useradd -ms /bin/bash micromamba && \
    mkdir -p "$MAMBA_ROOT_PREFIX" && \
    chmod -R a+rwx "$MAMBA_ROOT_PREFIX" "/home" && \
    export ENV_NAME="$ENV_NAME"

COPY entrypoint.sh /bin/entrypoint.sh

WORKDIR /data

ENTRYPOINT ["/bin/entrypoint.sh"]
# Define default command.
CMD ["/bin/bash"]