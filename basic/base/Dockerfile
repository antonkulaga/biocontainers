FROM ubuntu:20.04

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

ENV TZ=Europe/Bucharest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt upgrade -y && \
    apt install -y tar gzip libz-dev software-properties-common python3-software-properties automake nano cmake zip wget gcc git build-essential curl gosu libbz2-dev zlib1g-dev gawk libxml2-dev

RUN ln -s /usr/bin/python3 /usr/bin/python

ENV PATH /opt/conda/bin:$PATH

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    /bin/bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN wget -qO- https://micromamba.snakepit.net/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

# Define default command.
CMD ["/bin/bash"]