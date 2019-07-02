!#/bin/env bash
set -e
source .env
echo "tagging: $VERSION"
docker-compose -f docker-compose.build.yml build
git commit -m "tagged $VERSION"
git tag $VERSION
git push
git push --tags
docker push pwoolvett/data-science-api:$VERSION
