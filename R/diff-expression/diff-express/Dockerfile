FROM quay.io/comp-bio-aging/rstudio:master

MAINTAINER antonkulaga@gmail.com

RUN apt -y install --fix-missing gdb libxml2-dev python-pip libz-dev nano libbz2-dev zlib1g-dev libbz2-dev liblzma-dev

ADD install.R /tmp/
RUN R -f /tmp/install.R
ADD src /home/rstudio/
RUN chmod +x /home/rstudio/convert.R
RUN chmod +x /home/rstudio/diff.R
ENV PATH "$PATH:/home/rstudio/"
CMD /home/rstudio/convert.R