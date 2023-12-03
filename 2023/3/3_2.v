import os
import regex
import arrays

struct Gear {
	value int
	x int
	y int
}

fn find_gear(lines []string, index int, start int, end int) ?Gear {
	for y := index-1; y <= index+1; y+=1 {
		if y < 0 { continue }
		if y >= lines.len { break }

		x1 := if start - 1 < 0 {start} else {start - 1}
		x2 := if end + 1 > lines[index].len {end} else {end + 1}

		if i := lines[y][x1..x2].index('*') {
			return Gear{lines[index][start..end].int(), i + x1, y}
		}

	return none
}

fn main() {
	input := os.read_lines('input') or { panic('Could not open input file!') }

	mut gears := []Gear{}
	mut r,_ ,_ := regex.regex_base('\\d+')

	for index, line in input {
		matches := r.find_all(line) 

		for x := 0; x < matches.len; x+=2 {
			gear := find_gear(input, index, matches[x], matches[x+1])

			if gear != none {
				gears << gear	
			}	
		}
	}

	mut ratios := 0

	for _, group in arrays.group_by(gears, fn (gear Gear) string {return '${gear.x}:${gear.y}'}) {
		if group.len != 2 {continue}

		ratios = ratios + group[0].value * group[1].value
	}

	println('Ratios: ${ratios}')
}
