#!/usr/bin/env bash
envFile="$PWD/configs/envs/local.env"
npx env-cmd -f $envFile "$PWD/devops/local/scripts/check-env-vars.sh"

npx env-cmd -f $envFile npm run ng:build
