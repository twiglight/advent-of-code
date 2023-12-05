import os
import arrays

fn translate(seed u64, mapping []u64) u64 {
	for x := 0; x < mapping.len; x += 3 {
		println('s:${seed}, src:${mapping[x]}-${mapping[x]+mapping[x+2]}, dst:${mapping[x+1]}-${mapping[x+1]+mapping[x+2]}')

		upper := mapping[x+1]+mapping[x+2]
		if seed >= mapping[x+1] && seed < upper {
			return seed - mapping[x+1] + mapping[x]
		}
	}

	return seed
}

fn main() {
	input := os.read_file('input') or { panic('Could not open input file!') }
	lines := input.split_into_lines().filter(it != '')

	mut seeds := []u64{}
	for seed in lines.first().split(': ').last().split(' ') {
		seeds << seed.u64()
	}

	mut maps := [][]u64{}
	mut acc := []u64{}
	for line in lines[2..] {
		if !line.contains(':') {
			acc << line.split(' ').map(it.u64())
		} else {
			maps << acc
			acc = []u64{}
		}
	}

	println(arrays.min(seeds.map(fn [maps] (seed u64) u64 {
		mut s := seed
		for mapping in maps {
			s = translate(s, mapping)
		}
		return s
	})) or {-1})
}
