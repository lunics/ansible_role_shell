#!/bin/sh

## Ne pas répéter le: sudo iwlist wlp2s0 scan
## Ajouter un ncurse pour choisir entre les wifi dispo
if [ $# -eq 0 ]; then
  #old: sudo iwlist wlp2s0 scan > /dev/null     # réveille la carte, peut-être inutile
  watch -d -n 1 nmcli dev wifi
  printf "\nExemple: connectWifi <SSID>\n\n"
elif [ "$1" = "--no-pass" ];then
  [ ! $(sudo iwlist wlp2s0 scan | grep $2) = "" ] && nmcli dev wifi connect $2
elif [ ! $(sudo iwlist wlp2s0 scan | grep $1) = "" ]; then
  stty -echo
  printf "Password: "
  read wifiPsswd
  stty echo
  printf "\n"
  nmcli dev wifi connect $1 password $wifiPsswd
fi
