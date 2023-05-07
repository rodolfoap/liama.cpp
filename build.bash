#!/bin/bash
cd $(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
set -x

DOCKER_BUILDKIT=1 docker build -t liama .
