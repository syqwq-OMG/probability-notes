#import "mod.typ": *

#counter(heading).update(0)
#counter(page).update(1)
#set heading(numbering: "I.")

#set page(columns: 2)
= Definitions
#vv
#outline(title: none, target: figure.where(kind: "definition"))

= Theorems
#vv
#outline(title: none, target: figure.where(kind: "theorem"))

= Figures
#vv
#outline(title: none, target: figure.where(kind: "pic"))
