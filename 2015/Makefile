#===============================config=========================================#

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(abspath $(dir $(mkfile_path)))

#===============================targets=======================================#

test-all: test-day-1 test-day-2 test-day-3 test-day-4 test-day-5

test-day-1:
	@make --silent --directory  "${mkfile_dir}/1" test

test-day-2:
	@make --silent --directory  "${mkfile_dir}/2" test

test-day-3:
	@make --silent --directory  "${mkfile_dir}/3" test

test-day-4:
	@make --silent --directory  "${mkfile_dir}/4" test

test-day-5:
	@make --silent --directory  "${mkfile_dir}/5" test
