FROM nvidia/cuda:devel

MAINTAINER Anton Kulaga <antonkulaga@gmail.com>

ENV ARIOC_VERSION="v1.40"
ENV ARIOC_NAME="Arioc.x.140"

WORKDIR /opt/
RUN wget https://github.com/RWilton/Arioc/releases/download/$ARIOC_VERSION/$ARIOC_NAME.zip && unzip $ARIOC_NAME.zip && rm $ARIOC_NAME.zip
RUN mv src arioc
WORKDIR /opt/arioc
RUN make clean
RUN make AriocE
RUN make AriocU
RUN make AriocP
