FROM quay.io/comp-bio-aging/java:master

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

WORKDIR /opt

ENV ENA_PATH /opt/ena
RUN mkdir $ENA_PATH
WORKDIR $ENA_PATH

RUN wget http://ftp.ebi.ac.uk/pub/databases/ena/tools/ena-file-downloader.zip && \
    unzip ena-file-downloader.zip && \
    rm -rf *.zip
RUN chmod +x run.sh
ENV PATH $PATH:$ENA_PATH
CMD java -jar ${ENA_PATH}/ena-file-downloader.jar