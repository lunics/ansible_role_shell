#!/bin/sh

# rsync --remove-source-files ne supprime que les fichiers source et laisse les dossiers source vides
rsync -avzh --progress $1 $2

## IF $1 is a directory AND $? == 0 THEN
if [ $? -eq 0 ]; then
  /usr/bin/rm -Irv $1

  dir_name=$(dirname $1)

  l $dir_name
fi
