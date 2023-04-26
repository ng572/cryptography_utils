# cryptography_utils

## canonical setup

`docker build -f alpine311.Dockerfile . -t ng572/crypto`

pick one of the followings depending on your OS

### bash

`echo 'alias unlock="docker run --privileged -it --rm ng572/crypto"' >> ~/.bashrc`

### powershell

`Add-Content $Profile 'function unlock { docker run --privileged -it --rm crypto }'`
