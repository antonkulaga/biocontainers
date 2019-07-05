FROM quay.io/comp-bio-aging/mashmap:master

MAINTAINER Anton Kulaga

WORKDIR /opt

RUN git clone https://github.com/COMBINE-lab/SalmonTools

ENV PATH "$PATH:/opt/SalmonTools/scripts"
CMD "/opt/SalmonTools/scripts/generateDecoyTranscriptome.sh"