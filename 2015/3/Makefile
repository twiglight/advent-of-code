#===============================config=========================================#

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(abspath $(dir $(mkfile_path)))

#===============================targets=======================================#

test:
	@echo "Testing day 3"
	@bats test.sh

part1: v/part1
part2: v/part2

v/part1:
	@v run 3_1.v

v/part2:
	@v run 3_2.v
