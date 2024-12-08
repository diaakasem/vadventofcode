#!/usr/bin/env v run
// vim: set ft=v

module chain

pub struct Element[T]{
pub mut:
	value T
	next []&Element[T]
	previous []&Element[T]
}

pub fn (e Element[T]) has_next(value T) bool {
	for i in 0..e.next.len {
		if e.next[i].value == value || e.next[i].has_next(value) {
			return true
		}
	}
	return false
}

pub fn (e Element[T]) has_previous(value T) bool {
	for i in 0..e.previous.len {
		if e.previous[i].value == value || e.previous[i].has_previous(value) {
			return true
		}
	}
	return false
}

pub struct Chain[T]{
pub mut:
	chain []&Element[T]
}

pub fn (mut c Chain[T]) get(element T) &Element[T] {
	for i in 0..c.chain.len {
		if c.chain[i].value == element {
			return c.chain[i]
		}
	}
	e := &Element[T]{value: &element}
	c.chain << e
	return e
}

pub fn (mut c Chain[T]) add_pair(first T, second T) {
	mut first_rule := c.get(first)
	mut second_rule := c.get(second)
	first_rule.next << second_rule
	second_rule.previous << first_rule
}

pub fn (mut c Chain[T]) sort() {
	c.chain.sort_with_compare(fn[T](a &&Element[T], b &&Element[T]) int {
		if b.has_next(a.value) {
			return 1
		}
		if a.has_next(b.value) {
			return -1
		}
		return 0
	})
}

pub fn (mut c Chain[T]) is_sorted(values []T) bool {
	for i in 0..values.len - 1 {
		if !c.get(values[i]).has_next(values[i + 1]) {
			return false
		}
	}
	return true
}

pub fn (c Chain[T]) print() {
	list := c.chain.map(it.value.str()).join(", ")
	println(list)
}
