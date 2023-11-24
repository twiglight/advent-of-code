import os

fn is_naughty(line string) bool {
	return line.contains_any_substr(['ab', 'cd', 'pq', 'xy'])
}

fn contains_three_vowels(line string) bool {
	return line
		.split('')
		.filter(fn (s string) bool {return 'aeiou'.contains(s)})
		.len >= 3
}

fn contains_double_rune(line string) bool {
	chars := line.split('')

	if chars.len < 2 {
		return false
	}

	for i := 0; i < chars.len - 1; i += 1 {
		if chars[i] == chars[i+1] {
			return true
		}
	}

	return false
}

fn main() {
	input_file := os.read_lines('input') or {
		panic('Can\'t read input file')
	}

	mut valid := 0

	for line in input_file {
		if is_naughty(line) {
			continue
		}

		if !contains_three_vowels(line) {
			continue
		}

		if !contains_double_rune(line) {
			continue
		}

		valid = valid + 1
	}

	println('${valid} strings are valid')
}
