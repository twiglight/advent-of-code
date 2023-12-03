import os
import regex
import arrays

fn is_part_number(lines []string, subject string, index int, start int, end int) bool {
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

			if is_part_number(input, in_txt[start..end], index, start, end) {
				return in_txt[start..end]
			}

			return in_txt[start..end].runes().map(fn (c rune) rune {return `.`}).string()
		})
	}).join('')
	
	println('Engine code: ${arrays.fold(r.find_all_str(parsed_input), 0, fn (acc int, elem string) int {return acc + elem.int()})}')
}
