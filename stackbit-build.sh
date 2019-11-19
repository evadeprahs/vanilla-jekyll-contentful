#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd477c4aac7e400194afb7a/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd477c4aac7e400194afb7a
curl -s -X POST https://api.stackbit.com/project/5dd477c4aac7e400194afb7a/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5dd477c4aac7e400194afb7a/webhook/build/publish > /dev/null
