FROM quay.io/comp-bio-aging/fastv

RUN ln -s /usr/local/bin/fastv /usr/local/bin/fastp
RUN mkdir /opt/gencore
WORKDIR /opt/gencore
RUN wget http://opengene.org/gencore/gencore && chmod a+x ./gencore

ENV PATH "$PATH:/opt/gencore"
CMD "/opt/gencore/gencore"