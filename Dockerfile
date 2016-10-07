FROM gliderlabs/alpine:3.3

MAINTAINER Gowtham Sadasivam <http://gowthamsadasivam.me>

LABEL Package="BetterCAP" \
      Version="1.5.8" \
      Description="BetterCAP the state of the art, modular, portable and easily extensible MITM framework in a Container" \
      Destro="Alpine Linux 3.3" \
      GitHub="https://github.com/gowthamsadasivam/docker-bettercap" \
      DockerHub="https://hub.docker.com/r/gowthamsadasivam/docker-bettercap/" \
      Maintainer="Gowtham Sadasivam"

RUN apk add --no-cache --update \
    bash=4.3.42-r3 \
    build-base=0.4-r1 \
    musl-dev=1.1.12-r5 \
    ruby=2.2.4-r0 \
    ruby-dev=2.2.4-r0 \
    ruby-irb=2.2.4-r0 \
    ruby-rdoc=2.2.4-r0 \
    libcap-dev=2.24-r1 \
    libpcap-dev=1.7.4-r0 \
    iptables-dev=1.4.21-r4 \
    && rm -rf /var/cache/apk/*

RUN gem update --system --source http://rubygems.org/
RUN gem install bettercap

EXPOSE 80 443 5300 8080 8081 8082 8083

ENTRYPOINT ["bettercap"]
CMD ["-h"]
