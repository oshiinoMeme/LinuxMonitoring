#!/bin/bash

print_top_folders() {
  local n=$1
  local directory=$2
  echo "TOP $n folders of maximum size arranged in descending order (path and size):"
  local folders=$(du -hs "$directory"* 2>/dev/null | sort -hr | head -n "$n")
  if [ -z "$folders" ]; then
    echo "No folders in the directory."
  else
    echo "$folders" | awk '{size=$1; path=$2; if (size ~ /G$/) {size=size "B"} else if (size ~ /M$/) {size=size "B"} else if (size ~ /K$/) {size=size "B"}; print NR, "-", path, size}'
  fi
}

print_type() {
  local file_type=$1
  local extension=$2
  count=$(find "$directory" -type f -name "*.$extension" | wc -l)
  echo "$file_type files (with the extension .$extension) = $count"
}

print_top_10_files() {
  local files=$(find "$directory" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10)
  echo "TOP 10 files of maximum size arranged in descending order (path, size, and type):"
  if [ -z "$files" ]; then
    echo "No files in the directory."
  else
    local counter=1
    while IFS= read -r line; do
      file=$(echo "$line" | awk '{print $2}')
      size=$(echo "$line" | awk '{size=$1; if (size ~ /G$/) {size=size "B"} else if (size ~ /M$/) {size=size "B"} else if (size ~ /K$/) {size=size "B"}; print size}')
      file_type=$(file -b --mime-type "$file" | sed 's|/.*||')
      echo "$counter - $file, $size, $file_type"
      ((counter++))
    done <<< "$files"
  fi
}

print_top_10_executable() {
  local executable_files=$(find "$directory" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -n 10)
  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size, and MD5 hash of file):"
  if [ -z "$executable_files" ]; then
    echo "No executable files found in the directory."
  else  
    local counter=1
    while IFS= read -r line; do
      file=$(echo "$line" | awk '{print $2}')
      size=$(echo "$line" | awk '{size=$1; if (size ~ /G$/) {size=size "B"} else if (size ~ /M$/) {size=size "B"} else if (size ~ /K$/) {size=size "B"}; print size}')
      md5_hash=$(md5sum "$file" | awk '{print $1}')
      echo "$counter - $file, $size, $md5_hash"
      ((counter++))
    done <<< "$executable_files"
  fi
}

print_time() {
  end_time=$(date +%s.%N)
  execution_time=$(echo "$end_time - $start_time" | bc)
  format=$(printf "%.9f" "$execution_time")
  echo "Script execution time (in seconds) = $format"
}
