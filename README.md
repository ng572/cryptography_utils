# cryptography_utils

`docker build -f alpine311.Dockerfile . -t crypto`

## bash

`echo 'alias unlock="docker run --privileged -it --rm crypto"' >> ~/.bashrc`

## powershell

`Add-Content $Profile 'function unlock { docker run --privileged -it --rm crypto }'`
