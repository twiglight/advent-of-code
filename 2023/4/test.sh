#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 4_1.v)"
  [[ "$result" =~ "21138" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 4_2.v)"
  [[ "$result" =~ "7185540" ]]
}
