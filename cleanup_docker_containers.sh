#!/bin/bash

docker-compose stop
docker-compose down --rmi all --remove-orphans || true
