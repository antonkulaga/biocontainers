FROM dnanexus/parliament2:latest

WORKDIR /home/dnanexus
COPY parliament2.py /home/dnanexus/parliament2.py
RUN chmod -R 777 /home/dnanexus

ENTRYPOINT ["/bin/bash"]
CMD ["/home/dnanexus/parliament2.py"]
