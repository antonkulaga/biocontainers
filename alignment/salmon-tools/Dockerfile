FROM quay.io/comp-bio-aging/mashmap:master

MAINTAINER Anton Kulaga

WORKDIR /opt

ENV BEDTOOLS="2.28.0"

RUN wget https://github.com/arq5x/bedtools2/releases/download/v$BEDTOOLS/bedtools-$BEDTOOLS.tar.gz && tar -xzf bedtools-$BEDTOOLS.tar.gz && rm -rf bedtools-$BEDTOOLS.tar.gz
WORKDIR /opt/bedtools2/bin
RUN wget https://github.com/arq5x/bedtools2/releases/download/v$BEDTOOLS/bedtools && chmod +x bedtools
WORKDIR /opt

RUN git clone https://github.com/COMBINE-lab/SalmonTools
RUN chmod +x /opt/SalmonTools/scripts/generateDecoyTranscriptome.sh

ENV PATH "$PATH:/opt/SalmonTools/scripts:/opt/bedtools2/bin"
CMD "/opt/SalmonTools/scripts/generateDecoyTranscriptome.sh"
USER cromwell