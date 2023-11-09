import os

// https://adventofcode.com/2015/day/1
fn main() {
	input_file := os.read_file('input') or {
		println('Error: no input file found')
		return
	}

	mut floor := 0
	mut reached_basement := false
	for index, elem in input_file.runes() {
		if elem == `(` {
			floor = floor + 1
		} else if elem == `)` {
			floor = floor - 1
		}

		// Part two
		if !reached_basement && floor < 0 {
			reached_basement = true

			println('Santa first entered the basement at position: ${index + 1}')
		}
	}

	// Part one
	println('Santa arrives at floor: ${floor}')
}
