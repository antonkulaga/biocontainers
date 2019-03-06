FROM quay.io/comp-bio-aging/rstudio

MAINTAINER antonkulaga@gmail.com

ADD src /home/rstudio/
RUN chown -R rstudio /home/rstudio/

ADD install.R /tmp/

RUN R -f /tmp/install.R