FROM alpine

MAINTAINER Micke Lisinge <me@mike.gg>

ARG VCS_REF
ARG BUILD_DATE

ENV KUBE_LATEST_VERSION="v1.3.5"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

ENTRYPOINT ["kubectl"]
CMD ["help"]
