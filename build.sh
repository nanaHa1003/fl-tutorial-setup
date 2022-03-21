#!/bin/bash

# Cleanup previous startup kits
rm -rf build/nvflare-tutorial

# Run NVFlare provision to generate startup kits
provision -p project.yml -w build -c custom

# Build base docker image
docker build -t nvflare:base -f build/Dockerfiles/Dockerfile.nvflare .

# Build docker images for server, client and admin
docker build -t nvflare:server -f build/Dockerfiles/Dockerfile.server .
docker build -t nvflare:client1 -f build/Dockerfiles/Dockerfile.client1 .
docker build -t nvflare:client2 -f build/Dockerfiles/Dockerfile.client2 .
docker build -t nvflare:admin -f build/Dockerfiles/Dockerfile.admin .
