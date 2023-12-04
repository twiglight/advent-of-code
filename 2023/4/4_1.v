import os
import arrays

fn main() {
	input := os.read_lines('input') or { panic('Cannot read input file!') }

	points := input.map(fn (line string) []string {
		card := line.split(':').last().split('|')
		numbers := card.first().trim_space().split(' ')
		winning_numbers := card.last().trim_space().split(' ')

		return numbers.filter(fn [winning_numbers] (number string) bool {
			return number != '' && winning_numbers.any(it == number)
		})
	}).map(fn (numbers []string) int {
		if numbers.len < 1 { return 0 }

		return arrays.fold(numbers, 0, fn (acc int, elem string) int {
			if acc == 0 { return 1 }

			return acc + acc
		})
	})

	println('Total amount of points: ${arrays.sum(points) or {0}}')
}
