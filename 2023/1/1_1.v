import os
import regex
import arrays

fn main() {
	input := os.read_lines('input') or {
		panic('Can\t read input file!')
	}

	numbers := input.map(fn (line string) u16 {
		mut r := regex.regex_opt('\\d') or { panic('Could not construct regex!') }
		results := r.find_all_str(line)

		number := '${results.first()}${results.last()}'.u16()
		return number
	})

	println('The calibration sum is: ${arrays.sum(numbers)!}')
}
