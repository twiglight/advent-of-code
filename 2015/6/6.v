import os
import arrays

struct Command {
	action Type
	start Point
	end Point	
}

fn (s Command) act_on (light bool) bool {
	match s.action {
		.on {return true}
		.off {return false}
		.toggle {return !light}
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
	mut input_file := os.read_lines('input') or {
		panic('Can\'t read input file')
	}

	//input_file = ['turn off 301,3 through 808,453','turn on 351,678 through 951,908','toggle 720,196 through 897,994']

	mut lights := [][]bool{len: 999, cap: 999, init: []bool{len:999, cap:999}} 

	for line in input_file {
		cmd := parse_line(line)

		for x := cmd.start.x; x < cmd.end.x; x += 1 {
			for y := cmd.start.y; y < cmd.end.y; y += 1 {
				lights[x][y] = cmd.act_on(lights[x][y])	
			}
		}
	}	

	result := arrays.fold(lights, 0, fn (accX int, elemX []bool) int {
		return accX + arrays.fold(elemX, 0, fn (accY int, elemY bool) int {
			if elemY {
				return accY + 1
			}
			return accY
		})  
	})

	println('${result} lights are turned on')
}
