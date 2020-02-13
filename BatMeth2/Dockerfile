FROM quay.io/comp-bio-aging/fastp

#Install samtools
RUN apt-get update && apt-get install -y samtools

#Install R
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y r-base
RUN R -e "install.packages(c('ggplot2', 'pheatmap', 'xtable'))"

RUN apt-get install -y libgsl-dev

WORKDIR /opt
RUN git clone https://github.com/GuoliangLi-HZAU/BatMeth2
WORKDIR BatMeth2
RUN ./configure
RUN make
RUN make copy
RUN Rscript scripts/install.rpackages.r