#import "mod.typ": *

= 随机变量及其分布

== 随机变量及其分布

#theorion-restate(filter: it => it.label == <def:random-variable>)

// 离散型随机变量
#definition(title: [离散型随机变量])[
  假如一个随机变量仅可能取有限个或者可列个值，则称该随机变量为*离散型随机变量*。
]<def:discrete-random-variable>

// 连续型随机变量
#definition(title: [连续型随机变量])[
  假如一个随机变量可能取某个区间内的任意值，则称该随机变量为*连续型随机变量*。
]<def:continuous-random-variable>

随机变量是从 $Omega -> RR$ 的一个可测函数，若 $cal(B)$ 是某些实数组成的集合，则 $Set(X in cal(B))$ 表示如下集合
$
  Set(X in cal(B)) = Set(omega in Omega, X(omega) in cal(B))
$

// 分布函数
#definition(title: [分布函数])[
  对于随机变量 $X$，对于任意 $-oo < x<oo$ 称
  $
    F(x) = P(X <= x)
  $
  为随机变量 $X$ 的*分布函数*。且称 $X$ 服从 $F(x)$，记作 $X tilde.op F(x)$
]<def:distribution-function>

#remark[
  从分布函数的定义可见，任何随机变量 $X$ 都能诱导出一个分布函数。
]

#property(title: [分布函数的性质])[
  对于任意随机变量 $X$，其分布函数 $F(x)$ 具有如下性质：
  + *单调性*： 对任意 $x_1 < x_2$，有 $F(x_1) <= F(x_2)$

  + *有界性*： $F(oo)=lim_(x to oo) F(x) = 1$， $F(-oo)=lim_(x to -oo) F(x) = 0$
  + *右连续性*： 对任意实数 $x_0$，有 $lim_(x to x_0^+) F(x) = F(x_0)$
]
#proof[
  对于右连续性，取任意实数 $x_0$，对于任意 $epsilon > 0$，令 $delta = epsilon$，当 $0 < x - x_0 < delta$ 时，有
  $|F(x) - F(x_0)| = |P(X <= x) - P(X <= x_0)| = P(x_0 < X <= x) <= P(X <= x_0 + delta) - P(X <= x_0) = F(x_0 + delta) - F(x_0) < epsilon$，因此 $lim_(x to x_0^+) F(x) = F(x_0)$。
]

// 分布列
#definition(title: [分布列])[
  对于离散型随机变量 $X$，设其可能取的值为 $x_1, x_2, ..., x_n, ...$，则称 $x$ 取 $x_i$ 的概率
  $
    p_i = p(x_i) = P(X = x_i)
  $
  为随机变量 $X$ 的*分布列* ，记作 $X tilde.op Set(p_i)$。
]<def:probability-mass-function>

#property(title: [分布列的性质])[
  + $p(x_i) >=0, i=1,2,dots.h.c$

  + $sum_(i=1)^oo p(x_i) = 1$
]

离散型随机变量的分布函数是有限级的阶梯函数。

对于连续型随机变量，由于单点集是零测集，因此我们引入概率密度函数。

// 概率密度函数
#definition(title: [概率密度函数])[
  设随机变量 $X$ 的分布函数为 $F(x)$，如果存在非负可积函数 $p(x)$，使得对于任意实数 $x$，都有
  $
    F(x) = integral_(-oo)^(x) p(t) dd(t)
  $
  则称 $p(x)$ 为随机变量 $X$ 的*概率密度函数*. 称 $X$ 为连续型随机变量，称 $F(x)$ 为连续型分布函数。
]<def:probability-density-function>

可以看出，在可导的点上有
$
  F'(x)=p(x)
$

#property(title: [概率密度函数的性质])[
  对于概率密度函数 $p(x)$，有如下性质：
  + $p(x) >= 0$

  + $integral_(-oo)^(oo) p(x) dd(x)=1$
]

#example(title: [均匀分布])[
  设随机变量 $X$ 在区间 $[a,b]$ 上服从均匀分布，记作 $X tilde.op U(a,b)$ ，则其概率密度函数为
  $
    p(x) = cases(
      display(frac(1, b-a))\, quad & a <= x <= b \
                               0\, & "else"
    )
  $
]

== 随机变量的数学期望

// 离散型随机变量的数学期望
#definition(title: [离散型随机变量的数学期望])[
  #v(0.5em)
  设离散型随机变量 $X$ 的分布列为 $Set(p_i)$，如果 $sum_(i=1)^(oo) abs(x_i) p(x_i) < oo$，则称
  $
    E(X) = sum_(i=1)^oo x_i p(x_i)
  $
  为随机变量 $X$ 的*数学期望*。
]<def:expectation-discrete>

以上定义中，要求级数绝对收敛的目的在于使数学期望唯一. 因为随机变量的取值可正可负，取值次序可先可后，由无穷级数的理论知道，如果此无穷级数绝对收敛，则可保证其和不受次序变动的影响. 由于有限项的和不受次序变动的影响，故取有限个可能值的随机变量的数学期望总是存在的.

// 连续型随机变量的数学期望
#definition(title: [连续型随机变量的数学期望])[
  #vv
  设连续型随机变量 $X$ 的概率密度函数为 $p(x)$，如果 $integral_(-oo)^(oo) abs(x) p(x) dd(x) < oo$，则称
  $
    E(X) = integral_(-oo)^(oo) x p(x) dd(x)
  $
  为随机变量 $X$ 的*数学期望*。
]<def:expectation-continuous>

// 基于测度论的定义
#definition(title: [数学期望])[
  设 $X$ 是定义在 $(Omega, Sigma, P)$ 上的随机变量，则称 Lesbegue 积分
  $
    E(X) = integral_(Omega) X dd(P)
  $
  为随机变量 $X$ 的*数学期望*。其中，概率测度为
  $
    P(x in A) = integral_(A) p(x) dd(x)
  $

]<def:expectation-measure-theory>

#remark[
  一般将期望记作 $mu=mu_(X)=E(X)$.
]

#theorem(title: [随机变量函数的期望])[
  若随机变量 $X$ 的分布用分布列 $Set(p_i)$ 或者 概率密度函数 $p(x)$ 表示，则 $X$ 的某一函数 $g(X)$ 的数学期望为
  $
    E(g(X))=cases(
             display(sum_i g(x_i) p(x_i))\, quad quad & "离散型随机变量" \
      display(integral_(-oo)^(oo) g(x) p(x) dd(x)) \, & "连续型随机变量"
    )
  $
  也就是
  $
    E(g(X))=integral_(Omega) g(X) dd(P)
  $
]

