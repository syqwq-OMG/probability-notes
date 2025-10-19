#import "mod.typ": *

= 随机事件与概率

== 随机事件及其运算

#definition(title: [样本空间])[
  随机现象的一切可能基本结果组成的集合称为*样本空间*，记作 $Omega = Set(omega)$.
]<def:sample-space>

// 样本点定义
#definition(title: [样本点])[
  样本空间中的每一个基本结果称为*样本点*，记作 $omega in Omega$.
]<def:sample-point>

// 离散样本空间定义
#definition(title: [离散样本空间])[
  如果样本空间 $Omega$ 中的样本点是可数个的，则称样本空间 $Omega$ 为*离散样本空间*.
]<def:discrete-sample-space>

// 连续样本空间
#definition(title: [连续样本空间])[
  如果样本空间 $Omega$ 中的样本点是不可数个的，则称样本空间 $Omega$ 为*连续样本空间*.
]<def:continuous-sample-space>

// 随机事件
#definition(title: [随机事件])[
  样本空间 $Omega$ 的任一子集称为*随机事件*，简称*事件*，记作 $A subset.eq Omega$.
]<def:random-event>

#remark(title: [随机事件的分类])[
  + *基本事件*： 包含单个样本点的事件，记作 $A = {omega}$.

  + *必然事件*： 包含样本空间中所有样本点的事件，记作 $A = Omega$.
  + *不可能事件*： 不包含任何样本点的事件，记作 $A = emptyset$.
]

#remark(title: [事件的关系])[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，

  + *包含关系*： 若属于 $A$ 的任一样本点也属于 $B$，则称事件 $A$ 包含于事件 $B$，记作 $A subset.eq B$.

  + *等价关系*： 若属于 $A$ 的任一样本点也属于 $B$，且属于 $B$ 的任一样本点也属于 $A$，则称事件 $A$ 与事件 $B$ 等价，记作 $A = B$.
  + *互不相容*： 若事件 $A$ 与事件 $B$ 没有共同的样本点，则称事件 $A$ 与事件 $B$ 互不相容，记作 $A inter B = emptyset$.
]

// 可测函数
#definition(title: [可测函数])[
  设 $(X,cal(X)), (Y,cal(Y))$ 是两个可测空间，映射 $f: X to Y$ 如果满足对任意 $B in cal(Y)$，都有 $f^(-1)(B) = {x in X | f(x) in B} in cal(X)$，则称映射 $f$ 为*可测函数*.
]<def:measurable-function>

// 随机变量
#definition(title: [随机变量])[
  设 $(Omega, cal(F))$ 是一个可测空间，如果映射 $X: Omega to RR$ 是从样本空间 $Omega$ 到实数集 $RR$ 的可测函数，则称映射 $X$ 为*随机变量*.
]<def:random-variable>

// 事件的并
#definition(title: [事件的并])[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，则定义它们的*并*为
  $
    A union B := {omega | omega in A or omega in B}
  $
]<def:event-union>

// 事件的交
#definition(title: [事件的交])[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，则定义它们的*交*为
  $
    A inter B := {omega | omega in A and omega in B}
  $
]<def:event-intersection>

// A-B
#definition(title: [事件的差])[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，则定义它们的*差*为
  $
    A - B := {omega | omega in A and omega in.not B}
  $
]<def:event-difference>

// 对立事件
#definition(title: [对立事件])[
  设 $A subset.eq Omega$ 是样本空间 $Omega$ 上的一个事件，则定义它的*对立事件*为
  $
    overline(A) := Omega - A = {omega | omega in Omega and omega in.not A}
  $
]<def:complementary-event>


#proposition(title: [互为对立事件])[
  事件 $A,B subset.eq Omega$ 互为对立事件的充分必要条件是 $A union B = Omega$ 且 $A inter B = emptyset$.
]

#remark[
  + 对立事件一定是互不相容的. 但是，互不相容的事件不一定是对立事件.

  + $A-B = A overline(B)$.
]

