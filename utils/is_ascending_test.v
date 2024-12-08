module utils_test

import utils

pub fn test_is_sorted() {
	data := [1, 2, 3]
	assert utils.is_sorted(data) == true
	data2 := [3, 2, 1]
	assert utils.is_sorted(data2) == true
	data3 := [1, 3, 2]
	assert utils.is_sorted(data3) == false
}

pub fn test_is_ascending() {
	data := [1, 2, 3]
	assert utils.is_ascending(data) == true
	data2 := [2, 1, 3]
	assert utils.is_ascending(data2) == false
	data3 := [3, 2, 1]
	assert utils.is_ascending(data3) == false
}

pub fn test_is_descending() {
	data := [3, 2, 1]
	assert utils.is_descending(data) == true
	data2 := [2, 3, 1]
	assert utils.is_descending(data2) == false
	data3 := [1, 2, 3]
	assert utils.is_descending(data3) == false
}
