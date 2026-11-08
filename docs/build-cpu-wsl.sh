#!/usr/bin/env bash
# Build local compatibility variant; start with the original course script afterwards.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
mkdir -p ../panda-wheel-cache
docker build --network host --build-context wheels=../panda-wheel-cache -t mujoco-vnc-cpu -f docs/Dockerfile.cpu.locked .