#property(title: [事件的运算性质])[
  设 $A,B,C subset.eq Omega$ 是样本空间 $Omega$ 上的任意三个事件，则有：

  1. *交换律*： $A union B = B union A$， $A inter B = B inter A$.

  2. *结合律*： $(A union B) union C = A union (B union C)$， $(A inter B) inter C = A inter (B inter C)$.

  3. *分配律*： $A inter (B union C) = (A inter B) union (A inter C)$， $A union (B inter C) = (A union B) inter (A union C)$.

  4. *De Morgan 律*： $overline(A union B) = overline(A) inter overline(B)$， $overline(A inter B) = overline(A) union overline(B)$.
]

// 事件域
#definition(title: [$sigma$-代数])[
  设 $Omega$ 是一个集合， $cal(F)$ 是 $Omega$ 的幂集的子集. 如果 $cal(F)$ 满足：
  1. $emptyset in cal(F)$

  2. 对任意 $A in cal(F)$，有 $overline(A) in cal(F)$
  3. 对任意可列个集合 $A_1,A_2,A_3,dots.h.c in cal(F)$，有 $union.big_(i=1)^(oo) A_i in cal(F)$

  则称 $(Omega, cal(F))$ 是一个可测空间，$cal(F)$ 称为 $Omega$ 上的一个*$sigma$-代数*.
]<def:sigma-algebra>

// 样本空间的分割
#definition(title: [样本空间的分割])[
  设 $Omega$ 为样本空间，$A_1,A_2,dots,A_n$ 为样本空间 $Omega$ 上的 $n$ 个事件. 如果 $A_1,A_2,dots,A_n$ 满足：

  1. $union.big_(i=1)^(n) A_i = Omega$

  2. 对任意 $i,j = 1,2,dots,n$ 且 $i != j$，有 $A_i inter A_j = emptyset$

  则称事件组 ${A_1,A_2,dots,A_n}$ 为样本空间 $Omega$ 的一个*分割*.
]<def:partition-of-sample-space>

== 概率的定义及其确定方法

// 测度空间
#definition(title: [测度空间])[
  设 $(Omega, cal(F))$ 是一个可测空间，$mu: cal(F) to [0,+oo]$ 是一个函数. 如果 $mu$ 满足：
  1. $mu(emptyset) = 0$

  2. 对任意互不相容的集合 $A_1,A_2,A_3,dots.h.c in cal(F)$，有 $mu(union.big_(i=1)^(oo) A_i) = sum_(i=1)^(oo) mu(A_i)$
  则称 $(Omega, cal(F), mu)$ 为一个*测度空间*，$mu$ 称为 $Omega$ 上的一个*测度*.
]<def:measure-space>

// 概率空间
#definition(title: [概率空间])[
  设 $(Omega, cal(F), P)$ 是一个测度空间，且满足 $P(Omega) = 1$. 则称 $(Omega, cal(F), P)$ 为一个*概率空间*，$P$ 称为 $Omega$ 上的一个*概率*.
]<def:probability-space>

#pagebreak()
== 概率的性质

#property(title: [互补事件的概率])[
  设 $A subset.eq Omega$ 是样本空间 $Omega$ 上的一个事件，则有 $P(overline(A)) = 1 - P(A)$.
]

// 概率的单调性
#property(title: [概率的单调性])[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，且 $A subset B$，则有 $P(B-A) = P(B) - P(A)$.
]

#corollary()[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，且 $A subset.eq B$，则有 $P(A) <= P(B)$.
]

