#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 2_1.v)"
  [[ "$result" =~ "2683" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 2_2.v)"
  [[ "$result" =~ "" ]]
}
