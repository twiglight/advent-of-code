import os
import arrays

fn calc_ribbon(l u16, w u16, h u16) !u16 {
	area := arrays.sum([l, w, h].sorted()[..2].repeat(2))!
	bow := (l * w * h)

	return area + bow
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

	mut total_feet_of_ribbon := 0

	for index, line in input_file.split_into_lines() {
		l, w, h := map_box(line)

		ribbon := calc_ribbon(l, w, h) or {
			panic('Can\'t calc ribbon for line ${index}: ${line}')
		}

		total_feet_of_ribbon = total_feet_of_ribbon + ribbon
	}

	println('Total feet of ribbon necessary for all presents: ${total_feet_of_ribbon}ft')
}
