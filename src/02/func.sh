#!/bin/bash
function print_info {
  echo "HOSTNAME=$(hostname)"
  echo "TIMEZONE=$(timedatectl show --property=Timezone --value)"
  echo "USER=$(whoami)"
  echo "OS=$(lsb_release -ds)"
  echo "DATE=$(date +"%d %b %Y %T")"
  echo "UPTIME=$(uptime -p)"
  echo "UPTIME_SEC=$(awk '{print $1}' /proc/uptime)"
  echo "IP=$(ifconfig | awk '/inet /{print $2}' | head -n 1)"
  echo "MASK=$(ifconfig | grep -m1 netmask |awk '{ print $4 }')"
  echo "GATEWAY=$(ip route | awk '/default/ {print $3}')"
  echo "RAM_TOTAL=$(free -h --si | awk '/^Mem:/ {print $2}')"
  echo "RAM_USED=$(free -h --si | awk '/^Mem:/ {print $3}')"
  echo "RAM_FREE=$(free -h --si | awk '/^Mem:/ {print $4}')"
  echo "SPACE_ROOT=$(df -h --output=avail / | awk 'NR==2')"
  echo "SPACE_ROOT_USED=$(df -h --output=used / | awk 'NR==2')"
  echo "SPACE_ROOT_FREE=$(df -h --output=avail / | awk 'NR==2')"
}

function save_info {
  print_info > $(date +%d_%m_%y_%H_%M_%S).status
}
