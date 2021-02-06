#!/usr/bin/env bash
echo "updating submodules"
git submodule update --recursive --remote
echo "building UI"
(cd recap.dev-ui && yarn && yarn build)
echo "building backend"
(cd recap.dev-backend && yarn && yarn build:prod)
docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --push --tag recapdev/server:0.6.1 --tag recapdev/server:latest .
