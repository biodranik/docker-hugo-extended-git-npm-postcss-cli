FROM alpine:latest

# Pass version from command line during the build:
# $ docker build --build-arg HUGO_VERSION=0.64.0 .
ARG HUGO_VERSION

LABEL maintainer="Alexander Borsuk <me@alex.bio>"
LABEL description="Build static sites using Hugo Extended site generator. Includes git, npm and postcss-cli."
LABEL version=HUGO_VERSION

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp/hugo.tar.gz
RUN apk add --update --cache-dir /tmp bash npm git libc6-compat libstdc++ ca-certificates \
    && npm install -g postcss-cli autoprefixer \
    && npm cache clean --force \
    && tar -xf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/*

EXPOSE 1313
WORKDIR /src
CMD ["/usr/bin/hugo"]
