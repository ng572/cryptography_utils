# cryptography_utils

## canonical setup

`docker build -f alpine311.Dockerfile . -t ng572/crypto`

`docker run -it --rm --privileged ng572/crypto`

## bash

`echo 'alias unlock="docker run --privileged -it --rm crypto"' >> ~/.bashrc`

## powershell

`Add-Content $Profile 'function unlock { docker run --privileged -it --rm crypto }'`
