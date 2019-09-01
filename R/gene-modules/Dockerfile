FROM quay.io/comp-bio-aging/rstudio:master

MAINTAINER antonkulaga@gmail.com

ADD install.R /tmp/
RUN R -f /tmp/install.R
ADD src /home/rstudio/

ENV PATH "$PATH:/home/rstudio/"
WORKDIR /home/rstudio