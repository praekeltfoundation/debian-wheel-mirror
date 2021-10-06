#!/usr/bin/env bash
set -e

DOCKER_IMAGE="python:2"
REQUIREMENTS=()
WHEEL_DIR="$(pwd)/wheelhouse"
NO_DEPS="--no-deps"

while [[ $# > 0 ]]; do
    key="$1"; shift

    case "$key" in
        -d|--docker-image)
            DOCKER_IMAGE="$1"; shift
            ;;
        -r|--requirement)
            REQUIREMENTS+=("$1"); shift
            ;;
        -w|--wheel-dir)
            WHEEL_DIR="$1"; shift
            ;;
        --deps)
            NO_DEPS=""
            ;;
        *)
            # Unknown option
            echo "Unknown parameter: $key" 1>&2
            exit 1
            ;;
    esac
done

if [[ -z "${REQUIREMENTS[@]}" ]]; then
  REQUIREMENTS=("$(pwd)/requirements.txt")
fi

REQUIREMENT_VOLUMES=()
REQUIREMENT_OPTS=()
for requirement in "${REQUIREMENTS[@]}"; do
  requirement_file="$(basename $requirement)"
  REQUIREMENT_VOLUMES+=("-v" "$requirement:/$requirement_file")
  REQUIREMENT_OPTS+=("-r" "/$requirement_file")
done

# Set CPUCOUNT=1 in an attempt to avoid random uWSGI build errors on bullseye.
docker run --rm \
  "${REQUIREMENT_VOLUMES[@]}" \
  -v "$WHEEL_DIR":/wheelhouse \
  -e "CPUCOUNT=1" \
  $DOCKER_IMAGE \
  pip wheel "${REQUIREMENT_OPTS[@]}" -w /wheelhouse -f /wheelhouse $NO_DEPS
