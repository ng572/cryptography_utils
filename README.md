# cryptography_utils
snippets for some simple cryptography

```
!pip install pycryptodome
```

```python
import json
from base64 import b64encode
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad
#from Crypto.Protocol.KDF import scrypt
from hashlib import scrypt

data = b''
password = b''
iv = b''

#key = scrypt(password, b'', 32, N=2**14, r=8, p=1) #standard key length for CppCrypt is 256 / 8 = 32
key = scrypt(password=password, dklen=32, salt=b'' ,n=2**14, r=8, p=1) # use this line if Crypto.KDF does not come with scrypt

cipher = AES.new(key, AES.MODE_CBC, iv = iv)
#iv (bytes) – the Initialization Vector. A piece of data unpredictable to adversaries. It is as long as the block size (e.g. 16 bytes for AES). If not present, the library creates a random IV value.
#b64encode is used by CBC by default
ct_bytes = cipher.encrypt(pad(data, AES.block_size))
iv = b64encode(cipher.iv).decode('utf-8')
ct = b64encode(ct_bytes).decode('utf-8')
result = json.dumps({'iv':iv, 'ciphertext':ct})
print(result)
```

`mkdir -p ./mytmpfs && sudo mount -t tmpfs -o size=10M tmpfs ./mytmpfs && openssl bf -d -a -in crypto_squared -out ./mytmpfs/code && python3 ./mytmpfs/code && sudo umount ./mytmpfs && rm -r ./mytmpfs`
