import strutils
import sugar

proc green*(s: string): string = "\e[32m" & s & "\e[0m"
proc grey*(s: string): string = "\e[90m" & s & "\e[0m"
proc yellow*(s: string): string = "\e[33m" & s & "\e[0m"
proc red*(s: string): string = "\e[31m" & s & "\e[0m"
proc none*(s: string): string = s

proc makeBox*(text: string, title: string = "", full_style: (s: string) -> string = none, border_style: (s: string) -> string = none, text_style: (s: string) -> string = none): string =
  ## makes a box!
  ## args =>
  ## ========
  ##
  ##
  ## text: text to put in body
  ## title: title of the box
  ## full_style: a proc string => string adds customization to the whole box like colors
  ## border_style: a proc string => string adds customization to the border like colors or changing border chars
  ## text_style: a proc string => string adds cutomization to the text can be a color
  ## noxen also comes with builtin procs to add colors ex. red, green, none(default),yellow, grey
  ##
  ##
  ## Examples
  ## ========   
  ##  
  ## .. code-block:: nim
  ##
  ##   makeBox("this is a error at 5:5", "error", full_style = red)
  ##
  ## .. code-block:: nim
  ##
  ##   makeBox("this is a error at 5:5", "error", border_style = red, text_style = yellow)

  var items: seq[string] = text.split("\n")
  var maxWidth = title.len + 4
  result &= "╭".border_style
  for item in items:
    if int(item.len) > maxWidth - 4: maxWidth = item.len + 4
  var i = 0
  while i < maxWidth:  
    if i == int(maxWidth / 2) - title.len + 2: 
      result &= title.border_style 
      i = i + title.len + 2
      continue
    result &= "─".border_style
    inc i
  result &= "╮\n".border_style

  for item in items:
    var res = "│ " & item.text_style
    while res.len < maxWidth + text_style("").len:
      res &= " "
    res &= " │\n".border_style 
    result &= res.border_style

  result &= "╰".border_style
  for i in 3 .. maxWidth: 
    result &= "─".border_style
  result &= "╯".border_style
  result = result.full_style
