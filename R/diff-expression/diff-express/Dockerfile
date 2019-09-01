FROM quay.io/comp-bio-aging/rstudio:master

MAINTAINER antonkulaga@gmail.com

ADD install.R /tmp/
RUN R -f /tmp/install.R
ADD src /home/rstudio/
RUN chmod +x /home/rstudio/convert.R && chmod +x /home/rstudio/diff.R && chmod +x /home/rstudio/tx2gene.R && chmod +x /home/rstudio/tx2gene_all.R

ENV PATH "$PATH:/home/rstudio/"
WORKDIR /home/rstudio
CMD /home/rstudio/convert.R