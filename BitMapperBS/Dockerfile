FROM quay.io/comp-bio-aging/base

RUN apt install -y liblzma-dev #zlib1g-dev libbz2-dev

ENV LIBDIVSURFSORT_VERSION="2.0.1"

WORKDIR /opt/
RUN wget https://github.com/y-256/libdivsufsort/archive/$LIBDIVSURFSORT_VERSION.zip && unzip $LIBDIVSURFSORT_VERSION && rm -rf $LIBDIVSURFSORT_VERSION.zip
WORKDIR libdivsufsort-$LIBDIVSURFSORT_VERSION
RUN mkdir build
WORKDIR build
RUN cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr/local" ..
RUN make install
WORKDIR /opt/
RUN git clone https://github.com/chhylp123/BitMapperBS
WORKDIR /opt/BitMapperBS
RUN chmod +x /opt/BitMapperBS/htslib/version.sh
RUN make
ENV LD_LIBRARY_PATH="/opt/BitMapperBS/htslib_aim/lib"

ENV PATH="$PATH:/opt/BitMapperBS:/opt/BitMapperBS/pSAscan-0.1.0:/opt/BitMapperBS/pSAscan-0.1.0/src"
CMD /opt/BitMapperBS/bitmapperBS