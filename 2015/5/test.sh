#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 5_1.v)"
  [[ "$result" =~ "255" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 5_2.v)"
  [[ "$result" =~ "55" ]]
}
