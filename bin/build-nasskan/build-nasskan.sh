#!/usr/bin/env sh

test -e $(command -v podman) || { echo "install podman first"; exit; }

podman run -v ${PWD}:/build -w /build ubuntu:20.04 sh nasskan-cargo.sh
