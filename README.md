# debian-wheel-mirror

[![Build Status](https://travis-ci.org/praekeltfoundation/debian-wheel-mirror.svg?branch=develop)](https://travis-ci.org/praekeltfoundation/debian-wheel-mirror)
[![Requirements Status](https://requires.io/github/praekeltfoundation/debian-wheel-mirror/requirements.svg?branch=develop)](https://requires.io/github/praekeltfoundation/debian-wheel-mirror/requirements/?branch=develop)

Automated Python wheel building and deployment for Praekelt's PyPi mirrors.

This repository contains a list of Python packages that we build into wheels and upload to our PyPi mirror. These wheels are used in our base Python Docker images:  [`praekeltfoundation/dockerfiles`](https://github.com/praekeltfoundation/dockerfiles).

The packages are kept up-to-date by automated pull requests made by [Requires.io](https://requires.io/github/praekeltfoundation/debian-wheel-mirror/requirements/?branch=develop). Packages are built inside Docker containers and uploaded to our PyPi mirror by [Travis CI](https://travis-ci.org/praekeltfoundation/debian-wheel-mirror).

These packages are dependencies of software that we use or maintain. They have native extensions and so would typically require build tools to be installed before they could be used. We build the packages into binary wheels so that build tools are not required within our Docker containers. Generally, other dependencies that don't require build tools should be fetched from the standard PyPi repository (https://pypi.python.org).

The packages are built inside Docker containers and the wheels produced are only guaranteed to be compatible with the Linux variety that they were built in. For some of these wheels, it may still be necessary to install runtime dependencies using the OS's native package manager. The specific Docker images that are used can be seen in the [Travis file](.travis.yml).

The Python packages to build are all listed in the [`requirements.txt`](requirements.txt) file. ~~We use Python's environment markers (see [PEP 496](https://www.python.org/dev/peps/pep-0496/)) to selectively build wheels for certain platforms~~ (see #26).
