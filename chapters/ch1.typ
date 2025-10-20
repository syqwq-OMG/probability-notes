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
  对于两个可测空间 $(Omega,cal(F)),(S,cal(S))$，如果存在一个函数 $X:Omega to S$ 满足
  $
    X^(-1)(B) := lr({ omega mid(|) X(omega) in B }) in cal(F), forall B in cal(S)
  $
  那么，称 $X$ 是一个从 $(Omega,cal(F))$ 到 $(S,cal(S))$ 的*可测函数*。
]<def:measurable-function>
#remark[这说的就是对于任何一个事件 $omega in cal(F)$，我们固然可以得知他的结果 $X(omega)$，而可测函数的定义是在说，我任意给定一个 $B in cal(S)$，他一定有 $cal(F)$ 中的可测事件与他对应。]

// 随机变量
#definition(title: [随机向量、随机变量])[
  在 @def:measurable-function 中，如果 $(S,cal(S))=(RR^(d), cal(R)^(d) )$，当 $d>1$ 时，我们称 $X$ 为*随机向量*；当 $d=1$ 时，我们称 $X$ 为*随机变量*。
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


=== 三大重要收敛定理

#theorem(title: [单调收敛定理(Monotone Convergence Theorem - MCT)])[
  若 $lr(( Omega, cal(F), mu ))$ 是一个测度空间， $lr({ f_i })_(i=1)^(oo)$ 是一族 $Omega -> RR$ 的可测函数，满足 $f_i arrow.t f$ a.e. 且 $integral f_1 dif mu > -oo$. 则积分和极限可以交换，且积分也单调收敛，即
  $
    integral f_i dif mu arrow.t integral f dif mu
  $
]

#remark(title: [热气球])[
  - 想象 $f_i$  是一个热气球在时刻 $i$  的体积， $integral f_i dif mu$  是它的总浮力。

  - 条件 $f_i arrow.t f$  意味着这个热气球只增不减，不断地膨胀，最终趋近于一个最终形态 f。

  - MCT定理说：既然热气球一直在稳定地、单调地变大，那么它浮力的极限，理所当然就是它最终形态的浮力。这个过程中没有“泄气”或者其他诡异的事情发生。
]

#proof[
  我们将证明分为两个主要部分：首先处理更简单也更基础的非负函数情况，然后利用它来证明一般情况。

  先假设 $f_1 >= 0$
  相当于证明等式：
  $
    lim_(n -> oo) integral f_n dif mu = integral f dif mu
  $
  考虑一边，即证明
  $ lim integral f_n dif mu <= integral f dif mu $ 这是显然的。 因为 $f_n arrow.t f$ 意味着 $forall n, f_n (omega)<= f(omega)$，从而 $integral f_n dif mu <= integral f dif mu$。因为 $integral f_n dif mu$ 单调有上界，因此 $lim integral f_n dif mu$ 存在，且 $lim integral f_n dif mu <= integral f dif mu$。

  接下来考虑另一侧
  $
    lim integral f_n dif mu >= integral f dif mu
  $
  回顾 $integral f dif mu$ 的定义是
  $
    integral f dif mu :=
    sup lr({ integral g dif mu mid(|) 0<=g<=f, g "为简单函数" })
  $
  如果我们可以证明对于任意的简单函数 $g$，都有 $c:=lim integral f_n dif mu >= integral g dif mu$，那么一定可以得到 $c$ 比他们的上确界大，从而得证。

  为此，任取简单函数 $g$ s.t. $0<= g<=f$，再取一个略小于 1 的数 $a:=1- epsilon$. 构造集合
  $
    E_n :=lr({ omega mid(|) f_n (omega) >= a g(omega) })
  $
  这个集合 $E_n$ 是指那些 $f_n$  的值已经“长得足够高”，至少达到了 $g$  的 $a$  倍的点 $omega$  的集合. 由于 $f_n$ 单调递增，因此这个集合也单调，即 $E_1 subset.eq E_2 subset.eq dots.h.c$. 因为 $f_n (omega) up f(omega)$ 且 $f(omega) >= g(omega)$，这个集合会不断扩大，直至整个 $g$ 的支撑集，也就是
  $
    union.big_(n=1)^(oo) E_n = lr({ omega mid(|) g(omega) > 0 })
  $
  从而，得到
  $
    integral f_n dif mu >= integral_(E_n) f_n dif mu
    >= a integral_(E_n) g dif mu
  $
  不等式两侧取极限得到
  $
    c >= a dot lim_(n -> oo) integral_(E_n) g dif mu = a dot integral g dif mu
  $
  因为 $g$ 是任取的，且 $a$ 可以任意接近 1，因此就有
  $
    c >= sup integral g dif mu = integral f dif mu
  $
  从而 $f_1$ 非负部分证完了。

  接下来，证明另一部分。

  我们构造函数列 $f_n ' = f_n - f_1$，则 $f_n ' >=0$ 且 $f_n ' up f':=f - f_1$，因此现在的 $f_n '$ 满足上面情况的所有条件，从而我们得到
  $
    integral f_n ' dif mu arrow.t integral f' dif mu <=>
    integral (f_n - f_1) dif mu arrow.t integral (f - f_1) dif mu
  $
  由于 $integral f_1 dif mu > -oo$ 利用积分的线性性，得到
  $
    integral f_n dif mu arrow.t integral f dif mu
  $
]

