module utils

// is_sorted checks if an array of integers is consistently sorted in either ascending or descending order.
// It returns true if the array maintains a consistent sorting direction, false otherwise.
// Example: [1, 2, 3] or [3, 2, 1] returns true, but [1, 3, 2] returns false
pub fn is_sorted(data []int) bool {
	mut last_input := data[0]
	direction := if data[1] > last_input { 1 } else { -1 }
	for i := 1; i < data.len; i++ {
		new_direction := if data[i] > last_input { 1 } else { -1 }
		if new_direction != direction {
			return false
		}
		last_input = data[i]
	}
	return true
}

// is_ascending checks if an array of integers is sorted in ascending order.
// It returns true if each element is greater than or equal to the previous element.
// Example: [1, 2, 3] returns true, but [2, 1, 3] returns false
pub fn is_ascending(data []int) bool {
	for i := 1; i < data.len; i++ {
		if data[i] < data[i - 1] {
			return false
		}
	}
	return true
}

// is_descending checks if an array of integers is sorted in descending order.
// It returns true if each element is less than or equal to the previous element.
// Example: [3, 2, 1] returns true, but [2, 3, 1] returns false
pub fn is_descending(data []int) bool {
	for i := 1; i < data.len; i++ {
		if data[i] > data[i - 1] {
			return false
		}
	}
	return true
}
