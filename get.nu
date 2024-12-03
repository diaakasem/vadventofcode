#!/usr/bin/env nu

# Create a new Advent of Code day
# Example: get.nu 2024 3
def main [
    year: int   # The year of the Advent of Code
    day: int    # The day of the Advent of Code
] {
    if (year < 2015) {
        print "Year must be 2015 or later"
        return
    }
    if (day < 1) {
        print "Day must be 1 or later"
        return
    }
    if (day > 25) {
        print "Day must be 25 or earlier"
        return
    }
    if (year > 2024) {
        print "Year must be 2024 or earlier"
        return
    }
    let exists = ( $"($year)/day-($day)" | path exists )
    if ($exists) {
        print "Day already exists"
        nvim $"($year)/day-($day)/main.v"
        return
    }
    ^mkdir -p $"($year)/day-($day)"
    http get https://adventofcode.com/2024/day/3 | html2md -i | save $"($year)/day-($day)/input.md"
    touch $"($year)/day-($day)/input.txt"
    touch $"($year)/day-($day)/sample_input.txt"
    "
import os

fn main() {
	input_file := os.read_file(os.args[1])!
	println(input_file)
}
    " | save $"($year)/day-($day)/main.v"
    nvim $"($year)/day-($day)/main.v"
}