#theorem(title: [Fatou引理(Fatou's Lemma)])[
  若 $lr(( Omega, cal(F), mu ))$ 是一个测度空间， $lr({ f_i })_(i=1)^(oo)$ 是一族 $Omega -> RR$ 的*非负*可测函数. 则
  $
    integral liminf_(i -> oo) f_i dif mu <= liminf_(i -> oo) integral f_i dif mu
  $
]
#remark(title: [一个可能漏水的水桶])[

  - 想象 $integral f_i dif mu$  是一个桶在时刻 $i$  的总水量。 $f_i$  是水的分布。

  - $f_i$  不要求单调，你可以把水在桶里晃来晃去，甚至有些水会溅出来。

  - $liminf f_i$  是在晃动过程中，每个位置“最终”稳定留下的水位。

  - *Fatou 引理*说：最终桶里剩下的水量（左边），小于等于你每次测量水量的极限（右边）。

  - 为什么是不等式？因为在晃动的过程中（ $f_i$  不单调），可能有一部分“质量”（积分值）泄露掉了或“蒸发”了（数学上叫“跑到无穷远处”）。所以你最终看到的实体（ $liminf f_i$ ）的积分，可能会比积分的极限要小。
]
#proof[
  我们手里的工具是强大的*单调收敛定理(MCT)*，但它的使用条件很苛刻，要求函数序列是单调递增的。而 Fatou Í引理的 $lr({ f_i })$  序列不保证单调性。所以，证明的核心思想是：从不单调的 $lr({ f_i })$  出发，构造出一个相关的、新的、单调递增的序列 $lr({ g_j })$ ，然后对 $lr({ g_j })$  应用 MCT，最后再把结果和 $lr({ f_i })$  联系起来。

  我们先回顾 $liminf$ 的定义：
  $
    liminf_(i) f_i := sup_(j) inf_(i>=j) f_i
  $
  受到启发，我们定义新的函数列 $g_j$
  $
    g_j := inf lr({ f_i mid(|) i>=j})
  $
  也就是 $g_j$ 是原序列 $f_i$ 从第 $j$ 项开始的 “尾巴” 的下确界。由于所选取的集合越来越小，因此下确界是递增的，从而有 $g_1<=g_2<=dots.h.c$，这就意味着我们构造出了一个单调递增的序列。

  而根据 $liminf$ 的定义，这个单调递增序列 $lr({ g_j })$  的极限（也就是它的上确界 $sup g_j$ ）正好就是 $liminf f_i$ 。所以我们有：$g_j up liminf f_i$ 。因为 $f_i$ 都非负，所以 $g_j$ 也非负。应用 MCT，我们得到
  $
    lim_(j -> oo) integral g_j dif mu = integral liminf_(i -> oo) f_i dif mu
  $
  而这就是我们要证明的不等式的左边，接下来我们考虑右边。

  由于 $g_j$ 的定义 $g_j=inf lr({ f_i mid(|) i>=j })$，于是 $forall i>=j, f_i >= g_j$，利用积分的单调性有
  $
    forall i>=j, integral f_i dif mu >= integral g_j dif mu
  $
  既然 $integral g_j dif mu$ 比这里的每一项都要小，那么一定小于等于他们的下确界，从而有关键不等式
  $
    integral g_j dif mu <= inf_(i>=j) integral f_i dif mu
  $
  我们对上面这个不等式两边同时取 $j to oo$  的下极限 $liminf$
  $
    lim_(j to oo) integral g_j dif mu = liminf_(j to oo) integral g_j dif mu <=
    liminf_(j to oo) lr(( inf_(i>=j) integral f_i dif mu ))
  $
  由于 $g_j$ 是单调收敛的序列，因此下极限等于极限等于 $integral liminf_(i to oo) f_i dif mu$. 在这个不等式的右边，被取极限的部分正好符合 $liminf$ 的定义，因此就等于 $liminf integral f_j dif mu$，把两侧的分析结果带入，就得到了我们要证明的 Fatou 引理
  $
    integral liminf_(i -> oo) f_i dif mu <= liminf_(i -> oo) integral f_i dif mu
  $
]

