#let to = math.arrow.r
#let from = math.arrow.l
#let up = math.arrow.t
#let down = math.arrow.b
#let vv = v(0.5em)
#let Var = math.op("Var")
#let Ge = math.op("Ge")
#let Nb = math.op("Nb")
#let Exp = math.op("Exp")
#let LN = math.op("LN")
#let Cau = math.op("Cau")
#let Wb = math.op("Wb")

#let tcol = rgb("#061a87")
// #let tcol = rgb("#6f1304")

#let summary-table = table.with(
  align: center + horizon,
  stroke: 0.5pt + tcol.lighten(70%),
  table.vline(x: 0, stroke: none),
  table.vline(x: 4, stroke: none),
  fill: (x, y) => {
    if y == 0 { tcol.lighten(96%) }
  },
  inset: 1em,
)