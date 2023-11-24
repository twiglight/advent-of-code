#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 1_1.v)"
  [[ "$result" =~ "138" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 1_2.v)"
  [[ "$result" =~ "1771" ]]
}
