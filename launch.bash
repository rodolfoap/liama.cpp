#!/bin/bash
cd $(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
set -x

docker run -ti --rm --name liama \
	-v $(pwd)/models/:/liama/models/ \
	-v $(pwd)/entrypoint.bash:/liama/entrypoint.bash \
	liama
