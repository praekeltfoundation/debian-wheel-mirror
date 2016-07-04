#!/usr/bin/env bash
set -e

DOCKER_IMAGE="python:2"
REQUIREMENT="$(pwd)/requirements.txt"
WHEEL_DIR="$(pwd)/wheelhouse"
NO_DEPS="--no-deps"

while [[ $# > 0 ]]; do
    key="$1"; shift

    case "$key" in
        -d|--docker-image)
            DOCKER_IMAGE="$1"; shift
            ;;
        -r|--requirement)
            REQUIREMENT="$1"; shift
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

docker run --rm \
  -v "$REQUIREMENT":/requirements.txt \
  -v "$WHEEL_DIR":/wheelhouse \
  $DOCKER_IMAGE \
  /bin/sh -c \
    "pip install --upgrade wheel && \
     pip wheel -r /requirements.txt -w /wheelhouse $NO_DEPS"
