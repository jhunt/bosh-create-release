FROM alpine:3
ADD https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.0/bosh-cli-6.4.0-linux-amd64 /usr/bin/bosh
RUN chmod 0755 /usr/bin/bosh

RUN apk update \
 && apk add git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
