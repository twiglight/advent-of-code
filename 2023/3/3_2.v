import os
import regex
import arrays

fn has_gear_match(lines []string, index int, pos int) bool {
	mut n_numbers := 0

	for y := index-1; y <= index+1; y+=1 {
		if y < 0 { continue }
		if y >= lines.len { continue }

		mut r, _, _ := regex.regex_base('\\d+')
		n_numbers = n_numbers + r.find_all_str(lines[y][pos-1..pos+2]).len
	}
	return n_numbers == 2
}

struct Point {
	x int
	y int
}

struct Gear {
	value int
	gear_pos Point
}

fn is_gear(lines []string, index int, start int, end int) ?Gear {
	for y := index-1; y <= index+1; y+=1 {
		if y < 0 { continue }
		if y >= lines.len { return none }

		for x := start-1; x < end+1; x+=1 {
			if x < 0 { continue }
			if x >= lines[index].len { continue }

			if lines[y][x] == `*` && has_gear_match(lines, y, x) { 
				return Gear{lines[index][start..end].int(), Point{x, y}}
			}
		}
	} 

	return none
}

fn is_part_number(lines []string, index int, start int, end int) bool {
	for y := index-1; y <= index+1; y+=1 {
		if y < 0 { continue }
		if y >= lines.len { return false }

		for x := start-1; x < end+1; x+=1 {
			if x < 0 { continue }
			if x >= lines[index].len { continue }

			if lines[y][x] != `.` && !lines[y][x].is_digit() { return true }
		}
	} 

	return false
}

fn main() {
	input := os.read_lines('input') or { panic('Could not open input file!') }

	mut r, _, _ := regex.regex_base('\\d+')
	parsed_input := arrays.map_indexed(input, fn [mut r, input] (index int, line string) string {
		return r.replace_by_fn(line, fn [input, index] (re regex.RE, in_txt string, start int, end int) string {

			if is_part_number(input, index, start, end) {
				return in_txt[start..end]
			}

			return in_txt[start..end].runes().map(fn (c rune) rune {return `.`}).string()
		})
	})
	
	mut gears := []Gear{}

	for index, line in parsed_input {
		matches := r.find_all(line) 

		for x := 0; x < matches.len; x+=2 {
			gear := is_gear(input, index, matches[x], matches[x+1])

			if gear != none {
				gears << gear	
			}	
		}
	}

	mut ratios := 0

	for _, group in arrays.group_by(gears, fn (gear Gear) string {return '${gear.gear_pos.x}:${gear.gear_pos.y}'}) {
		ratios = ratios + group[0].value * group[1].value
	}

	println('Ratios: ${ratios}')
}
