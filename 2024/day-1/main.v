import os
import regex
import math

fn main() {
	input_file := os.args[1]
	println('Reading file: ${input_file}')
	text := os.read_file(input_file)!
	println('File contents: ${text}')
	mut re := regex.regex_opt(r'\s+')!
	mut first_list := []int{}
	mut second_list := []int{}
	for line in text.split('\n') {
		if line == '' {
			continue
		}
		words := re.split(line)
		first, second := words[0].int(), words[1].int()
		first_list << first
		second_list<< second
	}
	first_list.sort()
	second_list.sort()
	distance := get_distance(first_list, second_list)
	println('Total distance: ${distance}')
	similarity := get_similarity(first_list, second_list)
	println('Total similarity: ${similarity}')
}

fn get_distance(first_list []int, second_list []int) int {
	mut distance := 0
	for i in 0..first_list.len {
		distance += math.abs(first_list[i] - second_list[i])
	}
	return distance
}

fn count_in_list(list []int, value int) int {
	mut count := 0
	for i in list {
		if i == value {
			count += 1
		}
	}
	return count
}


fn get_similarity(first_list []int, second_list []int) int {
	mut similarity := 0
	for i in first_list {
		similarity += count_in_list(second_list, i) * i
	}
	return similarity
}
