FROM quay.io/comp-bio-aging/fastp

RUN mkdir /opt/gencore
WORKDIR /opt/gencore
RUN wget http://opengene.org/gencore/gencore && chmod a+x ./gencore

ENV PATH "$PATH:/opt/gencore"
CMD "/opt/gencore/gencore"