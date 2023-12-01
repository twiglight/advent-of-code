import os
import regex
import arrays

const translation := {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6, 'seven': 7, 'eight': 8, 'nine': 9}

fn main() {
	input := os.read_lines('input') or {
		panic('Can\t read input file!')
	}

	numbers := input.map(fn (line string) string {
			mut r := regex.regex_opt(translation.keys().map('(${it})').join('|')) or {panic('Could not construct regex!')}
			return r.replace_by_fn(line, fn (re regex.RE, in_txt string, start int, end int) string {
				return '${in_txt[start..end]}${in_txt[end-1..end]}'
			})		
		}).map(fn (line string) string {
			mut r := regex.regex_opt(translation.keys().map('(${it})').join('|')) or {panic('Could not construct regex!')}
			return r.replace_by_fn(line, fn (re regex.RE, in_txt string, start int, end int) string {
				return '${translation[in_txt[start..end]]}'
			})
		}).map(fn (line string) u16 {
			mut r := regex.regex_opt('\\d') or { panic('Could not construct regex!') }
			results := r.find_all_str(line)

			number := '${results.first()}${results.last()}'.u16()
			return number
		})

	println('The calibration sum is: ${arrays.sum(numbers)!}')
}