#property(title: [期望的性质])[
  + 对于常数 $c$，有 $E(c) = c$

  + 对于随机变量 $X$ 和常数 $c$，有 $E(c X) = c E(X)$

  + 对于随机变量 $X$ 和 $Y$，有 $E(X + Y) = E(X) + E(Y)$
]

== 随机变量的方差和标准差

// 方差
#definition(title: [方差])[
  若随机变量 $X^(2)$ 的数学期望 $E(X^(2) )$ 存在，则称
  $
    Var(X):=E[(X-mu)^(2)]
  $
  为随机变量 $X$ 的*方差*，其中 $mu=E(X)$。

]<def:variance>

// 标准差
#definition(title: [标准差])[
  随机变量 $X$ 的*标准差*定义为方差的正平方根，即
  $
    sigma = sigma(X) = sigma_(X) = sqrt(Var(X))
  $
]<def:standard-deviation>

方差与标准差之间的差别主要在量纲上，由于标准差与所讨论的随机变量、数学期望有相同的量纲，其加减 $E(X) plus.minus k sigma(X)$  是有意义的 ($k$ 为正实数），所以在实际中，人们比较乐意选用
标准差，但*标准差的计算必须通过方差*才能算得．

#remark[
  - 如果随机变量 $X$ 的数学期望存在，其方差不一定存在

  - 当 $X$ 的方差存在时，则 $E(X)$ 必定存在，其原因在于 $|X| <= X^2 + 1$ 总是成立的
]

#property(title: [方差的性质])[
  + $Var(X)= E(X^(2) )-E(X)^(2)$
  + 对于常数 $c$，有 $Var(c) = 0$

  + 对于随机变量 $X$ 和常数 $a,b$，有 $Var(a X + b) = a^(2) Var(X)$

  + 对于随机变量 $X$ 和 $Y$，若 $X$ 和 $Y$ 相互独立，则有 $Var(X + Y) = Var(X) + Var(Y)$
]
#proof[
  对第1条性质的证明如下
  $
    Var(X) & =E[(X-mu)^(2) ] \
           & =E(X^(2) - 2 mu X + mu^(2) ) \
           & =E(X^(2) ) - 2 mu E(X) + mu^(2) \
           & =E(X^(2) ) - mu^(2)
  $
]

#theorem(title: [Markov 不等式])[
  设随机变量 $X$ 的数学期望 $E(X)$ 存在，且 $X >= 0$，则对于任意 $a > 0$，有
  $
    P(X >= a) <= frac(E(X), a)
  $
]<thm:markov-inequality>
#proof[
  $
    E(X)=integral_(Omega) X dd(P) >= integral_(X>=a) X dd(P) >= integral_(X>=a) a dd(P) = a P(X >= a)
  $
]

#theorem(title: [Chebyshev 不等式])[
  设随机变量 $X$ 的数学期望 $E(X)$ 和方差 $Var(X)$ 存在，则对于任意 $epsilon > 0$，有
  $
    P(|X - mu| >= epsilon) <= frac(Var(X), epsilon^(2))
  $
  或
  $
    P(abs(X-mu)<epsilon) >= 1 - frac(Var(X), epsilon^(2))
  $
]<thm:chebyshev-inequality>
#proof[
  由 @thm:markov-inequality 得
  $
    P(abs(X-mu)>= epsilon) = P((X-mu)^(2) >= epsilon^(2) ) <= frac(E[(X-mu)^(2)], epsilon^(2)) = frac(Var(X), epsilon^(2))
  $
]

切比雪夫不等式给出大偏差发生概率的上界，这个上界与方差成正比，方差愈大上界也愈大

以下定理进一步说明了方差为0就意味着随机变量的取值几乎集中在一点上．

#theorem(title: [单点分布])[
  若随机变量 $X$ 的方差存在，则
  $
    Var(X)=0 <=> P(X = c) = 1 <=> X=c "a.e."
  $
]
#proof[
  充分性显然，必要性则由切比雪夫不等式得证．对于任意 $epsilon > 0$，有
  $
    P(|X - mu| >= epsilon) <= frac(Var(X), epsilon^(2)) = 0
  $
  因此 $P(|X - mu| < epsilon) = 1$，即 $X$ 在 $[mu - epsilon, mu + epsilon]$ 上几乎处处取值．由于 $epsilon$ 可任意小，故 $X=mu$ a.e.
]

== 常用离散分布
=== 二项分布
// 二项分布
#definition(title: [二项分布])[
  设随机变量 $X$ 表示在 $n$ 次独立重复的伯努利试验中成功的次数，且每次试验成功的概率为 $p$，则称 $X$ 服从参数为 $(n,p)$ 的*二项分布*，记作 $X tilde.op B(n,p)$，其分布列为
  $
    p(k) = P(X = k) = binom(n, k) p^(k) (1 - p)^(n - k), quad k = 0, 1, ..., n
  $
]<def:binomial-distribution>

// 二点分布
#definition(title: [二点分布])[
  $n=1$ 时的二项分布称为*二点分布* 或者 *伯努利分布*，记作 $X tilde.op B(1,p)$，其分布列为
  $
    p(x)=P(X=x)=p^(x)(1-p)^(1-x), quad x=0,1
  $
]<def:bernoulli-distribution>

假设样本空间只有 $A$ 和 $overline(A)$，由此形成伯努利试验。
$n$ 重伯努利试验由 $n$ 个相同的、相互独立的伯努利试验组成。若将第 $i$ 个伯努利试验中 $A$ 出现的次数记作 $X_i$ 由于 $n$ 重伯努利试验中，每个伯努利试验是相互独立的，因此 $X_i$ 互相独立，且均服从参数为 $(1,p)$ 的二点分布. 设 $X$ 表示 $n$ 重伯努利试验中 $A$ 出现的总次数，则有
$
  X=X_1 + X_2 +dots.h.c + X_n
$
就是 $n$ 重伯努利试验中出现的 $A$ 的总次数，服从二项分布 $B(n,p)$ 。

