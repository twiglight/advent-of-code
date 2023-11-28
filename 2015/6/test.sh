#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 6_1.v)"
  [[ "$result" =~ "377891" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 6_2.v)"
  [[ "$result" =~ "14110788" ]]
}
