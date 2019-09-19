FROM combinelab/salmon:latest
RUN useradd -r -u 1002 cromwell
ENV EUID=1002
RUN usermod -aG docker cromwell
RUN groupadd -r cromwell && useradd -r -g cromwell cromwell
USER cromwell