服从二项分布的随机变量总可分解为 $n$ 个独立同为二点分布的随机变量之和.

若 $X tilde.op B(n,p)$，则有
$
  E(X) & = sum_(k=0)^(n) k binom(n, k) p^(k) (1 - p)^(n - k) \
       & = n p sum_(k=1)^(n) binom(n-1, k-1) p^(k-1) (1 - p)^(n - k) \
       & = n p (p + 1 - p)^(n-1) = n p
$

其中的第二个等号是利用组合数的性质 $k binom(n, k) = n binom(n-1, k-1)$ 得到的，可以考虑在 $n$ 个人中选择 $k$ 个人组成小组，然后再选择一个组长。

// 原点矩
#definition(title: [原点矩])[
  设随机变量 $X$ 的第 $n$ 阶矩存在，则称
  $
    mu'_(n) = E(X^(n))
  $
  为随机变量 $X$ 的*第 $n$ 阶原点矩*。
]<def:raw-moment>

#definition(title: [中心矩])[
  设随机变量 $X$ 的第 $n$ 阶中心矩存在，则称
  $
    mu_(n) = E[(X - mu)^(n)]
  $
  为随机变量 $X$ 的*第 $n$ 阶中心矩*，其中 $mu = E(X)$。
]

#remark[
  记 $X^((r)):=X (X-1)(X-2) dots.h.c (X-r+1)$
]

// 阶乘矩
#definition(title: [阶乘矩])[
  设随机变量 $X$ 的第 $n$ 阶阶乘矩存在，则称
  $
    mu^((r)) = E[X^((r))]
  $
  为随机变量 $X$ 的*第 $n$ 阶阶乘矩*。
]<def:factorial-moment>

若 $X tilde.op B(n,p)$，考虑他的阶乘矩
$
  mu^((r)) & = E[X (X-1)(X-2) dots.h.c (X-r+1)] \
           & = sum_(k=0)^(n) k (k-1)(k-2) dots.h.c (k-r+1) binom(n, k) p^(k) (1 - p)^(n - k) \
           & = sum_(k=r)^(n) frac(k!, (k-r)!) dot frac(n!, k! (n-k)!) p^(k) (1 - p)^(n - k) \
           & = frac(n!, (n-r)!) p^(r) dot sum_(k=r)^(n) binom(n - r, k - r) p^(k - r) (1 - p)^(n - k) \
           & = frac(n!, (n-r)!) p^(r) (p + 1 - p)^(n - r) \
           & = n^((r)) p^(r)
$

从而 $E(X^(2) )= E[X(X-1)] + E(X) = n(n-1)p^2 + n p = n^2 p$。

于是，若 $X tilde.op B(n,p)$
$
  Var(X)= E(X^(2) ) - E(X)^(2) = n^2 p - (n p)^(2) = n p (1 - p)
$

#remark[
  阶乘矩是下降幂的形式，而原点矩是普通幂的形式，两者可以通过 Stirling 反演相互转换。
]

=== 泊松分布

#definition(title: [泊松分布])[
  设随机变量 $X$ 的分布列为
  $
    p(k) = P(X = k) = frac(lambda^(k) e^(-lambda), k!), quad k = 0, 1, 2, ...
  $
  则称 $X$ 服从参数为 $lambda$ 的*泊松分布*，记作 $X tilde.op P(lambda)$。
]
#remark[
  将 $e^(-lambda)$ 提出后，其余项是 $e^(x)$ 在 $x=lambda$ 处的 Taylor 展开。
]

若 $X tilde.op P(lambda)$，则
$
  E(X) = sum_(k=0)^(oo) k frac(lambda^(k) e^(-lambda), k!) = lambda e^(-lambda) sum_(k=1)^(oo) frac(lambda^(k-1), (k-1)!) = lambda e^(-lambda) e^(lambda) = lambda
$

考虑他的阶乘矩
$
  mu^((r)) & = E[X (X-1)(X-2) dots.h.c (X-r+1)] \
           & = sum_(k=0)^(oo) k (k-1)(k-2) dots.h.c (k-r+1) frac(lambda^(k) e^(-lambda), k!) \
           & = sum_(k=r)^(oo) frac(k!, (k-r)!) frac(lambda^(k) e^(-lambda), k!) \
           & = lambda^(r) e^(-lambda) sum_(k=r)^(oo) frac(lambda^(k - r), (k - r)!) \
           & = lambda^(r) e^(-lambda) e^(lambda) \
           & = lambda^(r)
$

因此，若 $X tilde.op P(lambda)$，则
$
  Var(X) = E(X^(2) ) - E(X)^(2) = lambda + lambda^(2) - lambda^(2) = lambda
$

#theorem(title: [泊松定理])[
  设随机变量 $X_n tilde.op B(n, p_n)$，且当 $n to oo$ 时，$n p_n to lambda$，则对于任意非负整数 $k$，有
  $
    lim_(n to oo) P(X_n = k) = frac(lambda^(k) e^(-lambda), k!)
  $
  即二项分布 $B(n, p_n)$ 在 $n to oo$ 且 $n p_n to lambda$ 时收敛到泊松分布 $P(lambda)$。
]
#proof[
  $
    lim_(n to oo) P(X_n = k) & = lim_(n to oo) binom(n, k) p_n^(k) (1 - p_n)^(n - k) \
    & = lim_(n to oo) frac(n!, k! (n-k)!) frac((n p_n)^(k), n^(k)) (1 - p_n)^(n) (1 - p_n)^(-k) \
    & = frac(lambda^(k), k!) lim_(n to oo) frac(n (n-1) dots.h.c (n - k + 1), n^(k)) dot lim_(n to oo) (1 - p_n)^(n) dot lim_(n to oo) (1 - p_n)^(-k) \
    & = frac(lambda^(k), k!) dot 1 dot e^(-lambda) dot 1 \
    & = frac(lambda^(k) e^(-lambda), k!)
  $
]

=== 超几何分布

#definition(title: [超几何分布])[
  设总体中有 $N$ 个个体，其中有 $M$ 个是某一特征的个体，从中不放回地随机抽取 $n$ 个个体，设随机变量 $X$ 表示所抽取的个体中具有该特征的个体数，则称 $X$ 服从参数为 $(N, M, n)$ 的*超几何分布*，记作 $X tilde.op H(N, M, n)$，其分布列为
  $
    p(k) = P(X = k) = frac(binom(M, k) binom(N - M, n - k), binom(N, n)), quad max(0, n - N + M) <= k <= min(n, M)
  $
]


