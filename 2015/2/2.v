import os
import math
import arrays

fn calc_ribbon(l u16, w u16, h u16) !u16 {
	mut sizes := [l, w, h]
	sizes.delete(arrays.idx_max(sizes)!)

	return (arrays.sum(sizes)! * 2) + (l * w * h)
}

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
	mut total_feet_of_ribbon := 0

	for index, line in input_file.split_into_lines() {
		l, w, h := map_box(line)
		la, wa, ha := calc_area(l, w), calc_area(w, h), calc_area(h, l)

		smallest_side := math.min(la, math.min(wa, ha))
		ribbon := calc_ribbon(l, w, h) or {
			panic('Can\'t calc ribbon for line ${index}: ${line}')
		}

		println('line ${index}: l = ${l}, w = ${w}, h = ${h}, smallest = ${smallest_side}, ribbon = ${ribbon}')

		total_feet_of_wrapping = total_feet_of_wrapping + (2 * la) + (2 * wa) + (2 * ha) + smallest_side
		total_feet_of_ribbon = total_feet_of_ribbon + ribbon
	}

	println('Total feet of wrapping necessary for all presents: ${total_feet_of_wrapping}ft')
	println('Total feet of ribbon necessary for all presents: ${total_feet_of_ribbon}ft')
}
