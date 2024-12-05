
import os

fn main() {
	input_file := os.read_file(os.args[1])!
	println(input_file)
}
    