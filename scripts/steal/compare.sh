#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 palette1 palette2"
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

print_color() {
  local hex_color=$1
  local r=$((16#${hex_color:0:2}))
  local g=$((16#${hex_color:2:2}))
  local b=$((16#${hex_color:4:2}))
  echo -ne "\033[48;2;${r};${g};${b}m \033[0m"
}

while read -r color1 && read -r color2 <&2; do
    print_color "$color1"
    print_color "$color2"
    echo " $((++count))" # Print the loop count next to the colors
done <"$1" 2<"$2"
