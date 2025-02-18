#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 file_name old_colors new_colors"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: $1 is not a file"
  exit 1
fi

if [ ! -f "$2" ]; then
  echo "Error: $2 is not a file"
  exit 1
fi

if [ ! -f "$3" ]; then
  echo "Error: $3 is not a file"
  exit 1
fi

while read -r search_line && read -r replace_line <&3; do
  sed -i='' "s/$search_line/$replace_line/g" "$1"
done < "$2" 3< "$3"
