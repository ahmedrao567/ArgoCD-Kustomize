#!/usr/bin/env bash

set -euo pipefail
TAG=${1:-dev}

# Build server image
docker build -t ahmedikram567/spring-boot-server:${TAG} -f spring-boot-react-mysql/spring-boot-server/Dockerfile spring-boot-react-mysql/spring-boot-server

# Build client image
docker build -t ahmedikram567/react-client:${TAG} -f spring-boot-react-mysql/react-client/Dockerfile spring-boot-react-mysql/react-client

# Push images
docker push ahmedikram567/spring-boot-server:${TAG}
docker push ahmedikram567/react-client:${TAG}

echo "Pushed ahmedikram567/spring-boot-server:${TAG} and ahmedikram567/react-client:${TAG}"