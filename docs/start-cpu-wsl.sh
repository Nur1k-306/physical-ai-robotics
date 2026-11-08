#!/usr/bin/env bash
# Windows / Docker Desktop adapter. Delegates to the unchanged course script.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
if ! command uname -r | grep -qi microsoft; then
  echo 'This adapter is for Ubuntu WSL on Windows with Docker Desktop.' >&2
  exit 1
fi
uname() {
  if [[ "${1-}" == '-s' ]]; then
    printf '%s\n' Windows_NT
  else
    command uname "$@"
  fi
}
docker() {
  local arg
  local -a args=()
  for arg in "$@"; do
    # Windows reserves 5815-5914 on this host. Keep the container VNC port intact.
    if [[ "$arg" == '5900:5900' ]]; then
      arg='15900:5900'
    fi
    args+=("$arg")
  done
  command docker "${args[@]}"
}
export -f uname docker
echo 'Windows adapter: noVNC http://localhost:6080/vnc.html; direct VNC localhost:15900 (course banner still says 5900).'
exec bash ./scripts/run_container.sh --cpu "$@"
