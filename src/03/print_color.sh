#!/bin/bash
print_color() {
  local value="$1"
  local bg_color="$2"
  local font_color="$3"

  local bg_colors=(default 107 101 102 104 105 40)
  local font_colors=(default 97 91 92 94 95 30)
  local reset_color='\033[0m'

  echo -e "\033[${bg_colors[$bg_color]};${font_colors[$font_color]}m${value}${reset_color}"
}

function print_info {
  echo -e "$(print_color 'HOSTNAME =' $1 $2) $(print_color $(hostname) $3 $4)"
  echo -e "$(print_color 'TIMEZONE =' $1 $2) $(print_color "$(timedatectl show --property=Timezone --value)" $3 $4)"
  echo -e "$(print_color 'USER =' $1 $2) $(print_color $(whoami) $3 $4)"
  echo -e "$(print_color 'OS =' $1 $2) $(print_color "$(lsb_release -ds)" $3 $4)"
  echo -e "$(print_color 'DATE =' $1 $2) $(print_color "$(date +"%d %b %Y %T")" $3 $4)"
  echo -e "$(print_color 'UPTIME =' $1 $2) $(print_color "$(uptime -p)" $3 $4)"
  echo -e "$(print_color 'IP =' $1 $2) $(print_color "$(ifconfig | awk '/inet /{print $2}' | head -n 1)" $3 $4)"
  echo -e "$(print_color 'MASK =' $1 $2) $(print_color "$(ifconfig | grep -m1 netmask |awk '{ print $4 }')" $3 $4)"
  echo -e "$(print_color 'GATEWAY =' $1 $2) $(print_color "$(ip route | awk '/default/ {print $3}')" $3 $4)"
  echo -e "$(print_color 'RAM_TOTAL =' $1 $2) $(print_color "$(free -h --si | awk '/^Mem:/ {print $2}')" $3 $4)"
  echo -e "$(print_color 'RAM_USED =' $1 $2) $(print_color "$(free -h --si | awk '/^Mem:/ {print $3}')" $3 $4)"
  echo -e "$(print_color 'RAM_FREE =' $1 $2) $(print_color "$(free -h --si | awk '/^Mem:/ {print $4}')" $3 $4)"
  echo -e "$(print_color 'SPACE_ROOT =' $1 $2) $(print_color "$(df -h --output=avail / | awk 'NR==2')" $3 $4)"
  echo -e "$(print_color 'SPACE_ROOT_USED =' $1 $2) $(print_color "$(df -h --output=used / | awk 'NR==2')" $3 $4)"
  echo -e "$(print_color 'SPACE_ROOT_FREE =' $1 $2) $(print_color "$(df -h --output=avail / | awk 'NR==2')" $3 $4)"
}
