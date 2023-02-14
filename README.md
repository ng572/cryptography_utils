# cryptography_utils

`docker build -f 2004.Dockerfile . -t crypto`

## bash

`echo 'alias unlock="cd ~; docker-compose run crypto"' >> ~/.bashrc`

## powershell

`Add-Content $Profile 'function unlock { docker run --privileged -it --rm crypto }'`
