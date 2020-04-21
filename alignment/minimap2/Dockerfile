FROM quay.io/comp-bio-aging/base:latest

ENV minimap2_version=2.17
ENV SAMTOOLS_VERSION 1.10

# update package manager & build essentials
RUN apt-get update \
    && apt-get install --yes build-essential wget libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev

# install samtools
RUN cd /tmp \
    && wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 \
    && tar xvjf samtools-${SAMTOOLS_VERSION}.tar.bz2 \
    && cd samtools-${SAMTOOLS_VERSION} \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd / && rm -rf /tmp/samtools-${SAMTOOLS_VERSION}

RUN cd /tmp/ \
    && wget https://github.com/lh3/minimap2/releases/download/v${minimap2_version}/minimap2-${minimap2_version}_x64-linux.tar.bz2 \
    && tar -jxvf minimap2-${minimap2_version}_x64-linux.tar.bz2 \
    && cd minimap2-${minimap2_version}_x64-linux \
    && cp minimap2 k8 paftools.js /usr/local/bin/

CMD minimap2