=== 几何分布
#definition(title: [几何分布])[
  在成功概率为 $p$ 的伯努利试验中，得到一次成功所需要的试验次数 $X$ 服从参数为 $p$ 的*几何分布*，记作 $X tilde.op Ge(p)$，其分布列为
  $
    p(k) = P(X = k) = (1 - p)^(k - 1) p, quad k = 1, 2, ...
  $
]

若 $X tilde.op Ge(p)$，记 $q=1-p$，则
$
  E(X) & = sum_(k=1)^(oo) k (1 - p)^(k - 1) p
         = p sum_(k=1)^(oo) k q^(k - 1)
         = p dv(, q) (sum_(k=0)^(oo) q^(k)) \
       & = p dv(, q) (frac(1, 1 - q))
         = p frac(1, (1 - q)^(2))
         = frac(1, p)
$

#theorem(title: [几何分布的无记忆性])[
  设随机变量 $X tilde.op Ge(p)$，则对于任意正整数 $m, n$，有
  $
    P(X > m + n | X > m) = P(X > n)
  $
]
这个定理表明，在前 $m$ 次试验 $A$ 没有出现的情况下，在接下来的 $n$ 次试验中 $A$ 出现的概率与前 $m$ 次试验是否出现 $A$ 无关，只与 $n$ 有关，因此称几何分布具有*无记忆性*。

=== 负二项分布
#definition(title: [负二项分布])[
  在伯努利试验中，记事件 $A$ 发生的概率是 $p$，如果 $X$ 为事件 $A$ 第 $r$  次出现时的试验次数，则 $X$ 服从参数为 $(r, p)$ 的*负二项分布*，记作 $X tilde.op Nb(r, p)$，其分布列为
  $
    p(k) = P(X = k) = binom(k - 1, r - 1) (1 - p)^(k - r) p^(r), quad k = r, r + 1, ...
  $
]

#remark[
  当 $r=1$ 时，负二项分布即为几何分布。
]


== 常用连续分布
=== 正态分布
正态分布源于高斯在19世纪初研究天文学和大地测量学时对测量误差的思考。

高斯设定了几个他认为“理所当然”的公理来描述测量误差的概率分布。设 $mu$ 是一个物理量的“真值”，我们进行了 $n$ 次独立测量 $x_1, x_2, dots.h.c, x_n$。每次测量的误差为 $epsilon_i = x_i - mu$。我们想要找到误差的概率密度函数 $phi(epsilon)$。

高斯提出3个公理：
+ *对称性与最大值*： 误差的概率密度函数 $phi(epsilon)$ 关于 $epsilon=0$ 对称，并且在 $epsilon=0$ 处取得最大值。

+ *独立性*：每次测量是相互独立的。因此，观测到这一组特定误差的联合概率（似然）是它们各自概率的乘积：
  $
    L(epsilon_1, epsilon_2, dots.h.c, epsilon_n) = product_(i=1)^(n) phi(epsilon_i)
  $
+ *算数平均公理*：高斯假设，对于一组测量值，其*算术平均值* $overline(x) = frac(1, n) sum x_i$ 是真值 $mu$ 的“最可几估计值”（Maximum Likelihood Estimate）。

因此，我们的目标是找到一个概率密度函数 $phi(epsilon)$，使得对于任意 $n$ 和任意误差组 $epsilon_1, dots.h.c, epsilon_n$，当算术平均值 $overline(x) = mu$ 时，联合概率 $L(epsilon_1,epsilon_2, dots.h.c, epsilon_n)$ 取得最大值。

为了计算方便，我们最大化 $L$  的对数 $ln(L)$
$
  ln(L)= sum_(i=1)^(n) ln(phi(x_i - mu))
