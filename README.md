# debian-wheel-mirror
Automated Python wheel building and deployment for https://pypi.p16n.org

This repository contains a list of Python packages that we build in to wheels and upload to our PyPi mirror. These wheels are used in our Debian-based Docker images:  [`praekeltfoundation/dockerfiles`](https://github.com/praekeltfoundation/dockerfiles).

These packages are dependencies of software that we use or maintain. They have native extensions and so would typically require build tools to be installed before they could be used. We build the packages into binary wheels so that build tools are not required. Generally, other dependencies that don't require build tools should be fetched from the standard PyPi repository (https://pypi.python.org).

The packages are built inside Debian Jessie-based Docker containers. As such, the wheels that are produced are only guaranteed to be compatible with Debian Jessie. For some of these wheels, it may still be necessary to install runtime dependencies using `apt`.
