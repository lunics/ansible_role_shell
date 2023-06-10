#!/bin/env bash

arg1=$(echo $1 | sed 's/,/./')

result=$(echo "$arg1 - 3.794" | bc)

echo "$result ml"

