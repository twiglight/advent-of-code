import os
import math

fn calc_area(x u16, y u16) u16 {
	return x * y
}

fn map_box(input string) (u16, u16, u16) {
	sizes := input.split('x')

	return sizes[0].u16(), sizes[1].u16(), sizes[2].u16()
}

fn main() {
	input_file := os.read_file('input') or {
		println('Error reading input file')
		return
	}

	mut total_feet_of_wrapping := 0

	for line in input_file.split_into_lines() {
		l, w, h := map_box(line)
		la, wa, ha := calc_area(l, w), calc_area(w, h), calc_area(h, l)

		smallest_side := math.min(la, math.min(wa, ha))

		total_feet_of_wrapping = total_feet_of_wrapping + (2 * la) + (2 * wa) + (2 * ha) + smallest_side
	}

	println('Total feet of wrapping necessary for all presents: ${total_feet_of_wrapping}ft')
}
