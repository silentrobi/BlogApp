#!/bin/bash
REPOSITORIES=(Blog.Service.Notification Blog.ApiGateway.Ocelot Blog.Service.Identity Blog.Service.BlogApi)
cd ../../
for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Cloning the repository: $REPOSITORY
	 echo ========================================================
	 REPO_URL=https://github.com/silentrobi/$REPOSITORY.git
	 git clone $REPO_URL
done