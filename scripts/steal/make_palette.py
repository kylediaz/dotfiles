"""
Given a source color palette and a set of colors wanted in the output color
palette, create the best mapping between the two palettes.
"""

import sys
from typing import List

def color_distance(hex1: str, hex2: str) -> float:
    r1, g1, b1 = int(hex1[0:2], 16), int(hex1[2:4], 16), int(hex1[4:6], 16)
    r2, g2, b2 = int(hex2[0:2], 16), int(hex2[2:4], 16), int(hex2[4:6], 16)
    return ((r2 - r1) ** 2 + (g2 - g1) ** 2 + (b2 - b1) ** 2) ** 0.5

def find_best_match(source_color: str, destination_colors: List[str]) -> str:
    best_match = destination_colors[0]
    best_distance = float('inf')
    for destination_color in destination_colors:
        distance = color_distance(source_color, destination_color)
        if distance < best_distance:
            best_match = destination_color
            best_distance = distance
    return best_match

def main():
    if len(sys.argv) != 3:
        print("Usage: python make_palette.py <source_palette_file> <output_palette_file>")
        sys.exit(1)

    source_palette_file = sys.argv[1]
    output_palette_file = sys.argv[2]

    # Read source palette from file
    with open(source_palette_file, 'r') as f:
        source_palette = f.read().splitlines()

    with open(output_palette_file, 'r') as f:
        output_palette = f.read().splitlines()

    for source_color in source_palette:
        best_match = find_best_match(source_color, output_palette)
        print(best_match)

if __name__ == "__main__":
    main()
