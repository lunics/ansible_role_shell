#!/bin/env bash

# still=$(echo $esperance*365-$age*365 | bc)                # calcul le nombre de jours restant
# # still_percent=$(echo ${still%.*}*100/$esperance*365 | bc)     # calcul le % restant   ## KO
# echo ${still%.*}    # arrondi pour afficher un nombre de jour entier
# # echo $still_percent %

birthday="1991-09-10"
birthday_timestamp=$(date -d "${birthday}" +%s)     # converti la date en timestamp (valeur en secondes depuis 1970)

esperance_2022=72,9                                 # espérance de vie moyenne d'un homme né en 1991 en IDF
# KO
# esperance_months=$(echo "${esperance_2022}*12" | bc)
# esperance_months=$(printf '%.0f\n' $esperance_months)
esperance_timestamp=$(date -d "2064-07-10" +%s)     # date anniversaire + espérance de vie puis converti en timestamp

today_timestamp=$(date +%s)

still_seconds=$(echo "${esperance_timestamp}-${today_timestamp}" | bc)

still_days=$(echo "${still_seconds}/3600/24" | bc)

echo $still_days
