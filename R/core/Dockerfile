FROM rocker/rstudio:latest

MAINTAINER antonkulaga@gmail.com

# nuke cache dirs before installing pkgs; tip from Dirk E fixes broken img
RUN  rm -f /var/lib/dpkg/available && rm -rf  /var/cache/apt/*

RUN apt update && apt -y upgrade
RUN apt -y install --fix-missing gdb python3-pip libxml2-dev libz-dev nano libbz2-dev zlib1g-dev libbz2-dev liblzma-dev libgsl-dev

RUN pip3 install awscli

ADD install.R /tmp/

RUN R -f /tmp/install.R

RUN chown -R rstudio /home/rstudio/
#RUN rm -rf /home/rstudio/kitematic
RUN mkdir /data && ln -s /data /home/rstudio/data

# invalidates cache every 24 hours
#ADD http://master.bioconductor.org/todays-date /tmp/