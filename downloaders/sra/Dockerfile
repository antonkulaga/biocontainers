FROM quay.io/comp-bio-aging/base:latest

MAINTAINER Anton Kulaga

ENV VERSION=3.9.1
ENV SUB_VERSION=171801-linux-g2.12-64

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





## Commands for test downloads:

# SRR000001.sra (298 Mb)
# ascp -T -k 1 -i /root/.aspera/connect/etc/asperaweb_id_dsa.openssh anonftp@ftp-trace.ncbi.nih.gov:sra/sra-instant/reads/ByRun/sra/SRR/SRR000/SRR000001/SRR000001.sra .

# download_sra.sh SRR000001

# download_sra_aspera.sh SRR000001


# SRR2925201.sra (1393 Mb)
# ascp -T -k 1 -i /root/.aspera/connect/etc/asperaweb_id_dsa.openssh anonftp@ftp-trace.ncbi.nih.gov:sra/sra-instant/reads/ByRun/sra/SRR/SRR292/SRR2925201/SRR2925201.sra .
