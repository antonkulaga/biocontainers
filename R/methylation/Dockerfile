FROM quay.io/comp-bio-aging/rstudio:master

MAINTAINER antonkulaga@gmail.com

RUN apt install  -y --fix-missing gdb libxml2-dev libz-dev nano libbz2-dev zlib1g-dev libbz2-dev liblzma-dev libgsl-dev libgmp-dev

ADD install.R /tmp/
RUN R -f /tmp/install.R
ADD src /home/rstudio/

ENV PATH "$PATH:/home/rstudio/"
WORKDIR /home/rstudio