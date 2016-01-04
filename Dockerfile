FROM ubuntu:trusty

MAINTAINER Daniel Middleton <d@monokal.io>

ENV PLAYBOOK_REPO https://github.com/monokal/docker-nsd.git
ENV DEBIAN_FRONTEND noninteractive

# Install Ansible & dependencies.
RUN apt-get update && \
    apt-get -y install software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get -y install git ansible

# Run the Playbook using ansible-pull.
RUN ansible-pull \
        -d /var/tmp \
        -U $PLAYBOOK_REPO \
        -i 127.0.0.1, \
        --purge

# Cleanup.
RUN apt-get -y purge software-properties-common git ansible && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    unset DEBIAN_FRONTEND

EXPOSE 53

CMD ["/usr/sbin/nsd"]
