#!/usr/bin/env v run
// vim: set ft=v:

module chain_test

import chain

fn build_chain() chain.Chain[int] {

	vals := [
		[47, 53],
		[97, 13],
		[97, 61],
		[97, 47],
		[75, 29],
		[61, 13],
		[75, 53],
		[29, 13],
		[97, 29],
		[53, 29],
		[61, 53],
		[97, 53],
		[61, 29],
		[47, 13],
		[75, 47],
		[97, 75],
		[47, 61],
		[75, 61],
		[47, 29],
		[75, 13],
		[53, 13]
	]

	mut c := chain.Chain[int]{}
	length := vals.len
	for i in 0..length {
		c.add_pair(vals[i][0], vals[i][1])
	}

	c.sort()
	return c
}

pub fn test_chain() {
	c := build_chain()
	assert c.chain[0].value == 97
}

pub fn test_is_sorted() {
	mut c := build_chain()
	data := [47, 29, 13]
	assert c.is_sorted(data) == true
	data2 := [97, 61, 13]
	assert c.is_sorted(data2) == true
	data3 := [61, 29, 97]
	assert c.is_sorted(data3) == false
}


