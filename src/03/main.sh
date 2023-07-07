#!/bin/bash

source ./print_color.sh

par='^[1-6]{1}?$'

if [ "$#" -ne 4 ]; then
  echo "ERROR: should be exactly 4 par: par 1, par 2, par 3, par 4."
elif !([[ $1 =~ $par ]] && [[ $2 =~ $par ]] && [[ $3 =~ $par ]] && [[ "$4" =~ $par ]]); then
  echo "ERROR: every par should be a number from 1 to 6."
elif [[ "$1" -eq "$2" ]]; then
  echo "ERROR: par '1' and '2' must be different. Try again."
elif [[ "$3" -eq "$4" ]]; then
  echo "ERROR: par '3' and '4' must be different. Try again."
else
  print_info $1 $2 $3 $4
fi

