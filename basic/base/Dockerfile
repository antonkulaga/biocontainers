FROM ubuntu:18.04

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

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

# Define default command.
CMD ["/bin/bash"]