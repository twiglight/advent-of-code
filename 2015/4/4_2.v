import os
import crypto.md5

fn main() {
	input_file := os.read_file('input') or {
		panic('Can\'t read input file!')
	}.trim_space()

	mut secret := 0

	for {
		hash := md5.hexhash('${input_file}${secret}')

		if hash.starts_with('000000') {
			println(secret)
			break
		} else {
			secret = secret + 1
		}
	}
}
