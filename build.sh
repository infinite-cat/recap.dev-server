#!/usr/bin/env bash
echo "updating submodules"
git submodule update --recursive --remote
echo "building UI"
(cd recap.dev-ui && yarn && yarn build)
echo "building backend"
(cd recap.dev-backend && yarn && yarn build:prod)
docker-compose build recap_dev_server
docker-compose push recap_dev_server
