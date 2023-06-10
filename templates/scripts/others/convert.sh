#!/bin/env bash

base_name=${1%.*}             # get base file name of $1
ext_src=${1#$base_name.}      # get extension of $1
ext_dest=$2

if [ "$ext_src" = "pdf" ] && [ "$ext_dest" = "jpg" ]; then
  # original: pdftoppm -jpeg retour_amazon_debuyer_2.pdf retour_amazon_debuyer    # convert pdf to jpg
  # sans son extension .jpg cat pdftoppm l'ajoutera automatiquement" retour_amazon_debuyer
  pdftoppm -jpeg $1 $base_name && l
fi
