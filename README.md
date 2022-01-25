# Noggin

[![PyPI](https://img.shields.io/pypi/v/noggin-aaa.svg)](https://pypi.org/project/noggin-aaa/)
[![Supported Python versions](https://img.shields.io/pypi/pyversions/noggin-aaa.svg)](https://pypi.org/project/noggin-aaa/)
![Tests status](https://github.com/fedora-infra/noggin/actions/workflows/tests.yml/badge.svg?branch=dev)
[![Documentation](https://readthedocs.org/projects/noggin-aaa/badge/?version=latest)](https://noggin-aaa.readthedocs.ui/en/latest/)

*noggin* is a self-service portal for FreeIPA.
The primary purpose of the portal is to allow users to sign up and manage their
account information and group membership.

The documentation is available online at https://noggin-aaa.readthedocs.io/

# Deploying using Docker/Podman

To deploy noggin using Docker/Podman run the following command:
```
docker run\
 -e "DOMAIN=example.com"\
 -e "IPA_SERVER=ipa.example.com"\
 -e "REALM=EXAMPLE.COM"\
 -e "IPA_ADMIN_USERNAME=admin"\
 -e "IPA_ADMIN_PASSWORD=admin"\
 -v /opt/noggin/noggin.cfg:./noggin.cfg\
 -h noggin.example.com\
 -p 5000:5000\
 --name noggin\
 --restart=always\
 korewachino/noggin:latest
```

This will put the noggin server in the background and expose it on port 5000.

You can also use this following docker-compose file to deploy noggin:
```
version: '3'
services:
    noggin:
        image: korewachino/noggin
        ports:
            - 5000:5000
        volumes:
            - /opt/noggin/noggin.cfg:./noggin.cfg
            - /etc/ipa/ca.crt:/etc/ipa/ca.crt
        hostname: noggin.example.com
        restart: unless-stopped
```