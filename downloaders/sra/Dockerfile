FROM ncbi/sra-toolkit:latest

MAINTAINER Anton Kulaga

ENV VERSION=3.9.1
ENV SUB_VERSION=171801-linux-g2.12-64

RUN apt-get update && apt-get install -y wget nano

## installation of ibm-aspera-connect

# Check for latest link: http://downloads.asperasoft.com/en/downloads/8?list
RUN wget -qO- https://download.asperasoft.com/download/sw/connect/${VERSION}/ibm-aspera-connect-${VERSION}.${SUB_VERSION}.tar.gz | tar xvz

# run it
RUN ./ibm-aspera-connect-${VERSION}.${SUB_VERSION}.sh

# delete yet unnecessary installation file
RUN rm ./ibm-aspera-connect-${VERSION}.${SUB_VERSION}.sh

# symbolic link for ascp
RUN ln -s /root/.aspera/connect/bin/ascp /usr/bin/ascp

WORKDIR /data
COPY src/ /usr/bin
RUN chmod +x /usr/bin/download_sra.sh
RUN chmod +x /usr/bin/download_sra_aspera.sh