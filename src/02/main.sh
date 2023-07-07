#!/bin/bash
source ./func.sh

print_info

read -p "Do you want to record data in file? (Y/N): " answer
if [[ $answer =~ ^[Yy]$ ]]; then

  save_info

  echo "Info saved!"
fi

