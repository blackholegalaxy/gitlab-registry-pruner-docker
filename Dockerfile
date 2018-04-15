FROM golang:1.10.1-alpine3.7

LABEL maintainer="blackholegalaxy"

RUN apk add --update --no-cache --virtual .build-deps git \
  && go get -v -u gitlab.com/gitlab-org/docker-distribution-pruner \
  && apk del .build-deps

ENTRYPOINT ["docker-distribution-pruner"]

CMD ["--help"]