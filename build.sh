#!/bin/bash
set -e
echo "VERSION=$(cat VERSION)" > .env
source .env
echo "tagging: $VERSION"
docker-compose -f docker-compose.build.yml build
git add .
git commit -m "tagged $VERSION"
git tag $VERSION
git push
git push --tags
docker push pwoolvett/data-science-api:$VERSION
docker push pwoolvett/data-science-api:poetry-$VERSION
