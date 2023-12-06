#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 6_1.v)"
  [[ "$result" =~ "771628" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 6_2.v)"
  [[ "$result" =~ "27363861" ]]
}
