import os
import regex
import arrays

fn is_part_number(lines []string, index int, start int, end int) int {
	for y := index-1; y <= index+1; y+=1 {
		if y < 0 { continue }
		if y >= lines.len { return 0 }

		for x := start-1; x < end+1; x+=1 {
			if x < 0 { continue }
			if x >= lines[index].len { continue }

			if lines[y][x] != `.` && !lines[y][x].is_digit() { return lines[index][start..end].int() }
		}
	} 

	return 0
}

fn main() {
	input := os.read_lines('input') or { panic('Could not open input file!') }

	mut r, _, _ := regex.regex_base('\\d+')
	parsed_input := arrays.flat_map_indexed[string, int](input, fn [mut r, input] (index int, line string) []int {
		matches := r.find_all(line)
		mut numbers := []int{}

		for x := 0; x < matches.len; x+=2 {
			numbers << is_part_number(input, index, matches[x], matches[x+1])
		}

		return numbers
	})

	println('Engine code: ${arrays.sum(parsed_input) or {0}}')
}
