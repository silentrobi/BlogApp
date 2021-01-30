#!/bin/bash
pwd=`pwd`

source git-clone.sh

cd $pwd

# run infrastructure.yml file
docker-compose -f ../composes/infrastructure.yml up -d

# run services-local.yml file

docker-compose -f ../composes/services-local.yml up

read junk