#theorem(title: [控制收敛定理 (Dominated Convergence Theorem - DCT)])[
  若 $lr(( Omega, cal(F), mu ))$ 是一个测度空间， $lr({ f_i })_(i=1)^(oo)$ 是一族 $Omega -> RR$ 的可测函数， $g$ 是一个可积函数。 如果 $lr(| f_i |)<=g$ a.e. 且 $forall omega in Omega, f_i (omega) to f(omega)$ (逐点收敛)，则 $f$ 也是可积的，且积分和极限可交换，即
  $
    integral f_i dif mu to integral f dif mu <=> integral f dif mu = integral lim_(n -> oo) f_n dif mu = lim_(n -> oo) integral f_n dif mu
  $
]

#remark(title: [有盖子的桶])[
  - 这就像 *Fatou 引理*里那个可能漏水的桶，但现在我们给它加了一个坚固的盖子 ($g$)。

  - $f_i to f$  意味着桶里的水最终会形成一个稳定的形态 $f$ 。

  - $lr(| f_i |)<=g$  且 $integral g dif mu<oo$  这个“盖子”的作用是阻止任何水的泄露和蒸发。因为所有的水都被限制在一个总容量有限的空间里。

  - *DCT 定理*说：既然一滴水都没有损失，那么水量的极限，自然就等于极限形态下水的总量。
]
#proof[
  证明的核心思想是构造两条“单调的夹板”来挤压
  原始的序列 $lr({ f_i })$  本身不一定是单调的，所以我们不能直接用 MCT。因此，我们从 $lr({ f_i })$  出发，构造出两个新的、单调的函数序列，一个从下方逼近 $f$ ，一个从上方逼近 $f$ ，像两块夹板一样把 $f_i$  夹在中间。然后我们分别对这两条“单调的夹板”应用 MCT。

  我们定义两个辅助序列：
  1. 地板序列 $f_i^(and)$
    $
      f_i^(and) := inf lr({ f_j mid(|) j>=i })
    $
    这个序列是单调递增的，并且收敛到 $liminf f_i$。 因为 $f_i to f$，所以 $f_i^(and) up f$.
  2. 天花板序列 $f_i^(or)$
    $
      f_i^(or) := sup lr({ f_j mid(|) j>=i })
    $
    这个序列是单调递减的，并且收敛到 $limsup f_i$。 因为 $f_i to f$，所以 $f_i^(or) down f$.

  通过定义，我们得到
  #math.equation(
    $
      f_i^(and) <= f_i <= f_i^(or)
    $,
  )<eq-sandwitch>

  由于 $g$ 的存在保证了有限且可积，因此对于地板序列应用 MCT，我们得到
  $
    lim_(i -> oo) integral f_i^(and) dif mu = integral f dif mu
  $
  类似的，应用 MCT（递减版），我们得到
  $
    lim_(i -> oo) integral f_i^(or) dif mu = integral f dif mu
  $
  对 @eq-sandwitch 取积分，得到
  $
    integral f_i^(and) dif mu <= integral f_i dif mu <= integral f_i^(or) dif mu
  $
  再通过取极限，应用夹逼定理得到
  $
    lim_(i -> oo) integral f_i dif mu = integral f dif mu
  $
]


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
