FROM ubuntu:trusty

MAINTAINER Daniel Middleton <d@monokal.io>

LABEL description="A Docker Image to run the NSD authoritative-only DNS server."

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get -y install git ansible

RUN mkdir -p /var/lib/ansible/local && \
    ansible-pull \
        -d /var/lib/ansible/local \
        -U https://github.com/monokal/docker-nsd.git \
        -i 127.0.0.1, \
        --purge

RUN apt-get -y purge software-properties-common git ansible

EXPOSE 53

ENTRYPOINT ["/usr/sbin/nsd"]
