#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 3_1.v)"
  [[ "$result" =~ "2572" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 3_2.v)"
  [[ "$result" =~ "2631" ]]
}
