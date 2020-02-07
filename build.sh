#!/bin/sh

set -euxo pipefail

# Retrieve the latest hugo version.
HUGO_VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | grep -o '[0-9]\.[0-9]\+\.[0-9]\+')

docker build -t biodranik/hugo-extended-git-postcss-cli:$HUGO_VERSION --build-arg HUGO_VERSION=$HUGO_VERSION .
# Also build latest tag/version.
docker build -t biodranik/hugo-extended-git-postcss-cli --build-arg HUGO_VERSION=$HUGO_VERSION .
