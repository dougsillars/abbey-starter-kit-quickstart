package common

import data.abbey.functions

allow[msg] {
  true
  msg := "access allowed for null_grant" # Use any message you like.
}

allow[msg] {
  functions.expire_after("24h")
  msg := "granting access for 24 hours."
}

allow[msg] {
  functions.expire_after("5m")
  msg := "granting access for 5 minutes."
}