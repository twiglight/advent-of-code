import os
import regex
import arrays

fn main() {
	input := os.read_lines('input') or { panic('Could not read input file!') }

	possible_games := input.map(fn (game string) int {
		colors := ['red', 'green', 'blue'].map(fn [game] (color string) int {
			mut r := regex.regex_opt('\\d+ ${color}') or { panic('Could not create regex!') }
			return arrays.max[int](r.find_all_str(game.split(':').last()).map(it.split(' ').first().int())) or { panic('WOW') }
		})

		return arrays.reduce(colors, fn (acc int, elem int) int {
			return acc * elem
		}) or { panic('help!') }
	})
	
	println('The sum of all possible games ids is ${arrays.sum(possible_games)!}')
}
