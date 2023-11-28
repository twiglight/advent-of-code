import os
import arrays

struct Command {
	action Type
	start Point
	end Point
}

fn (s Command) act_on (light u16) u16 {
	match s.action {
		.on {return light + 1}
		.off {
			if light > 0 {
				return light - 1
			} else {
				return 0
			}
		}
		.toggle {return light + 2}
	}
}

enum Type as u8 {
	on
	off
	toggle
}

struct Point {
	x u16
	y u16
}

fn create_point(coords string) Point {
	c := coords.split(',')

	return Point{c[0].u16(), c[1].u16()}
}

fn parse_line(line string) Command {
	words := line.split(' ')

	if words[..2].join(' ') == 'turn on' {
		return Command{
			Type.on,
			create_point(words[2]),
			create_point(words[4])
		}
	} else if words[..2].join(' ') == 'turn off' {
		return Command{
			Type.off,
			create_point(words[2]),
			create_point(words[4])
		}
	} else {
		return Command{
			Type.toggle,
			create_point(words[1]),
			create_point(words[3])
		}
	}
}

fn main() {
	input_file := os.read_lines('input') or {
		panic('Can\'t read input file')
	}

	mut lights := [][]u16{len: 1000, cap: 1000, init: []u16{len: 1000, cap: 1000}}

	for line in input_file {
		cmd := parse_line(line)

		for x := cmd.start.x; x <= cmd.end.x; x += 1 {
			for y := cmd.start.y; y <= cmd.end.y; y += 1 {
				lights[x][y] = cmd.act_on(lights[x][y])
			}
		}

	}

	result := arrays.fold(lights, 0, fn (accX int, elemX []u16) int {
		return accX + arrays.fold(elemX, 0, fn (accY int, elemY u16) int {
			return accY + elemY
		})
	})

	println('${result} total brightness')
}
