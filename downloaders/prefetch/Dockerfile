FROM quay.io/biocontainers/sra-tools:2.9.1_1--h470a237_0

MAINTAINER Anton Kulaga

ENV PLATFORM=linux-64
ENV VERSION=3.9.0
ENV SUB_VERSION=165543

RUN wget https://download.asperasoft.com/download/sw/client/${VERSION}/ibm-aspera-desktopclient-${VERSION}.${SUB_VERSION}-${PLATFORM}.deb
RUN dpkg -i ibm-aspera-desktopclient-${VERSION}.${SUB_VERSION}-${PLATFORM}.deb
RUN eval $(ssh-agent) && echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN ssh-keygen -q -N "" -f /asperaweb_id_dsa.openssh
#RUN ssh-add  /asperaweb_id_dsa.openssh

WORKDIR /data
COPY src/ /usr/bin
RUN chmod +x /usr/bin/download_sra.sh
RUN chmod +x /usr/bin/download_sra_aspera.sh