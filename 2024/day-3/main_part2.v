import os
import regex

fn main() {
	input := os.read_file(os.args[1])!
	mut re := regex.regex_opt(r"mul\(\d+,\d+\)")!

	mut useless := regex.regex_opt(r"don't\(\).*do\(\)")!
	mut input_file := useless.replace(input, "")

	useless = regex.regex_opt(r"don't\(\).*$")!
	input_file = useless.replace(input_file, "")

	mut sum := 0
	for m in re.find_all_str(input_file) {
		res := m[4..].split(",")
		sum += res[0].int() * res[1].int()
	}

	println(sum)
}
