#!/usr/bin/env bash
set -e

BLUE='\033[0;34m'
LBLUE='\033[1;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [[ -n "${IS_CI_RUNNER-}" ]] ; then
    echo 'skip loading project.env'
else
    source ./devops/local/scripts/load-env.sh
fi

source ./configs/envs/deployment.env
source ./devops/ci/scripts/get-latest-version.sh

source ./devops/docker/scripts/login-to-registry.sh
docker push $IMAGE_NAME:$VERSION
