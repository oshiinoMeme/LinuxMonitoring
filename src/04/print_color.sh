#!/bin/bash

get_color_name() {
  local color_code="$1"
  local color_name=""
  case $1 in
    1) echo "white" ;;
    2) echo "red" ;;
    3) echo "green" ;;
    4) echo "blue" ;;
    5) echo "purple" ;;
    6) echo "black" ;;
    *) color_name="default" ;;
  esac
  echo "$color_name"
}

print_color() {
  local value="$1"
  local bg_color="$2"
  local font_color="$3"

  local bg_colors=(default 107 101 102 104 105 40)
  local font_colors=(default 97 91 92 94 95 30)
  local reset_color='\033[0m'

  local bg_color_name=$(get_color_name $bg_color)
  local font_color_name=$(get_color_name $font_color)
  echo -e "\033[${bg_colors[$bg_color]};${font_colors[$font_color]}m${value}${reset_color}"
}

print_info() {
  echo -e "$(print_color 'HOSTNAME =' $column1_background $column1_font_color) $(print_color $(hostname) $column2_background $column2_font_color)"
  echo -e "$(print_color 'TIMEZONE =' $column1_background $column1_font_color) $(print_color "$(timedatectl show --property=Timezone --value)" $column2_background $column2_font_color)"
  echo -e "$(print_color 'USER =' $column1_background $column1_font_color) $(print_color $(whoami) $column2_background $column2_font_color)"
  echo -e "$(print_color 'OS =' $column1_background $column1_font_color) $(print_color "$(lsb_release -ds)" $column2_background $column2_font_color)"
  echo -e "$(print_color 'DATE =' $column1_background $column1_font_color) $(print_color "$(date +"%d %b %Y %T")" $column2_background $column2_font_color)"
  echo -e "$(print_color 'UPTIME =' $column1_background $column1_font_color) $(print_color "$(uptime -p)" $column2_background $column2_font_color)"
  echo -e "$(print_color 'IP =' $column1_background $column1_font_color) $(print_color "$(ifconfig | awk '/inet /{print $2}' | head -n 1)" $column2_background $column2_font_color)"
  echo -e "$(print_color 'MASK =' $column1_background $column1_font_color) $(print_color "$(ifconfig | grep -m1 netmask |awk '{ print $4 }')" $column2_background $column2_font_color)"
  echo -e "$(print_color 'GATEWAY =' $column1_background $column1_font_color) $(print_color "$(ip route | awk '/default/ {print $3}')" $column2_background $column2_font_color)"
  echo -e "$(print_color 'RAM_TOTAL =' $column1_background $column1_font_color) $(print_color "$(free -h --si | awk '/^Mem:/ {print $2}')" $column2_background $column2_font_color)"
  echo -e "$(print_color 'RAM_USED =' $column1_background $column1_font_color) $(print_color "$(free -h --si | awk '/^Mem:/ {print $3}')" $column2_background $column2_font_color)"
  echo -e "$(print_color 'RAM_FREE =' $column1_background $column1_font_color) $(print_color "$(free -h --si | awk '/^Mem:/ {print $4}')" $column2_background $column2_font_color)"
  echo -e "$(print_color 'SPACE_ROOT =' $column1_background $column1_font_color) $(print_color "$(df -h --output=avail / | awk 'NR==2')" $column2_background $column2_font_color)"
  echo -e "$(print_color 'SPACE_ROOT_USED =' $column1_background $column1_font_color) $(print_color "$(df -h --output=used / | awk 'NR==2')" $column2_background $column2_font_color)"
  echo -e "$(print_color 'SPACE_ROOT_FREE =' $column1_background $column1_font_color) $(print_color "$(df -h --output=avail / | awk 'NR==2')" $column2_background $column2_font_color)"
}

