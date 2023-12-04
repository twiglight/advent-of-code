import os

struct WinningCard {
	card int
	numbers []int
}

fn main() {
	input := os.read_lines('input') or { panic('Cannot read input file!') }

	mut cards := input.map(fn (line string) WinningCard {
		card := line.split(':').last().split('|')
		numbers := card.first().trim_space().split(' ')
		winning_numbers := card.last().trim_space().split(' ')

		return WinningCard{line.split(':').first().split(' ').last().int(), numbers.filter(fn [winning_numbers] (number string) bool {
			return number != '' && winning_numbers.any(it == number)
		}).map(it.int())}
	})

	for x := 0; x < cards.len; x+=1 {
		if cards[x].numbers.len < 1 { continue }

		for index, _ in cards[x].numbers {
			cards << cards[cards[x].card+index]
		}
	}

	println('You will end up with ${cards.len} cards')
}
