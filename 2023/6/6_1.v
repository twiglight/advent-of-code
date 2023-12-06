import os
import regex
import arrays

fn parse(time int, max_time int, step int, distance int) int {
	if (time * (max_time - time)) > distance { return parse(time + step, max_time, step, distance) + 1 }
	else { return 0 }
}

fn main() {
	input := os.read_lines('input') or { panic('Could not read input file!') }

	mut r := regex.regex_opt(r'\d+') or { panic('Could not create regex!') }
	times := r.find_all_str(input.first()).map(it.int())
	distances := r.find_all_str(input.last()).map(it.int())

	total_ways_timed := arrays.reduce(arrays.map_indexed(times, fn [distances] (i int, time int) int {
		return parse(time/2+1, time, 1, distances[i]) + parse(time/2, time, -1, distances[i])
	}), fn (acc int, ways int) int {
		return acc * ways
	}) or {0}

	println('The multiplication of all total ways is: ${total_ways_timed}')
}
