module main_part1

import os
import utils.chain

fn main() {
	input_file := os.read_file(os.args[1])!
	mut c := chain.Chain[int]{}
	for line in input_file.split("\n") {
		if line.contains("|") {
			c.add_pair(line.split("|")[0].parse[int](), line.split("|")[1].parse[int]())
		}
	}
	c.sort()
	for line in input_file.split("\n") {
		if line.contains(",") {
			arr := line.split(",").map(it.parse_int(10, 32)!)
			println(arr)
		}
	}


	// mut c := chain.Chain[int]{}
}

