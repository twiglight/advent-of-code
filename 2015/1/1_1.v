import os

fn main() {
	input_file := os.read_file('input') or {
		println('Error: no input file found')
		return
	}

	mut floor := 0
	for elem in input_file.runes() {
		if elem == `(` {
			floor = floor + 1
		} else if elem == `)` {
			floor = floor - 1
		}
	}

	// Part one
	println('Santa arrives at floor: ${floor}')
}