$
要找到最大值，我们对 $mu$ 求导并令其为0
$
  dv(, mu) ln(L) = -sum_(i=1)^(n) frac(phi'(x_i-mu), phi(x_i - mu)) = 0
  => sum_(i=1)^(n) frac(phi'(x_i - mu), phi(x_i - mu)) = 0
$

现在，我们代入高斯的关键公理（3）：这个等式在 $mu=overline(x)$  时必须成立
$
  sum_(i=1)^(n) frac(phi'(x_i - overline(x)), phi(x_i - overline(x))) = 0
$

定义函数 $g(z)=frac(phi'(z), phi(z))$，则上式变为
$
  sum_(i=1)^(n) g(x_i - overline(x)) = 0
$<eq1>

我们还需要一个已知的事实：算术平均值的定义。对于任何一组 $x_i$，其偏差之和恒为零：
$
  sum_(i=1)^(n) (x_i - overline(x)) = 0
$<eq2>

现在，我们有两个等式 @eq1 @eq2，他们必须对任意一组测量值 $x_i$ 成立。要使这两个和式同时为零，唯一的（最简单的）非平凡解是 $g(x_i - overline(x))$ 必须与 $x_i - overline(x)$ 成正比。

于是，我们得到
$
  g(z) = frac(phi'(z), phi(z)) =k z
$

解这个微分方程得到
$
  ln(phi) = frac(1, 2) k z^(2) + C => phi(z) = A exp(frac(1, 2) k z^(2))
$
现在，由于公理 (1)， $phi(z)$ 在 $z=0$ 处取得最大值，因此 $k$ 必须是一个负数。设 $k = -frac(1, sigma^(2))$，则
$
  phi(epsilon) = A exp(- frac(epsilon^(2), 2 sigma^(2)))
$

接下来就是进行归一化，即
$
  integral_(-oo)^(oo) A exp(- frac(epsilon^(2), 2 sigma^(2))) dd(epsilon) = 1 = A dot sqrt(2 pi) sigma
$

因此， $A = frac(1, sqrt(2 pi) sigma)$，最终得到
$
  phi(epsilon) = frac(1, sqrt(2 pi) sigma) exp(- frac(epsilon^(2), 2 sigma^(2)))
$

如果误差 $epsilon= x-mu$，那么测量值 $x$ 的概率密度函数就是将这个函数平移 $mu$ 个单位：
$
  p(x) = frac(1, sqrt(2 pi) sigma) exp(- frac((x - mu)^(2), 2 sigma^(2)))
$



// 正态分布
#definition(title: [正态分布])[
  设随机变量 $X$ 的概率密度函数为
  $ p(x) = frac(1, sqrt(2 pi) sigma) exp(- frac((x - mu)^(2), 2 sigma^(2))), quad -oo < x < oo $
  则称 $X$ 服从参数为 $(mu, sigma^(2))$ 的*正态分布*，记作 $X tilde.op N(mu, sigma^(2))$。

  #figure(
    caption: [PDF and CDF of Normal Distribution],
    kind: "pic",
    supplement: [Fig.],

    box(
      width: 80%,
      grid(
        columns: (1fr,) * 2,
        column-gutter: 1em,
        image("../pic/ch2/Normal_Distribution_PDF.svg"), image("../pic/ch2/Normal_Distribution_CDF.svg"),
      ),
    ),
  )
]



正态分布的 PDF 是一个钟形曲线，对称于 $x=mu$，在 $x=mu$ 处取得最大值 $frac(1, sqrt(2 pi) sigma)$，并且随着 $|x - mu|$ 的增大而迅速趋近于0。 $mu plus.minus sigma$ 是图像的拐点。

正态分布 $N(mu, sigma^(2))$ 的分布函数为
$
  F(x) = frac(1, sqrt(2 pi) sigma) integral_(-oo)^(x) exp(- frac((t - mu)^(2), 2 sigma^(2))) dd(t)
$

#definition(title: [标准正态分布])[
  称 $mu=0, sigma=1$ 的正态分布为*标准正态分布*，记作 $U tilde.op N(0, 1)$，其 PDF 和 CDF 分别为
  $
    phi(u) & = frac(1, sqrt(2 pi)) exp(- frac(u^(2), 2)) \
    Phi(u) & = frac(1, sqrt(2 pi)) integral_(-oo)^(u) exp(- frac(t^(2), 2)) dd(t)
  $
]

#property(title: [常用的计算])[
  + $Phi(-u) = 1 - Phi(u)$

  + $P(a < U <= b) = Phi(b) - Phi(a)$
  + $P(|U| <= u) = 2 Phi(u) - 1$
  + $P(U>u) = 1- Phi(u)$
]

#theorem(title: [标准化])[
  设随机变量 $X tilde.op N(mu, sigma^(2))$，则随机变量
  $U = frac(X - mu, sigma) tilde.op N(0, 1)$。
]
#proof[
  考虑分布函数，对于任意实数 $u$，有
  $
    P(U <= u) & = P(frac(X - mu, sigma) <= u) \
              & = P(X <= sigma u + mu)
                = F(sigma u + mu) \
              & = frac(1, sqrt(2 pi) sigma) integral_(-oo)^(sigma u + mu) exp(- frac((t - mu)^(2), 2 sigma^(2))) dd(t) \
              & = frac(1, sqrt(2 pi)) integral_(-oo)^(u) exp(- frac(s^(2), 2)) dd(s) \
              & = Phi(u)
  $
]

从而，对于 $X tilde.op N(mu,sigma^(2) )$将，有
$
  P(a<=x<=b) = P(frac(a - mu, sigma) <= frac(x-mu, sigma) <= frac(b - mu, sigma)) = Phi(frac(b - mu, sigma)) - Phi(frac(a - mu, sigma))
$


若 $X tilde.op N(mu, sigma^(2) )$，由于 $U = frac(X - mu, sigma) tilde.op N(0, 1)$，因此
$
  E(U) = frac(1, sqrt(2 pi)) integral_(-oo)^(oo) u exp(- frac(u^(2), 2)) dd(u) = 0
$
从而， $E(X)= E(U) sigma + mu = 0 dot sigma + mu = mu$ 。

同样的
$
  Var(U) & = frac(1, sqrt(2 pi)) integral_(-oo)^(oo) u^(2) exp(- frac(u^(2), 2)) dd(u) \
         & = frac(1, sqrt(2 pi)) dot 2 integral_(0)^(oo) u^(2) exp(- frac(u^(2), 2)) dd(u) \
         & = sqrt(frac(2, pi)) integral_(0)^(oo) 2t dot e^(-t) frac(1, sqrt(2t)) dd(t)
           = sqrt(frac(2, pi)) integral_(0)^(oo) sqrt(2t) dot e^(-t) dd(t) \
         & = sqrt(frac(2, pi)) dot sqrt(2) dot Gamma(frac(3, 2))
           = frac(2, sqrt(pi)) dot frac(sqrt(pi), 2)=1
$
从而， $Var(X) = Var(U) dot sigma^(2) = 1 dot sigma^(2) = sigma^(2)$ 。


#definition(title: [标准化])[
  对于任意随机变量 $X$，如果其数学期望和方差存在，则称
  $
    X^\* = frac(X-E(X), sqrt(Var(X)))
  $
  为 $X$ 的*标准化随机变量*，且有
  $
    E(X^\*) = 0, Var(X^\*) = 1
  $

]

#definition(title: [分位数])[
  设随机变量 $X$ 的分布函数为 $F(x)$，对于给定的 $0 < p < 1$，如果实数 $x_p$ 满足
  $
    F(x_p) = P(X <= x_p) = p
  $
  则称 $x_p$ 为随机变量 $X$ 的 *$p$-分位数*。

  #figure(
    kind: "pic",
    supplement: [Fig.],
    caption: [Illustration of quantiles],
    image("../pic/ch2/Quantile.svg", height: 30%),
  )
]

#remark[
  一般来说，如果 $X tilde.op F(x)$ 是连续型随机变量
  + 给定 $x$ 可以计算 $p=F(x)$，也就是 CDF

  + 给定 $p$ 可以计算 $x_p = F^(-1)(p)$，也就是 $p$-分位数

  这里的 $F^(-1)$ 实际上是
  $
    F^(-1)(p) := inf Set(x in RR, F(x)>=p)
  $
  $F^(-1)(p)$ 是所有满足“累积概率 $F(x)$ 至少达到 $p$ 的 $x$ 值中，最小的那个 $x$.
]

#example(title: [标准正态分布的 $p$-分位数])[
  若 r.v. $X tilde.op N(0,1)$，则对于 $0<p<1$， $u_p:=Phi^(-1)(p)$ 即为 $X$ 的 $p$-分位数。
]

