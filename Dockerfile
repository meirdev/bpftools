FROM python:2.7

RUN apt-get update --allow-insecure-repositories && \
    apt-get install -y tcpdump git python-setuptools libpcap-dev libreadline-dev binutils-dev bison flex

RUN easy_install pcappy

RUN git clone -b fix-p0f-ittl https://github.com/meirdev/bpftools.git 

RUN cd bpftools && \
    make

RUN python -m pip install scapy

ENTRYPOINT [ "./bpftools/bpfgen" ]
