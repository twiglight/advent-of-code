import os
import encoding.binary

enum Action {
	raw
	not
	and
	@or
	lshift
	rshift
}

interface Operation {
	execute() string
}

type RawOperation = string

fn (ro RawOperation) execute() string {
	return ro
}

struct NotOperation {
	operand Operation
}

fn (uo UnaryOperation) execute() string {
	return ~operand.execute()
}

struct BinaryOperation {
	action Action
	lhs Operation
	rhs Operation
}

fn (bo BinaryOperation) execute() string {
	match bo.action {
		.and { return '${lhs.execute().u16() & rhs.execute().u16()}' }
		.@or { return lhs.execute() | rhs.execute() }
		.lshift { return lhs.execute() << rhs.execute() }
		.rshift { return lhs.execute() >> rhs.execute() }
		else { panic('Unsupported Binary action') }
	}
}

fn parse_command(line string) Operation {
	parts := line.split(' ')

	if parts[1] == 'AND' {
		return BinaryOperation{.and, parts[0], parts[1]}
	} else if parts[1] == 'OR' {
		return BinaryOperation{.or, parts[0], parts[1]}
	} else if parts[1] == 'LSHIFT' {
		return BinaryOperation{.lshift, parts[0], parts[1]}
	} else if parts[1] == 'RSHIFT' {
		return BinaryOperation{.rshift, parts[0], parts[1]}
	} else if parts[0] == 'NOT' {
		return UnaryOperation{.not, parts[1]}
	} else {
		return UnaryOperation{.raw, parts[0]}
	}
}

fn parse_lines(lines []string, target string) u16 {
	if lines.len < 1 {
		return 0
	}

	if !lines.last().ends_with('-> ${target}') {
		return parse_lines(lines[..lines.len], target)
	}

	cmd := parse_command(lines.last())
}

fn main() {
	input_file := os.read_lines('input') or {
		panic('Can\'t read input file!')
	}

	mut target := 'a'
	for i := input_file.len-1; i > 0; i -= 1 {
		if !input_file[i].ends_with('-> ${target}') {
			continue
		}

		println(input_file[i])
	}
}
