#!/bin/bash

parameter=$1
if [ $# -ne 1 ]; then
  echo "Incorrect input. Should be exactly one parameter."
elif [[ $parameter =~ ^[0-9]+$ ]]; then
  echo "Incorrect input. Parameter should be a text"
else
  echo "Parameter: $parameter"
fi

