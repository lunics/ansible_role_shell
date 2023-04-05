#! /usr/bin/env python

import os, time

while True:
  temp_handler = open("/sys/class/thermal/thermal_zone0/temp","r")
  print("%s °C" % (int(temp_handler.read()) / 1000))
  time.sleep(2)
