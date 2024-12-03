import os
import regex

fn main() {
	input_file := os.read_file(os.args[1])!
	mut re := regex.regex_opt(r"mul\(\d+,\d+\)")!

	mut sum := 0
	for m in re.find_all_str(input_file) {
		res := m[4..].split(",")
		mul := res[0].int() * res[1].int()
		sum += mul
	}
	println(sum)
}
