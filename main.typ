#import "lib.typ": math-note
#import math-note: *


#set text(lang: "zh")
#show outline.entry: set text(fill: rgb("#136598"))
#set outline.entry(fill: repeat(math.dot, gap: 0.12em))
#show math.equation: set block(breakable: true)

#show: note.with(
  course: [概率论\ 与数理统计],
  author: "syqwq",
  watermark: none,
)


#show enum: set par(first-line-indent: 0em)
#set par(first-line-indent: 0em)
#show math.equation.where(block: false):math.display

#include "chapters/ch1.typ"
#include "chapters/ch2.typ"


#counter(heading).update(0)
#counter(page).update(1)
#set heading(numbering: "I.")

= Index
#v(0.5em)
#columns(2, outline(title: none, target: figure.where(kind: "definition")))
