FROM golang:alpine

MAINTAINER 3846masa <3846masahiro+git@gmail.com>

RUN apk add --no-cache ca-certificates

COPY ./ngrok .

RUN apk add --no-cache --virtual build-deps build-base git && \
    make release-server && \
    mv ./bin/ngrokd /usr/local/bin/ngrokd && \
    rm -rf ./* && \
    apk del --purge build-deps

EXPOSE 80 443 4443

CMD ngrokd -domain=${VHOST_NAME}
