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

ENV ENV_NAME="base"
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="$MAMBA_ROOT_PREFIX/bin/micromamba"
ENV PATH "$MAMBA_ROOT_PREFIX/bin:$PATH"

WORKDIR $MAMBA_ROOT_PREFIX
RUN wget -qO- https://micromamba.snakepit.net/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
RUN /opt/conda/bin/micromamba shell init -s bash -p /opt/conda/
RUN /opt/conda/bin/micromamba shell init -s bash -p /home/$USER/micromamba


WORKDIR /data


RUN echo "source /usr/local/bin/activate_env.sh" >> ~/.bashrc && \
    echo "source /usr/local/bin/activate_env.sh" >> /etc/skel/.bashrc && \
    mkdir -p "$MAMBA_ROOT_PREFIX" && \
    chmod -R a+rwx "$MAMBA_ROOT_PREFIX" "/home"

CMD ["/bin/bash"]

COPY activate_env.sh /usr/local/bin/activate_env.sh

RUN micromamba shell init -s bash -p /opt/conda
COPY .mambarc $MAMBA_ROOT_PREFIX/.mambarc
COPY shell.sh /usr/local/bin/shell.sh
RUN chmod +x /usr/local/bin/shell.sh
SHELL ["/usr/local/bin/shell.sh"]

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
