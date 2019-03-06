FROM quay.io/comp-bio-aging/rstudio:master

MAINTAINER antonkulaga@gmail.com

# nuke cache dirs before installing pkgs; tip from Dirk E fixes broken img
RUN  rm -f /var/lib/dpkg/available && rm -rf  /var/cache/apt/*

RUN apt update && apt -y upgrade
RUN apt -y install --fix-missing gdb libxml2-dev python-pip libz-dev nano

RUN pip install awscli

ADD install.R /tmp/

RUN R -f /tmp/install.R