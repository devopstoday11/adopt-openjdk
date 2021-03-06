#!/usr/bin/env bash

set -euo pipefail

GOOS="linux" go build -ldflags='-s -w' -o bin/helper github.com/paketo-buildpacks/libjvm/cmd/helper
GOOS="linux" go build -ldflags='-s -w' -o bin/main github.com/paketo-buildpacks/adopt-openjdk/cmd/main

strip bin/helper bin/main
upx -q -9 bin/helper bin/main

ln -fs main bin/build
ln -fs main bin/detect
