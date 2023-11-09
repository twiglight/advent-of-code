import os

fn contains_pairs(line string) bool {
	subject := line.split('')

	if line.len < 4 {
		return false
	}

	mut acc := []string{}
	for i := 0; i < line.len -1; i += 1 {		
		acc << '${subject[i]}${subject[i+1]}'
	}

	for index, elem in acc {
		if index+2 >= acc.len {
			return false
		}
		if acc[index+2..].contains(elem) {
			return true
		}
	}
	
	return false
}

fn contains_repeating(line string) bool {
	subject := line.split('')

	if subject.len < 3 {
		return false
	}

	for i := 0; i < subject.len -2; i += 1 {
		if subject[i] == subject[i+2] {
			return true
		}
	}
	
	return false
}

fn main() {
	mut input_file := os.read_lines('input') or {
		panic('Can\'t read input file')
	}

	mut valid:= 0

	for line in input_file {
		if contains_pairs(line) && contains_repeating(line) {
			valid = valid + 1
		}
	}

	println('${valid} strings are valid')
}
