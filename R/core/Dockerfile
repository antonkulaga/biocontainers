FROM rocker/rstudio:latest

MAINTAINER antonkulaga@gmail.com


# nuke cache dirs before installing pkgs; tip from Dirk E fixes broken img
RUN  rm -f /var/lib/dpkg/available && rm -rf  /var/cache/apt/*

RUN apt update && apt upgrade -y
RUN apt install -y --fix-missing gdb python3-pip libxml2-dev libz-dev nano libbz2-dev zlib1g-dev libbz2-dev liblzma-dev libgsl-dev libcurl4-openssl-dev

RUN pip3 install awscli

#catching up with BASE container

ENV TZ=Europe/Bucharest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt install -y tar gzip libz-dev software-properties-common python3-software-properties automake nano cmake zip wget gcc git build-essential curl gosu libbz2-dev zlib1g-dev gawk libxml2-dev

RUN ln -s /usr/bin/python3 /usr/bin/python

ENV PATH /opt/conda/bin:$PATH

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    /bin/bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# R stuff

ADD install.R /tmp/

RUN R -f /tmp/install.R

RUN chown -R rstudio /home/rstudio/
#RUN rm -rf /home/rstudio/kitematic
RUN mkdir /data && ln -s /data /home/rstudio/data

# invalidates cache every 24 hours
#ADD http://master.bioconductor.org/todays-date /tmp/