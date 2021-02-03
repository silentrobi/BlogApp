#!/bin/bash
pwd=`pwd`

source git-clone.sh

cd $pwd
echo $pwd

EMAIL_PASSWORD=`printenv EMAIL_PASSWORD`

# run infrastructure.yml file
docker-compose -f ../composes/infrastructure.yml up -d

# run services-local.yml file

docker-compose -f ../composes/services-local.yml up -d
