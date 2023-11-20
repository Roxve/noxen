# noxen
a terminal boxes lib for nim
example output
```
╭─────────────────────────error────────────────────────╮
│ error unknown op got left 9292929 right 889299 op ?  │
│ at idk where maybe 5:6                               │
│ ajjaiaiakakaioakakakiaia                             │
╰──────────────────────────────────────────────────────╯
```
NOTE: output may look broken on github page

NOTE: this is supposed to be border colored red and text colored yellow

there is only one proc to make boxes


# **makes a box!**

```nim
proc makeBox*(text: string, title: string = "", full_style: (s: string) -> string = none, border_style: (s: string) -> string = none, text_style: (s: string) -> string = none): string
```
## args =>
===========


- **text: text to put in body**

- **title: title of the box**

- **full_style: a proc string => string adds customization to the whole box like colors**

- **border_style: a proc string => string adds customization to the border like colors or changing border chars**

- **text_style: a proc string => string adds cutomization to the text can be a color**

### noxen also comes with builtin procs to add colors ex. red, green, none(default),yellow, grey


## Examples
============

  
```nim
makeBox("this is a error at 5:5", "error", full_style = red)
```

```nim
makeBox("this is a error at 5:5", "error", border_style = red, text_style = yellow)
```



style procs can be used for customizing border chars
ex.
```nim
proc myStyle(s: string): string =
  
  result = s.replace("╭", "@")
  result = result.replace("╮", "@")
  result = result.replace("╯", "@")
  result = result.replace("╰","@")

echo "my awesome style window".makeBox("my window", border_style=myStyle
```


NOTE: replace is avalibe in strutils

result =
```nim
@──────my window──────────@
│ my awesome style window │
@─────────────────────────@
```


### Credits
inspired by [boxen](https://github.com/sindresorhus/boxen)
made by accident by me (void*) for my own programming language (covalent) error messages