// 概率的加法公式
#property(title: [概率的加法公式])[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，则有 $P(A union B) = P(A) + P(B) - P(A inter B)$.
]
#corollary(title: [容斥原理])[
  设 $A_1,A_2,dots,A_n subset.eq Omega$ 是样本空间 $Omega$ 上的 $n$ 个事件，则有
  $
    P(union.big_(i=1)^(n) A_i) = &sum_(i=1)^(n) P(A_i) - sum_(1 <= i < j <= n) P(A_i inter A_j) + sum_(1 <= i < j < k <= n) P(A_i inter A_j inter A_k) \
    &+ dots.h.c + (-1)^(n-1) P(inter.big_(i=1)^(n) A_i)
  $
]
#corollary(title: [概率的半可加性])[
  设 $A_1,A_2,A_3,dots.h.c subset.eq Omega$ 是样本空间 $Omega$ 上的可列个事件，则有 $P(union.big_(i=1)^(oo) A_i) <= sum_(i=1)^(oo) P(A_i)$.
]

// 极限事件
#definition(title: [极限事件])[
  + 对 $cal(F)$ 中任一单调不减的事件列 $A_1 subset A_2 subset dots.h.c subset A_n subset dots.h.c$，称可列并 $union.big_(i=1)^(oo) A_i$ 为 $Set(A_n)$ 的*极限事件*，记作
    $
      lim_(n -> oo) A_n := union.big_(i=1)^(oo) A_i
    $
  + 对 $cal(F)$ 中任一单调不增的事件列 $A_1 supset A_2 supset dots.h.c supset A_n supset dots.h.c$，称可列交 $inter.big_(i=1)^(oo) A_i$ 为 $Set(A_n)$ 的*极限事件*，记作
    $
      lim_(n -> oo) A_n := inter.big_(i=1)^(oo) A_i
    $
]


// 概率的连续性
#definition(title: [连续性])[
  对 $cal(F)$ 上的一个测度 $mu$，
  + 如果他对任一单调不减的集合序列 $A_1 subset A_2 subset dots.h.c subset A_n subset dots.h.c$ 满足 $mu(lim_(n -> oo) A_n) = lim_(n -> oo) mu(A_n)$，则称测度 $mu$ 具有*下连续性*.

  + 如果他对任一单调不增的集合序列 $A_1 supset A_2 supset dots.h.c supset A_n supset dots.h.c$ 满足 $mu(lim_(n -> oo) A_n) = lim_(n -> oo) mu(A_n)$，则称测度 $mu$ 具有*上连续性*.
  #v(0.5em)
]

#property(title: [概率的连续性])[
  若 $P$ 为可测集 $cal(F)$ 上的概率测度，则 $P$ 具有上、下连续性.
]

== 条件概率

// 条件概率
#definition(title: [条件概率])[
  设 $(Omega, cal(F), P)$ 是一个概率空间，$A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，且 $P(B) > 0$. 定义在事件 $B$ 已经发生的条件下事件 $A$ 发生的概率为*条件概率*，记作 $P(A|B)$，其计算公式为
  $
    P(A|B) = frac(P(A B), P(B))
  $
]<def:conditional-probability>

#property(title: [条件概率是概率])[
  条件概率是概率，即
  1. *非负性*： 对任意事件 $A subset.eq Omega$，有 $P(A|B) >= 0$.

  2. *正则性*： $P(Omega|B) = 1$.
  3. *可列可加性*： 对任意互不相容的事件列 $A_1,A_2,A_3,dots.h.c subset.eq Omega$，有 $ P(union.big_(i=1)^(oo) A_i mid(|) B) = sum_(i=1)^(oo) P(A_i mid(|) B) $
]

#property(title: [乘法公式])[
  + 若 $P(B)>0$，则
    $
      P(A B) = P(B) P(A mid(|) B)
    $
  + 若 $P(A_1 A_2 dots.h.c A_(n-1) )>0$ ，则
    $
      P(A_1 A_2 dots.h.c A_n) = P(A_1) P(A_2 mid(|) A_1) P(A_3 mid(|) A_1 A_2) dots.h.c P(A_n mid(|) A_1 A_2 dots.h.c A_(n-1))
    $
]