#problem(title: [正态分布的 $p$-分位数])[
  若 $X tilde.op N(mu, sigma^(2) )$，则 $X$ 的 $p$-分位数为多少？
]
#solution[
  设 $X$ 的 $p$-分位数为 $x_p$，则
  $
    p = P(X <= x_p) = Phi(frac(x_p - mu, sigma))
  $
  因此
  $
    x_p = mu + sigma dot u_p=mu + sigma dot Phi^(-1)(p)
  $
]

设随机变量 $X tilde.op N(mu,sigma^(2) )$，则
$
  P(mu-k sigma <= X <= mu + k sigma)
  =P(abs(frac(X-mu, sigma)) <= k) = Phi(k) - Phi(-k) = 2 Phi(k) - 1
$
当 $k=1,2,3$ 时，分别有
$
      P(mu - sigma <= X <= mu + sigma) & = 2 Phi(1) - 1 approx 0.6826 \
  P(mu - 2 sigma <= X <= mu + 2 sigma) & = 2 Phi(2) - 1 approx 0.9545 \
  P(mu - 3 sigma <= X <= mu + 3 sigma) & = 2 Phi(3) - 1 approx 0.9973
$

=== 均匀分布

#definition(title: [均匀分布])[
  若随机变量 $X$ 的概率密度函数为
  $
    p(x) = cases(
      display(frac(1, b-a)) \, quad & a <= x <= b,
      0 \, & x < a or x > b
    )
  $
  则称 $X$ 服从参数为 $(a, b)$ 的*均匀分布*，记作 $X tilde.op U(a, b)$。
  #vv
  #figure(
    caption: [PDF and CDF of Uniform Distribution],
    kind: "pic",
    supplement: [Fig.],

    box(
      width: 80%,
      grid(
        columns: (1fr,) * 2,
        column-gutter: 1em,
        image("../pic/ch2/Uniform_Distribution_PDF_SVG.svg"), image("../pic/ch2/Uniform_cdf.svg"),
      ),
    ),
  )
]

$U(a,b)$ 的 CDF 为
$
  F(x)= cases(
    display(0) \, & x < a,
    display(frac(x - a, b - a)) \, & a <= x <= b,
    1 \, & x > b
  )
$

设 $X tilde.op U(a,b)$，则
$
  E(X) = integral_(a)^(b) frac(x, b-a) dd(x) = frac(a+b, 2)
$
又有
$
  E(X^(2) ) = integral_(a)^(b) frac(x^(2), b-a) dd(x) = frac(b^(3) - a^(3), 3(b-a)) = frac(a^(2) + a b + b^(2), 3)
$
因此
$
  Var(X) = E(X^(2) ) - E(X)^(2) = frac((b-a)^(2), 12)
$

=== 指数分布
#definition(title: [指数分布])[
  设随机变量 $X$ 的概率密度函数为
  $
    p(x) = cases(
      display(lambda e^(-lambda x)) \, & x >= 0,
      0 \, & x < 0
    )
  $
  则称 $X$ 服从参数为 $lambda$ 的*指数分布*，记作 $X tilde.op Exp(lambda)$。

  #figure(
    caption: [PDF and CDF of Exponential Distribution],
    kind: "pic",
    supplement: [Fig.],

    box(
      width: 80%,
      grid(
        columns: (1fr,) * 2,
        column-gutter: 1em,
        image("../pic/ch2/Exponential_distribution_pdf_-_public_domain.svg"),
        image("../pic/ch2/Exponential_distribution_cdf_-_public_domain.svg"),
      ),
    ),
  )
]

$Exp(lambda)$ 的 CDF 为
$
  F(x) = cases(
    display(0) \, & x < 0,
    display(1 - e^(-lambda x)) \, & x >= 0
  )
$

设 $X tilde.op Exp(lambda)$，则
$
  E(X) = integral_(0)^(oo) x lambda e^(-lambda x) dd(x) = integral_(0)^(oo) x dd((- e^(-lambda x) )) = frac(1, lambda)
$

考虑
$
  E(X^(2) ) = integral_(0)^(oo) x^(2) lambda e^(-lambda x) dd(x) = integral_(0)^(oo) x^(2) dd((- e^(-lambda x) )) = frac(2, lambda^(2))
$
从而
$
  Var(X) = E(X^(2) ) - E(X)^(2) = frac(2, lambda^(2)) - (frac(1, lambda) )^(2) = frac(1, lambda^(2))
$

#remark[
  对于指数分布 $Exp(lambda)$ 有时记 $theta := frac(1, lambda) = E(X)$.
]

#theorem(title: [指数分布的无记忆性])[
  设随机变量 $X tilde.op Exp(lambda)$，则对于任意 $s, t >= 0$，有
  $
    P(X > s + t | X > s) = P(X > t)
  $
]
#proof[
  $
    P(X > s + t | X > s) = frac(P(X > s + t), P(X > s))
    = frac(e^(-lambda (s + t)), e^(-lambda s))
    = e^(-lambda t) = P(X > t)
  $
]

=== 伽马分布
#definition(title: [$Gamma$ 函数])[
  设复数 $z$ 的实部 $Re(z) > 0$，则称函数
  $
    Gamma(z) = integral_(0)^(oo) t^(z-1) e^(-t) dd(t)
  $
  为 *$Gamma$-函数*。
  #figure(
    caption: [The $Gamma$  function along part of the real axis],
    kind: "pic",
    supplement: [Fig.],

    image("../pic/ch2/Gamma_plot.svg", width: 80%),
  )
]
#property(title: [Gamma函数的性质])[
  - $Gamma(z)=(z-1)!$

  - $Gamma(frac(1, 2)) = sqrt(pi)$
  - $Gamma(z+1) = z Gamma(z)$
]

// 伽马分布
#definition(title: [伽马分布])[
  若随机变量 $X$ 的概率密度函数为
  $
    p(x) = cases(
      display(frac(lambda^(alpha), Gamma(alpha))) x^(alpha - 1) e^(-lambda x) \, quad & x >= 0,
      0 \, & x < 0
    )
  $
  则称 $X$ 服从参数为 $(alpha, lambda)$ 的*伽马分布*，记作 $X tilde.op Gamma(alpha, lambda)$。

  #figure(
    caption: [PDF and CDF of $Gamma$-Distribution],
    kind: "pic",
    supplement: [Fig.],

    box(
      width: 80%,
      grid(
        columns: (1fr,) * 2,
        column-gutter: 1em,
        image("../pic/ch2/Gammapdf252.svg"), image("../pic/ch2/Gammacdf252.svg"),
      ),
    ),
  )
]

