# debian-wheel-mirror

[![Build Status](https://travis-ci.org/praekeltfoundation/debian-wheel-mirror.svg?branch=develop)](https://travis-ci.org/praekeltfoundation/debian-wheel-mirror)
[![Requirements Status](https://requires.io/github/praekeltfoundation/debian-wheel-mirror/requirements.svg?branch=develop)](https://requires.io/github/praekeltfoundation/debian-wheel-mirror/requirements/?branch=develop)

Automated Python wheel building and deployment for https://pypi.p16n.org

This repository contains a list of Python packages that we build into wheels and upload to our PyPi mirror. These wheels are used in our Debian-based Docker images:  [`praekeltfoundation/dockerfiles`](https://github.com/praekeltfoundation/dockerfiles).

The packages are kept up-to-date by automated pull requests made by [Requires.io](https://requires.io/github/praekeltfoundation/debian-wheel-mirror/requirements/?branch=develop). Packages are built inside Docker containers (currently using the [`python:2`](https://hub.docker.com/_/python/) image) and uploaded to our PyPi mirror by [Travis CI](https://travis-ci.org/praekeltfoundation/debian-wheel-mirror).

These packages are dependencies of software that we use or maintain. They have native extensions and so would typically require build tools to be installed before they could be used. We build the packages into binary wheels so that build tools are not required. Generally, other dependencies that don't require build tools should be fetched from the standard PyPi repository (https://pypi.python.org).

The packages are built inside Debian Jessie-based Docker containers. As such, the wheels that are produced are only guaranteed to be compatible with Debian Jessie. For some of these wheels, it may still be necessary to install runtime dependencies using `apt`.