#theorem(title: [全概率公式])[
  设 $B_1,B_2,dots,B_n subset.eq Omega$ 是样本空间 $Omega$ 上的一个事件分割，且对任意 $i = 1,2,dots,n$，有 $P(B_i) > 0$. 则对任意事件 $A subset.eq Omega$，有
  $
    P(A) = sum_(i=1)^(n) P(B_i) P(A mid(|) B_i)
  $

  #figure(
    caption: [Total Probability Formula],
    kind: "pic",
    supplement: [Fig.],

    image("../pic/ch1/total-probability.svg", width: 60%),
  )
]<thm:total-probability-formula>
对于全概率公式，我们要注意以下几点：

+ 假如 $0<P(B)<1$，则
  $
    P(A)=P(B) P(B mid(|) A)+P(overline(B)) P(overline(B) mid(|) A)
  $

+ 条件中 $B_1,B_2,dots.h.c,B_n$ 为样本空间的一个划分可以改成 $B_1,B_2,dots.h.c,B_n$ 互不相容，且 $A subset union.big_(i=1)^(oo) B_i$，全概率公式依然成立。
+ 对可列无限个事件，全概率公式依然成立。


// bayes公式
#theorem(title: [Bayes公式])[
  设 $B_1,B_2,dots,B_n subset.eq Omega$ 是样本空间 $Omega$ 上的一个事件分割，如果 $P(A)>0, P(B_i) >0$，则
  $
    P(B_i mid(|) A) = frac(P(B_i) P(A mid(|) B_i), sum_(j=1)^(n) P(B_j) P(A mid(|) B_j))
    quad i=1,2,dots.h.c,n
  $
]<thm:bayes-formula>
#pagebreak()

== 独立性
// 两个事件的独立性
#definition(title: [两个事件的独立性])[
  设 $A,B subset.eq Omega$ 是样本空间 $Omega$ 上的两个事件，如果 $P(A B) = P(A) P(B)$，则称事件 $A$ 与事件 $B$ 相互*独立*.
]<def:independence-of-two-events>

#property[
  若 $A$ 与 $B$ 独立，则 $A$ 与 $overline(B)$ 独立，$overline(A)$ 与 $B$ 独立，$overline(A)$ 与 $overline(B)$ 独立.
]

#definition(title: [多个事件的独立性])[
  设有 $n$ 个事件 $A_1,A_2,dots,A_n subset.eq Omega$，如果对任意的子集 ${i_1,i_2,dots,i_k} subset.eq {1,2,dots,n}$，都有
  $
    cases(
      P(A_(i_1) A_(i_2) ) = P(A_(i_1)) P(A_(i_2)) \
      P(A_(i_1) A_(i_2) A_(i_3) ) = P(A_(i_1)) P(A_(i_2)) P(A_(i_3)) \
      dots.h.c dots.h.c \
      P(A_(i_1) A_(i_2) dots.h.c A_(i_k) ) = P(A_(i_1)) P(A_(i_2)) dots.h.c P(A_(i_k))
    )
  $
  则称这 $n$ 个事件 $A_1,A_2,dots,A_n$ *相互独立*.
]

#remark()[
  两两独立 $!=$   相互独立.
]

// 试验的独立性
#definition(title: [试验的独立性])[
  设有两个试验 $E_1,E_2$，假如试验 $E_1$ 的任一结果（事件）与试验 $E_2$ 的任一结果（事件）相互独立，则称试验 $E_1$ 与试验 $E_2$ *相互独立*.
]

类似的，可以定义 $n$ 个试验的独立性。如果试验 $E_1, E_2, dots.h.c , E_n$ 的任一结果都是互相独立的事件，则称试验 $E_1, E_2, dots.h.c , E_n$ *相互独立*.

如果这 $n$ 个试验还是相同的，则称其为* $n$ 重独立试验*。

如果这 $n$ 个试验，每次试验的结果都只有两个 $A, overline(A)$，则称其为 *$n$ 重伯努利试验*。 




















#pagebreak()
