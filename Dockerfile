FROM ghcr.io/seisscoped/container-base

LABEL maintainer="Yiyu Ni"

RUN pip install noisepy-seis \
    && docker-clean