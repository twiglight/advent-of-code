import os
import regex
import arrays

const red = 12
const green = 13
const blue = 14

fn cubes_no_larger_than(cubes string, max int) bool {
	mut r := regex.regex_opt('\\d+') or { panic('Could not create regex!') }
	start, end := r.find(cubes)

	return cubes[start..end].int() <= max
}

fn main() {
	input := os.read_lines('input') or { panic('Could not read input file!') }

	possible_games := input.filter(fn (game string) bool {
		return game.split(':').last().split(';').all(fn (hand string) bool {
			return hand.split(',').all(fn (cubes string) bool {
				match true {
					cubes.contains('red') { return cubes_no_larger_than(cubes, red) }
					cubes.contains('green') { return cubes_no_larger_than(cubes, green) }
					cubes.contains('blue') { return cubes_no_larger_than(cubes, blue) }
					else { return false }
				}
			})
		})	
	}).map(fn (game string) int {
		return game.split(':').first().split(' ').last().int()
	})
	
	println('The sum of all possible games ids is ${arrays.sum(possible_games)!}')
}
