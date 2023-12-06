#===============================config=========================================#

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(abspath $(dir $(mkfile_path)))

#===============================targets=======================================#

test:
	@echo "Testing day 6"
	@bats test.sh

part1: v/part1
part2: v/part2

v/part1:
	@v run 6_1.v

v/part2:
	@v run 6_2.v
