FROM monokal/ansible-pull:latest

MAINTAINER Daniel Middleton <d@monokal.io>

# ansible-pull will have already run at this point (ONBUILD)
# so how dafuq do I inject:
ENV PLAYBOOK_REPO https://github.com/monokal/docker-nsd.git

EXPOSE 53

ENTRYPOINT ["/usr/sbin/nsd"]
