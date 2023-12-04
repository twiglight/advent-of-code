import os

struct WinningCard {
	number int
	won int
}

fn main() {
	input := os.read_lines('input') or { panic('Cannot read input file!') }

	mut cards := input.map(fn (line string) WinningCard {
		card := line.split(':').last().split('|')
		numbers := card.first().trim_space().split(' ')
		winning_numbers := card.last().trim_space().split(' ')

		return WinningCard{line.split(':').first().split(' ').last().int(), numbers.filter(fn [winning_numbers] (number string) bool {
			return number != '' && winning_numbers.any(it == number)
		}).len}
	})

	for card in cards {
		for index in 0 .. card.won {
			cards << cards[card.number+index]
		}
	}

	println('You will end up with ${cards.len} cards')
}
