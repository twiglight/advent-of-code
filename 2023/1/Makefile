#===============================config=========================================#

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(abspath $(dir $(mkfile_path)))

#===============================targets=======================================#

test:
	@echo "Testing day 1"
	@bats test.sh

part1: v/part1 arturo/part1
part2: v/part2

arturo/part1:
	@echo "Arturo:" `arturo 1_1.ar`

v/part1:
	@echo "Vlang:" `v run 1_1.v`

v/part2:
	@echo "Vlang:" `v run 1_2.v`
