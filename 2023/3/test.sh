#!/usr/bin/env bats

@test "Test for Part 1 (vlang)" {
  result="$(v run 3_1.v)"
  [[ "$result" =~ "2683" ]]
}

@test "Test for Part 2 (vlang)" {
  result="$(v run 3_2.v)"
  [[ "$result" =~ "49710" ]]
}
