#!/usr/bin/env v

import os

const xmas = 'XMAS'

fn main() {
	input_file := os.read_file(os.args[1])!
	matrix := input_file.split('\n').filter(it.len > 0).map(it.bytes())
	mut total := 0
	for y in 0 .. matrix.len {
		for x in 0 .. matrix[y].len {
			if matrix[y][x] != xmas[0] {
				continue
			}
			total += count_matrix_word(xmas, matrix, y, x)
		}
	}
	println(total)
}

fn count_matrix_word(word string, matrix [][]u8, y int, x int) int {
	mut count := 0
	row := matrix[y]
	len := word.len
	delta := word.len - 1
	right, left, up, down := x + delta, x - delta, y - delta, y + delta

	if right < row.len {
		potential_xmas := row[x..x + len].bytestr()
		if potential_xmas == word {
			count += 1
		}
	}
	if left >= 0 {
		potential_xmas := row[left..x + 1].bytestr()
		if potential_xmas.reverse() == word {
			count += 1
		}
	}

	if down < matrix.len {
		mut potential_xmas := []u8{}
		for i in 0 .. len {
			potential_xmas << matrix[y + i][x]
		}
		if potential_xmas.bytestr() == word {
			count += 1
		}
	}
	if up >= 0 {
		mut potential_xmas := []u8{}
		for i in 0 .. len {
			potential_xmas << matrix[y - i][x]
		}
		if potential_xmas.bytestr() == word {
			count += 1
		}
	}
	if down < matrix.len && right < row.len {
		mut potential_xmas := []u8{}
		for i in 0 .. len {
			potential_xmas << matrix[y + i][x + i]
		}
		if potential_xmas.bytestr() == word {
			count += 1
		}
	}
	if up >= 0 && left >= 0 {
		mut potential_xmas := []u8{}
		for i in 0 .. len {
			potential_xmas << matrix[y - i][x - i]
		}
		if potential_xmas.bytestr() == 'XMAS' {
			count += 1
		}
	}
	if down < matrix.len && left >= 0 {
		mut potential_xmas := []u8{}
		for i in 0 .. 4 {
			potential_xmas << matrix[y + i][x - i]
		}
		if potential_xmas.bytestr() == word {
			count += 1
		}
	}
	if up >= 0 && right < row.len {
		mut potential_xmas := []u8{}
		for i in 0 .. len {
			potential_xmas << matrix[y - i][x + i]
		}
		if potential_xmas.bytestr() == word {
			count += 1
		}
	}
	return count
}
