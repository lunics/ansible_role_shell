#! /usr/bin/env python

import subprocess

for ping in range(1,255):

  address = "192.168.1.0" + str(ping)
  res = subprocess.call(['ping', '-c', '1', address])

  if res == 0:
    print( "ping to", address, "OK")
  elif res == 2:
    print("no response from", address)
  else:
    print("ping to", address, "failed!")
