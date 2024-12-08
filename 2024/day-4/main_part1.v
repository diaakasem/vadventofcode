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

	// Check horizontal
	if right < row.len && row[x..x + len].bytestr() == word {
		count++
	}
	if left >= 0 && row[left..x + 1].bytestr().reverse() == word {
		count++
	}

	// Check all directions using a helper closure
	check_direction := fn [word, matrix, x, y, len] (dx int, dy int) bool {
		mut chars := []u8{}
		for i in 0 .. len {
			new_y := y + (dy * i)
			new_x := x + (dx * i)
			if new_y < 0 || new_y >= matrix.len || new_x < 0 || new_x >= matrix[0].len {
				return false
			}
			chars << matrix[new_y][new_x]
		}
		return chars.bytestr() == word
	}

	// Vertical
	if check_direction(0, 1) { count++ }
	if check_direction(0, -1) { count++ }
	// Diagonal
	if check_direction(1, 1) { count++ }
	if check_direction(-1, -1) { count++ }
	if check_direction(-1, 1) { count++ }
	if check_direction(1, -1) { count++ }

	return count
}
