#!/bin/bash

source ./print_color.sh
source ./print_conf.sh
config_file="config.conf"

if [ ! -f "$config_file" ]; then
  echo "ERROR: '$config_file' doesen't exist."
  exit 1
fi

read_config() {
  local par="$1"
  local default_value="$2"
  local config_value=$(grep "^$par=" "$config_file" | cut -d'=' -f2)
  if [ -z "$config_value" ]; then
    echo "$default_value"
  else
    echo "$config_value"
  fi
}

column1_background=$(read_config "column1_background" 1)
column1_font_color=$(read_config "column1_font_color" 6)
column2_background=$(read_config "column2_background" 6)
column2_font_color=$(read_config "column2_font_color" 1)

if ! [[ $column1_background =~ ^[1-6]$ ]] || ! [[ $column1_font_color =~ ^[1-6]$ ]] || ! [[ $column2_background =~ ^[1-6]$ ]] || ! [[ $column2_font_color =~ ^[1-6]$ ]]; then
  echo "ERROR: every par in '$config_file' should be a number from 1 to 6."
  exit 1
fi

if [[ "$column1_background" -eq "$column1_font_color" ]]; then
  echo "ERROR: column1_background and column2_font_color must be different. Try again."
  exit 1
fi

if [[ "$column2_font_color" -eq "$column2_background" ]]; then
  echo "ERROR: column2_font_color and column2_background must be different. Try again."
  exit 1
fi

print_info
echo
print_conf
