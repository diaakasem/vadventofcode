#!/usr/bin/env v

import os

const letter = 'A'

fn main() {
	input_file := os.read_file(os.args[1])!
	matrix := input_file.split('\n').filter(it.len > 0).map(it.bytes())
	mut total := 0
	for y in 1 .. matrix.len - 1 {
		for x in 1 .. matrix[y].len -1 {
			if matrix[y][x] != letter[0] {
				continue
			}
			total += count_cross_mass(matrix, y, x)
		}
	}
	println(total)
}

fn count_cross_mass(matrix [][]u8, y int, x int) int {
	tl := matrix[y-1][x-1]
	tr := matrix[y-1][x+1]
	bl := matrix[y+1][x-1]
	br := matrix[y+1][x+1]
	m := 'M'[0]
	s := 'S'[0]
	if ((tl == m && br == s) || (tl == s && br == m))
	&& ((tr == m && bl == s) || (tr == s && bl == m)) {
		return 1
	}
	return 0
}
