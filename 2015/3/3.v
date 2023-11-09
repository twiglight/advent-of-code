import os
import arrays

struct Point {
mut:
	x int
	y int
}

fn main() {
	input_file := os.read_file('input') or {
		panic('Could\'t read input file')
	}

	mut santa := Point{0,0}
	mut robot := Point{0,0}

	mut coords := [santa]

	for index, letter in input_file {
		mut x := 0
		mut y := 0

		match letter {
			`^` { y = y + 1 }
			`>` { x = x + 1 }
			`v` { y = y - 1 }
			`<` { x = x - 1 }
			else {}
		}

		if index % 2 == 0 {
			santa.x = santa.x + x
			santa.y = santa.y + y

			coords << santa
		} else {
			robot.x = robot.x + x
			robot.y = robot.y + y

			coords << robot
		}

	}

	grouped_coords := arrays.group_by[string, Point](coords, fn (coord Point) string { return '${coord.x},${coord.y}' } )

	println('There are ${grouped_coords.len} houses getting at least one present')
}
