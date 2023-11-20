import unittest
import strutils
import noxen
#[
╭─────────────────────────error────────────────────────╮
│ error unknown op got left 9292929 right 889299 op ?  │
│ at idk where maybe 5:6                               │
│ ajjaiaiakakaioakakakiaia                             │
╰──────────────────────────────────────────────────────╯]#
proc myStyle(s: string): string =
  
  result = s.replace("╭", "@")
  result = result.replace("╮", "@")
  result = result.replace("╯", "@")
  result = result.replace("╰","@")

  
test "can make a box":

  echo makeBox("error unknown op got left 9292929 right 889299 op ? \nat idk where maybe 5:6\najjaiaiakakaioakakakiaia", "error", border_style=red, text_style=yellow)
  echo "windows moment realll window".makeBox("window its cool")
  echo "my awesome style window".makeBox("my window", border_style=myStyle)
  check 10 == 10
