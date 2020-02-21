FROM quay.io/comp-bio-aging/base:master

MAINTAINER Anton Kulaga

RUN apt-get update && apt-get install -y sudo openssh-server libxml2-dev cpanminus

ENV SRA_VERSION=2.10.3
ENV SRA_SUB_VERSION=ubuntu64

#installing sra-toolkit

RUN apt-get update -y && \
    wget -P / "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${SRA_VERSION}/sratoolkit.${SRA_VERSION}-${SRA_SUB_VERSION}.tar.gz" && \
    tar zxf /sratoolkit.${SRA_VERSION}-${SRA_SUB_VERSION}.tar.gz && \
    cp -r /sratoolkit.${SRA_VERSION}-${SRA_SUB_VERSION}/bin/* /usr/bin && \
    rm -fr /sratoolkit.${SRA_VERSION}-${SRA_SUB_VERSION}*

RUN cpanm install XML::LibXML

## installation of ibm-aspera-connect
ENV VERSION=3.9.8
ENV SUB_VERSION=173386-linux-g2.12-64

RUN useradd --create-home downloader | chpasswd && adduser downloader sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER downloader

WORKDIR /home/downloader

RUN echo $(pwd)
RUN ls -a

# Check for latest link: http://downloads.asperasoft.com/en/downloads/8?list
ENV NAME=ibm-aspera-connect-${VERSION}.${SUB_VERSION}
RUN wget https://download.asperasoft.com/download/sw/connect/${VERSION}/$NAME.tar.gz
RUN tar -zxvf $NAME.tar.gz

# run it
RUN sudo chmod +x $NAME.sh
RUN ./$NAME.sh

# delete yet unnecessary installation file
RUN rm ./$NAME.sh

ENV KEY=/home/downloader/.aspera/connect/etc/asperaweb_id_dsa.openssh
RUN cp $KEY ./asperaweb_id_dsa.openssh && chmod 400 ./asperaweb_id_dsa.openssh
RUN eval `ssh-agent -s` && ssh-add asperaweb_id_dsa.openssh
# symbolic link for ascp
#RUN ln -s /root/.aspera/connect/bin/ascp /usr/bin/ascp

ENV PATH=$PATH:/home/downloader/:/home/downloader/.aspera/connect/bin

COPY src/ ./
RUN sudo chmod +x download_sra.sh
RUN sudo chmod +x download_sra_aspera.sh