设 $X tilde.op Gamma(alpha, lambda)$，记 $theta = frac(1, lambda)$. 考虑 $X$ 的 $r$ 阶矩
$
  E(X^(r) ) &= integral_(0)^(oo) x^(r) frac(lambda^(alpha), Gamma(alpha)) x^(alpha - 1) e^(-lambda x) dd(x) \
  &= frac(lambda^(alpha), Gamma(alpha)) integral_(0)^(oo) x^(r + alpha - 1) e^(-lambda x) dd(x) \
  &= frac(lambda^(alpha), Gamma(alpha)) frac(1, lambda^(r + alpha)) integral_(0)^(oo) t^(r + alpha - 1) e^(-t) dd(t) \
  &= theta^(r) dot frac(Gamma(r + alpha), Gamma(alpha))
$

从而，
$
  E(X) = alpha theta, quad Var(X) = alpha theta^(2)
$

#example(title: [指数分布])[
  $alpha=1$ 时的伽马分布即为指数分布 $Exp(lambda)$，即 $Gamma(1, lambda) = Exp(lambda)$。
]

#definition(title: [$chi^(2)$ 分布 ])[
  #vv
  $alpha=frac(n, 2), lambda = frac(1, 2)$ 时的伽马分布称为 *$chi^(2)$ 分布*，记作 $X tilde.op chi^(2)(n)$，即
  $
    chi^(2) (n) tilde.op Gamma(frac(n, 2), frac(1, 2))
  $
  其概率密度函数为
  $
    p(x) = cases(
      display(frac(1, 2^(frac(n, 2)) Gamma(frac(n, 2)))) e^(-frac(x, 2)) x^(frac(n, 2) - 1) \, quad & x >= 0,
      0 \, & x < 0
    )
  $

  这里的 $n$ 称为 *自由度*，可以是正实数，但一般是正整数。
]

若 $X tilde.op chi^(2)(n)$，则
$
  E(X) = n, quad Var(X) = 2 n
$

=== 贝塔分布

#definition(title: [$Beta$ 函数])[
  设 $a,b in CC$ 且 $Re(a), Re(b) > 0$ ，则称函数
  $
    Beta(a, b) = integral_(0)^(1) x^(a-1) (1 - x)^(b-1) dd(x)
  $
  为 *$Beta$-函数*。

  #figure(
    caption: [Contour plot of $Beta$ function],
    kind: "pic",
    supplement: [Fig.],

    image("/pic/ch2/Beta_function.svg", width: 80%),
  )
]

#property(title: [Beta函数的性质])[
  - $Beta(a, b) = frac(Gamma(a) Gamma(b), Gamma(a + b))$

  - $Beta(a, b) = Beta(b, a)$
  - $Beta(a + 1, b) = frac(a, a+b) Beta(a, b)$
]
// 贝塔分布
#definition(title: [贝塔分布])[
  若随机变量 $X$ 的概率密度函数为
  $
    p(x) = cases(
      display(frac(1, Beta(alpha, beta))) x^(alpha - 1) (1 - x)^(beta - 1) \, quad & 0 <= x <= 1,
      0 \, & "otherwise"
    )
  $
  则称 $X$ 服从参数为 $(alpha, beta)$ 的*贝塔分布*，记作 $X tilde.op Beta(alpha, beta)$。

  #figure(
    caption: [PDF and CDF of $Beta$  Distribution],
    kind: "pic",
    supplement: [Fig.],

    box(
      width: 80%,
      grid(
        columns: (1fr,) * 2,
        column-gutter: 1em,
        image("../pic/ch2/Beta_distribution_pdf.svg"), image("../pic/ch2/Beta_distribution_cdf.svg"),
      ),
    ),
  )
]

设 $X tilde.op Beta(alpha, beta)$，则
$
  E(X) = frac(Gamma(alpha+beta), Gamma(alpha) Gamma(beta)) integral_(0)^(1) x^(alpha) (1 - x)^(beta - 1) dd(x)
  = frac(Gamma(alpha+beta), Gamma(alpha) Gamma(beta)) dot frac(Gamma(alpha + 1) Gamma(beta), Gamma(alpha + beta+1))
  = frac(alpha, alpha + beta)
$
又
$
  E(X^(2) ) & = frac(Gamma(alpha+beta), Gamma(alpha) Gamma(beta)) integral_(0)^(1) x^(alpha + 1) (1 - x)^(beta - 1) dd(x) \
  & = frac(Gamma(alpha+beta), Gamma(alpha) Gamma(beta)) dot frac(Gamma(alpha + 2) Gamma(beta), Gamma(alpha + beta+2)) \
  & = frac(alpha (alpha + 1), (alpha + beta)(alpha + beta + 1))
$

从而，
$
  Var(X) = E(X^(2) ) - E(X)^(2) = frac(alpha beta, (alpha + beta)^(2) (alpha + beta + 1))
$

=== 总结
我们将常见的概率分布和方差做一下总结

#let tcol = rgb("#061a87")
// #let tcol = rgb("#6f1304")
#show table.cell.where(y: 0): it => {
  // show math.equation:set text(font:"Fira Math")
  text(font: (en-font-sans, cn-font-sans), fill: tcol.darken(10%), strong(it))
}

