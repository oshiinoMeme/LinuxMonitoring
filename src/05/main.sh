#!/bin/bash

source ./func.sh

if [ -z "$1" ]; then
  echo "Directory path is missing."
  echo "Usage: ./main.sh <directory_path>"
  exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
  echo "Directory '$directory' does not exist."
  exit 1
fi

start_time=$(date +%s.%N)
total_folders=$(find "$directory" -type d | wc -l)
echo "Total number of folders (including all nested ones) = $total_folders"
echo
print_top_folders 5 $directory
total_files=$(find "$directory" -type f  | wc -l)
echo
echo "Total number of files = $total_files"
echo
echo "Number of:"
total_folders=$(find "$directory" -type d | wc -l)
total_files=$(find "$directory" -type f | wc -l)

print_type "Configuration" "conf"
print_type "Text" "txt"
print_type "Executable" "exe"
print_type "Log" "log"
print_type "Archive" "zip"
print_type "Symbolic links" "symlink"
echo
print_top_10_files
echo
print_top_10_executable
echo
print_time
