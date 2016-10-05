FROM golang:alpine

MAINTAINER 3846masa <3846masahiro+git@gmail.com>

RUN apk --update add ca-certificates git && \
    apk add --virtual build-dependencies build-base

COPY ./ngrok .

RUN make release-server && mv ./bin/ngrokd /usr/local/bin/ngrokd

EXPOSE 80 443 4443

CMD ngrokd -domain=${VHOST_NAME}