#table(
  columns: (auto, auto, auto, auto),
  inset: 1em,
  align: center + horizon,
  stroke: 0.5pt + tcol.lighten(70%),
  table.vline(x: 0, stroke: none),
  table.vline(x: 4, stroke: none),
  fill: (x, y) => {
    if y == 0 { tcol.lighten(96%) }
  },
  table.header([分布], [PMF \/ PDF], [$E(X)$], [$Var(X)$]),
  [二点分布], $p_k = p^(k) (1-p)^(1-k) \ k=0,1$, $p$, $p(1-p)$,
  [二项分布 \ $b(n,p)$ ], $p_k = binom(n, k) p^(k) (1-p)^(n-k)\ k=0,1,...,n$, $n p$, $n p (1-p)$,
  [泊松分布 \ $P(lambda)$ ], $p_k = frac(lambda^(k) e^(-lambda), k!), k=0,1,2,...$, $lambda$, $lambda$,
  [超几何分布 \ $H(n,N,M)$ ],
  $p_k = frac(binom(M, k) binom(N-M, n-k), binom(N, n)) \ k=0,1,dots.h.c r, r=min {M,n}$,
  $frac(n M, N)$,
  $frac(n M (N-M)(N-n), N^(2) (N-1))$,
  [几何分布 \ $Ge(p)$ ], $p_k = (1-p)^(k-1) p\ k=1,2,dots.h.c$, $frac(1, p)$, $frac(1-p, p^(2))$,
  [负二项分布 \ $Nb(r, p)$ ],
  $p_k = binom(k-1, r-1) (1-p)^(k-r) p^(r)\ k=r,r+1,dots.h.c$,
  $frac(r, p)$,
  $frac(r(1-p), p^(2))$,
  [正态分布 \ $N(mu, sigma^(2) )$ ],
  $p(x) = frac(1, sqrt(2 pi) sigma) exp(- frac((x - mu)^(2), 2 sigma^(2)))\ -oo<x<oo$,
  $mu$,
  $sigma^(2)$,
  [均匀分布 \ $U(a,b)$ ], $p(x) = frac(1, b-a), a<=x<=b$, $frac(a+b, 2)$, $frac((b-a)^(2), 12)$,
  [指数分布 \ $Exp(lambda)$ ], $p(x) = lambda e^(-lambda x), x>=0$, $frac(1, lambda)$, $frac(1, lambda^(2))$,
  [伽马分布 \ $Gamma(lambda)$ ],
  $p(x) = frac(lambda^(alpha), Gamma(alpha)) x^(alpha-1) e^(-lambda x) , x>=0$,
  $alpha frac(1, lambda)$,
  $alpha frac(1, lambda^(2))$,
  [$chi^(2)$ 分布 \ $chi^(2) (n)$ ],
  $p(x) = frac(1, 2^(frac(n, 2)) Gamma(frac(n, 2))) e^(-frac(x, 2)) x^(frac(n, 2)-1)\ x>=0$,
  $n$,
  $2 n$,
  [贝塔分布 \ $Beta(alpha, beta)$ ],
  $p(x) = frac(1, Beta(alpha, beta)) x^(alpha-1) (1-x)^(beta-1)\ 0<=x<=1$,
  $frac(alpha, alpha+beta)$,
  $frac(alpha beta, (alpha+beta)^(2) (alpha+beta+1))$,
  [对数正态分布 \ $LN(mu, sigma^(2))$ ],
  $p(x) = frac(1, sqrt(2 pi) sigma x) e^(- frac((ln x - mu)^(2), 2 sigma^(2)))\ x>0$,
  $e^(mu + frac(1, 2) sigma^(2))$,
  $(e^(sigma^(2)) - 1) e^(2 mu + sigma^(2))$,
  [柯西分布 \ $Cau(mu, lambda)$ ], $p(x) = frac(1, pi) frac(lambda, lambda^(2) +(x-mu)^(2)) \ -oo<x<oo$, [DNE], [DNE],
  [韦布尔分布 \ $Wb(eta, m)$ ],
  $p(x) = F'(x) \ F(x) = 1-exp{-(frac(x, eta))^(m)}$,
  $eta Gamma(1 + frac(1, m))$,
  $eta^(2) [Gamma(1 + frac(2, m)) \ - Gamma^(2) (1 + frac(1, m))]$,
)

== 随机变量函数的分布
已知随机变量 $X$ 的分布，求随机变量函数 $Y = g(X)$ 的分布是概率论中的一个重要问题。

=== 离散随机变量函数的分布
设离散型随机变量 $X$ 的取值为 $x_1, x_2, dots$，且对应的概率为 $p_1, p_2, dots$。设 $Y = g(X)$，则 $Y$ 的取值为 $y_i = g(x_i)$，且对应的概率为 $p_i$。如果存在 $i != j$ 使得 $y_i = y_j$，则将这些 $y_i$ 合并，其对应的概率为这些 $p_i$ 之和。


=== 连续随机变量函数的分布
离散随机变量的函数一定是离散型随机变量，但是连续型随机变量的函数不一定是连续的。

当 $Y=g(X)$ 为离散型随机变量时，可以用离散随机变量函数的分布方法求解。

当 $Y=g(X)$ 为严格单调函数时，可以用以下定理求解。
#theorem(title: [连续随机变量函数的分布])[
  设连续型随机变量 $X$ 的概率密度函数为 $p_X (x)$， $Y = g(X)$。 若 $y=g(x)$ 严格单调，其反函数 $h(y)$ 有连续导函数，则 $Y=g(X)$ 的密度函数为
  $
    p_(Y) (y) = cases(
      p_(X) [h(y)] abs(h'(y)) \, quad & a<y<b,
      0 \, & "otherwise"
    )
  $
  其中， $a = min{g(-oo),g(oo)}, b = max{g(-oo),g(oo)}$.
]

#theorem(title: [正态变量的线性变换])[
  设 $X tilde.op N(mu, sigma^(2))$，若 $a!=0$，则 $Y=a X+b tilde.op N(a mu + b, a^(2) sigma^(2))$.
]

#definition(title: [对数正态分布])[
  若随机变量 $X$ 的对数 $ln(X)$ 服从参数为 $(mu, sigma^(2))$ 的正态分布，则称 $X$ 服从参数为 $(mu, sigma^(2))$ 的*对数正态分布*，记作 $X tilde.op LN(mu, sigma^(2))$。其概率密度函数为
  $
    p(x) = cases(
      display(frac(1, sqrt(2 pi) sigma x) exp{- frac((ln x - mu)^(2), 2 sigma^(2))}) \, & x > 0,
      0 \, & x <= 0
    )
  $


  #figure(
    caption: [PDF and CDF of Log-Normal Distribution],
    kind: "pic",
    supplement: [Fig.],

    box(
      width: 80%,
      grid(
        columns: (1fr,) * 2,
        column-gutter: 1em,
        image("../pic/ch2/PDF-log_normal_distributions.svg"), image("../pic/ch2/CDF-log_normal_distributions.svg"),
      ),
    ),
  )
]




















#pagebreak()
