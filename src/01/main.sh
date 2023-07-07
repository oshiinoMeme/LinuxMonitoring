#!/bin/bash

parameter=$1
if [ $# -gt 1 ]; then
  echo "Too many parameters. Please enter only one."
elif [[ $parameter =~ ^[0-9]+$ ]]; then
  echo "Incorrect parametr. Parametr should be a text"
else
  echo "Parametr: $parameter"
fi
