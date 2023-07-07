#!/bin/bash
print_conf(){
  if [ "$(read_config "column1_background" 1)" = "1" ]; then
    echo "Column 1 background = default (white)"
  else
    echo "Column 1 background = $column1_background ($(get_color_name $column1_background))"
  fi
  if [ "$(read_config "column1_font_color" 6)" = "6" ]; then
    echo "Column 1 font color = default (black)"
  else
    echo "Column 1 font color = $column1_font_color ($(get_color_name $column1_font_color))"
  fi
  if [ "$(read_config "column2_background" 6)" = "6" ]; then
    echo "Column 2 background = default (black)"
  else
    echo "Column 2 background = $column2_background ($(get_color_name $column2_background))"
  fi
  if [ "$(read_config "column2_font_color" 1)" = "1" ]; then
    echo "Column 2 font color = default (white)"
  else
    echo "Column 2 font color = $column2_font_color ($(get_color_name $column2_font_color))"
  fi
}

