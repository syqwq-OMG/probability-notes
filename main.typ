#import "lib.typ": math-note
#import math-note: *
#import "utils.typ": *


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
#show math.equation.where(block: false): math.display

#show table.cell.where(y: 0): it => {
  // show math.equation:set text(font:"Fira Math")
  text(
    font: (en-font-sans, cn-font-sans),
    fill: tcol.darken(10%),
    strong(it),
  )
}

#include "chapters/ch1.typ"
#include "chapters/ch2.typ"
// #include "chapters/ch3.typ"
// #include "chapters/ch4.typ"
// #include "chapters/ch5.typ"
// #include "chapters/ch6.typ"
// #include "chapters/ch7.typ"
#include "chapters/appendix.typ"
