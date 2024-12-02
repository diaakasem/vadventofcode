import os
import math
import strconv

fn main() {
	file := os.read_file(os.args[1])!
	mut safe_count := 0
	for line in file.split("\n") {
		if line.len == 0 {
			continue
		}
		data := line.split(" ").map(strconv.atoi(it) or { exit(1) })
		if is_safe(data) {
			safe_count += 1
		} else {
			for i := 0; i < data.len; i++ {
				mut test_data := data.clone()
				test_data.delete(i)
				if is_safe(test_data) {
					safe_count += 1
					break
				}
			}
		}
	}
	println("Safe count: $safe_count")
}

fn is_safe(data []int) bool {
	mut last_input := data[0]
	mut direction := if data[1] > last_input { 1 } else { -1 }
	for i := 1; i < data.len; i++ {
		new_direction := if data[i] > last_input { 1 } else { -1 }
		if new_direction != direction {
			return false
		}
		if math.abs(data[i] - last_input) < 1 || math.abs(data[i] - last_input) > 3 {
			return false
		}
		last_input = data[i]
	}
	return true
}
