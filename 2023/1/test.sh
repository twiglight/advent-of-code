#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 1_1.ar)"
  [[ "$result" =~ "55712" ]]
}

@test "Test for Part 1 (vlang)" {
  result="$(v run 1_1.v)"
  [[ "$result" =~ "55712" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 1_2.v)"
  [[ "$result" =~ "55413" ]]
}
