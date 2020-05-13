#!/usr/bin/env bash
echo "building UI"
(cd ui && yarn build)
echo "building backend"
(cd backend && yarn build:prod)
docker-compose build traceman_server
docker-compose push traceman_server
