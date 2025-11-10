#import "mod.typ": *
#show:show-utils

#let bX = $vb(X)$

= 多维随机变量及其分布

== 多维随机变量及其联合分布
#definition(title: [$n$ 维随机变量])[
  若 $X_1 (omega), dots.h.c, X_n (omega)$  是定义在同一个样本空间 $Omega = lr({omega})$ 上的 $n$ 个随机变量，则称
  $
    bX(omega) = vecrow(X_1(omega), dots.h.c, X_n(omega))
  $
  为 *$n$ 维随机变量*。
]

#definition(title: [联合分布函数])[
  对于 $n$ 个实数 $x_1, dots.h.c, x_n$， $n$ 个事件 $lr({X_1<=x_1}),dots.h.c, lr({X_n<=x_n})$ 同时发生的概率
  $
    F(x_1,dots.h.c, x_n) = P(X_1<=x_1, dots.h.c, X_n<=x_n)
  $
  称为 $n$ 维随机变量 $bX = vecrow(X_1, dots.h.c, X_n)$ 的 *联合分布函数*。
]

#property()[
  任意二维联合分布函数 $F(x,y)$ 有如下性质

  + *单调性*： $F(x,y)$ 对于 $x,y$ 都是单调的
    $
      x_1 <= x_2 => F(x_1,y) <= F(x_2,y),quad y_1 <= y_2 => F(x,y_1) <= F(x,y_2)
    $

  + *有界性*： $forall x, forall y, 0 <= F(x,y) <= 1$，且
    $
      F(-oo,y) = lim_(x -> -oo) F(x,y) = 0 \
      F(x,-oo) = lim_(y -> -oo) F(x,y) = 0 \
      F(+oo, +oo) = lim_(x,y -> oo) F(x,y)=1
    $
  + *右连续性*： $F(x,y)$ 对于 $x,y$ 都是右连续的，即
    $
      F(x+0,y)=F(x,y),quad F(x,y+0)=F(x,y)
    $
  + *非负性*： 对于任意 $a<b, c<d$，都有
    $
      P(a<X<=b, c<Y<=d) = F(b,d) - F(b,c) - F(a,d) + F(a,c) >= 0
    $

]


#definition(title: [联合分布列])[
  如果二维随机变量 $(X,Y)$ 只有有限个可取的 $(x_i, y_i)$，则称 $(X,Y)$ 为 *离散型二维随机变量*，称
  $
    p_(i j) = P(X=x_i, Y=y_j)
  $
  为其 *联合分布列*。
]
#property[
  联合分布列的基本性质:
  + 非负性： $p_(i j)>=0$

  + 正则性： $sum_(i=1)^(oo) sum_(j=1)^(oo) p_(i j)=1$
]

求二维离散随机变量的联合分布列，关键是写出二维随机变量可能取的数对及其发生的
概率.


#definition(title: [联合密度函数])[
  如果存在二元函数 $p(x,y)$ 使得二维随机变量 $(X,Y)$ 的联合分布函数 $F(x,y)$ 可表示为
  $
    F(x,y) = integral_(-oo)^x integral_(-oo)^y p(u,v) dd(v, u)
  $
  则称 $p(x,y)$ 为 $(X,Y)$ 的 *联合密度函数*，称 $(X,Y)$ 为 *连续型二维随机变量*。
]

在 $F(x,y)$ 偏导数存在的点上有
$
  p(x,y) = pdv(, x, y) F(x,y)
$

#property()[
  联合密度函数的基本性质:
  + 非负性： $p(x,y) >= 0$

  + 正则性： $integral_(-oo)^(+oo) integral_(-oo)^(+oo) p(x,y) dd(y, x) = 1$
]

若 $G$ 是平面上的一个区域，则有
$
  P((X,Y) in G) = iint_(G) p(x,y) dd(x, y)
$

=== 常见多维分布

#definition(title: [多项分布])[
  设随机变量 $X_1, dots.h.c, X_k$ 的联合分布列为
  $
    P(X_1=x_1, dots.h.c, X_k=x_k) =
    frac(n!, x_1! x_2! dots.h.c x_k!) p_1^(x_1) p_2^(x_2) dots.h.c p_k^(x_k)
  $
  其中 $x_1 + x_2 +dots.h.c + x_k = n$，$p_1 + p_2 +dots.h.c + p_k = 1$，则称 $(X_1, dots.h.c, X_k)$ 服从参数为 $(n, p_1, p_2, dots.h.c, p_k)$ 的*多项分布*，记为$(X_1, dots.h.c, X_k) tilde.op M (n, p_1, p_2, dots.h.c, p_k)$.
]
#remark[
  考虑自由度， $r$ 项分布其实是 $r-1$ 维随机变量的分布。
]

#definition(title: [多维均匀分布])[
  设 $D subset.eq RR^(n)$ 是一个有界区域，且他的度量为 $S_(D)$，若多维随机变量 $(X_1,dots.h.c,X_n)$ 的概率密度函数为
  $
    p(x_1,x_2,dots.h.c, x_n) =
    cases(
      display(frac(1, S_(D))) \, quad & (x_1, dots.h.c, x_n) in D,
      0 \, & "otherwise",
    )
  $
  则称 $(X_1,dots.h.c,X_n)$ 服从区域 $D$ 上的*多维均匀分布*，记为 $(X_1,dots.h.c,X_n) tilde.op U (D)$。
]

#definition(title: [二元正态分布])[
  设二维随机变量 $(X,Y)$ 的联合概率密度函数为
  #[
    #show math.equation.where(block: true): set text(size: 10pt)
    $
      p(x,y) =
      frac(1, 2 pi sigma_X sigma_Y sqrt(1-rho^2))
      exp(
        - frac(1, 2(1- rho^(2) ))
        [
          frac((x - mu_X)^(2), sigma_X^(2)) -
          frac(2 rho (x - mu_X)(y - mu_Y), sigma_X sigma_Y) +
          frac((y - mu_Y)^(2), sigma_Y^(2))
        ]
      )
    $
  ]

  其中 $-1 < rho < 1$，则称 $(X,Y)$ 服从参数为 $(mu_X, mu_Y, sigma_X^2, sigma_Y^2, rho)$ 的*二元正态分布*，记为 $(X,Y) tilde.op N_2 (mu_X, mu_Y, sigma_X^2, sigma_Y^2, rho)$。
]

#definition(title: [多元正态分布])[
  设 $n$ 维随机变量 $bX = vecrow(X_1, dots.h.c, X_n)$ 的联合概率密度函数为
  #show math.equation.where(block: true): set text(size: 10pt)
  $
    p(vb(x)) =
    frac(1, (2 pi)^(n \/ 2) mdet(Sigma)^(1 \/ 2))
    exp(- frac(1, 2) (vb(x) - vb(mu))^TT Sigma^(-1) (vb(x) - vb(mu)))
  $

  其中 $vb(mu)= vecrow(mu_1, dots.h.c, mu_n)$ 为均值向量， $Sigma$ 为协方差矩阵，则称 $bX$ 服从参数为 $(vb(mu), Sigma)$ 的*多元正态分布*，记为 $bX tilde.op N_n (vb(mu), Sigma)$。

  #figure(
    kind: "pic",
    supplement: [Fig.],
    caption: [Multivariate Normal Distribution Sample],
    image("../pic/ch3/Multivariate_normal_sample.svg", width: 32%),
  )
]

#problem(title:[Jacobian 还是 ...])[
  设 $X, Y$ 的联合密度函数为 
  $
  p(x,y) = cases(
    e^(-(x+y)) \, quad & x>0\, y>0 ,
    0\, &  "otherwise",
  )
  $
  求以下随机变量的密度函数：
  + $Z = (X+Y)\/ 2$

  + $Z = Y-X$  
]

== 边际分布与随机变量的独立性

#definition(title: [边际分布函数])[
  设二维随机变量 $(X,Y)$ 的联合分布函数为 $F(x,y)$，则称
  $
    F_X (x) = lim_(y -> +oo) F(x,y)
  $
  为 $X$ 的*边际分布函数*，称
  $
    F_Y (y) = lim_(x -> +oo) F(x,y)
  $
  为 $Y$ 的*边际分布函数*。
]

#definition(title: [边际分布列])[
  设二维离散随机变量 $(X,Y)$ 的联合分布列为 $p_(i j)$，则称
  $
    p_(i dot) = sum_(j=1)^(oo) p_(i j)
  $
  为 $X$ 的*边际分布列*，称
  $
    p_(dot j) = sum_(i=1)^(oo) p_(i j)
  $
  为 $Y$ 的*边际分布列*。
]

#definition(title: [边际密度函数])[
  设二维连续随机变量 $(X,Y)$ 的联合密度函数为 $p(x,y)$，则称
  $
    p_X (x) = integral_(-oo)^(+oo) p(x,y) dd(y)
  $
  为 $X$ 的*边际密度函数*，称
  $
    p_Y (y) = integral_(-oo)^(+oo) p(x,y) dd(x)
  $
  为 $Y$ 的*边际密度函数*。
]

#proposition[
  二维正态分布的边际分布是一维正态分布。若 $(X,Y) tilde.op N_2 (mu_X, mu_Y, sigma_X^2, sigma_Y^2, rho)$，则 $X tilde.op N (mu_X, sigma_X^2)$， $Y tilde.op N (mu_Y, sigma_Y^2)$。
]

#definition(title: [随机变量的独立性])[
  设 $n$ 维随机变量 $bX = vecrow(X_1, dots.h.c, X_n)$ 的联合分布函数为 $F(x_1, dots.h.c, x_n)$， $F_i (x_i)$ 为 $X_i$ 的边际分布函数。 若对于任意实数 $x_1, dots.h.c, x_n$，都有
  $
    F(x_1,x_2,dots.h.c, x_n) = product_(i=1)^(n) F_i (x_i)
  $
  则称随机变量 $X_1, dots.h.c, X_n$ *相互独立*。
]
#remark[
  $(X,Y)$ 独立， $p(x,y) = p_X (x) p_Y (y) = g(x) h(y)$，变量可分离（在概率论意义下，就是函数的支撑集一定是矩形区域，而定义域可以使用示性函数 $II (dot)$ 写进函数表达式）。
]

== 多维随机变量函数的分布
=== 多维离散随机变量函数的分布
按照离散随机变量的分布求解方法，列出所有可能取值及其概率，相同的值对应的概率合并即可。

#theorem(title: [泊松分布的可加性])[
  设随机变量 $X tilde.op P(lambda_1), Y tilde.op P(lambda_2)$，则 $X+Y tilde.op P(lambda_1 + lambda_2)$。
]
#proof[
  对任意 $k=0,1,2,dots.h.c$，有

  $
    P(X+Y=k) & =
               sum_(i=0)^k P(X=i, Y=k-i) =
               sum_(i=0)^k P(X=i) P(Y=k-i) \
             & = sum_(i=0)^k frac(lambda_1^(i) e^(-lambda_1), i!) frac(lambda_2^(k-i) e^(-lambda_2), (k-i)!)
               =sum_(i=0)^(k) frac(k!, i! (k-i)!) frac(lambda_1^(i) lambda_2^(k-i) e^(-(lambda_1 + lambda_2)), k!)
               = frac((lambda_1 + lambda_2)^(k) e^(-(lambda_1 + lambda_2)), k!)
  $
]
#remark[
  - 也可以说：泊松分布的卷积和也是泊松分布。
    $
      P(lambda_1) * P(lambda_2) = P(lambda_1 + lambda_2)
    $

  - 泊松分布可以看成是粒子在单位时间撞击板子的次数，若有两个独立的粒子流，其撞击次数分别服从参数为 $lambda_1$ 和 $lambda_2$ 的泊松分布，则总的撞击次数服从参数为 $lambda_1 + lambda_2$ 的泊松分布。
  #[
    #set align(center)
    #import "@preview/cetz:0.4.2"
    #cetz.canvas({
      import cetz.draw: *

      set-style(stroke: (thickness: 0.5pt))

      line((0, 0), (1, 0), name: "l1")
      line((1, 0), (3, 0), name: "l2")
      circle((0, 0), radius: 1.5pt, fill: black)
      circle((1, 0), radius: 1.5pt, fill: black)
      circle((3, 0), radius: 1.5pt, fill: black)

      content("l1.mid", anchor: "south", $ lambda_1 $, padding: 1pt)
      content("l2.mid", anchor: "south", $ lambda_2 $, padding: 1pt)

      line((.5, -1.5), (.5, -.2), mark: (end: ">", fill: black), name: "a1")
      line((2, -1.5), (2, -.2), mark: (end: ">", fill: black), name: "a2")

      content("a1", anchor: "east", $X$, padding: 1pt)
      content("a2", anchor: "west", $Y$, padding: 1pt)
    })
  ]
]

#theorem(title: [二项分布的可加性])[
  设随机变量 $X tilde.op b(n_1, p), Y tilde.op b(n_2, p)$，则 $X+Y tilde.op b(n_1 + n_2, p)$。
]
#remark[
  注意 $p$ 要求相同，可以考虑抛硬币的次数不同，但正面概率相同的情况。
]

=== 多维连续型随机变量函数的分布
求解多维连续型随机变量函数的分布，一般采用以下两种方法：
- *分布函数法*：先求出目标随机变量的分布函数，再对其求导数得到概率密度函数。

- *Jacobian 行列式变换法*：适用于目标随机变量是原随机变量的可逆函数的情况。

#theorem(title: [连续场合的卷积公式])[
  设 $X, Y$ 是相互独立的随机变量，密度函数分别为 $p_(X) (x), p_(Y) (y)$，则他们的和 $Z=X+Y$ 的概率密度函数为
  $
    p_(Z) (z) = integral_(-oo)^(+oo) p_(X) (x) p_(Y) (z - x) dd(x)
    = integral_(-oo)^(+oo) p_(X) (z - y) p_(Y) (y) dd(y)
  $
  即两个独立随机变量之和的密度函数，等于它们各自密度函数的卷积.
]

#remark[
  若 $X,Y$ 不独立，则变为联合密度即可
  $
    p_(Z) (z) = integral_(-oo)^(+oo) p(x, z - x) dd(x)
    = integral_(-oo)^(+oo) p(z - y, y) dd(y)
  $

]


#theorem(title: [正态分布的可加性])[
  设随机变量 $X tilde.op N(mu_1, sigma_1^2), Y tilde.op N(mu_2, sigma_2^2)$，且 $X,Y$ 相互独立，则 $X+Y tilde.op N(mu_1 + mu_2, sigma_1^2 + sigma_2^2)$。
]
#proof[
  设 $Z=X+Y$，则 $Z$ 的概率密度函数为
  $
    p_(Z) (z) & = integral_(-oo)^(+oo) p_(X) (x) p_(Y) (z - x) dd(x) \
              & = integral_(-oo)^(+oo)
                frac(1, sqrt(2 pi) sigma_1)
                exp(- frac((x - mu_1)^(2), 2 sigma_1^(2)))
                frac(1, sqrt(2 pi) sigma_2)
                exp(- frac((z - x - mu_2)^(2), 2 sigma_2^(2))) dd(x) \
              & = frac(1, 2 pi sigma_1 sigma_2)
                integral_(-oo)^(+oo)
                exp(
                  - [
                    frac((x - mu_1)^(2), 2 sigma_1^(2)) +
                    frac((z - x - mu_2)^(2), 2 sigma_2^(2))
                  ]
                ) dd(x)
  $

  对被积函数的指数部分进行配方，有
  $
    & frac((x - mu_1)^(2), 2 sigma_1^(2)) + frac((z - x - mu_2)^(2), 2 sigma_2^(2))
      = frac(sigma_1^2 + sigma_2^2, 2 sigma_1^2 sigma_2^2)
      [
        x - frac(mu_1 sigma_2^2 + (z - mu_2) sigma_1^2, sigma_1^2 + sigma_2^2)
      ]^(2)
      + frac((z - (mu_1 + mu_2))^(2), 2 (sigma_1^2 + sigma_2^2))
  $

  因此有
  $
    p_(Z) (z) & = frac(1, 2 pi sigma_1 sigma_2)
                exp(- frac((z - (mu_1 + mu_2))^(2), 2 (sigma_1^2 + sigma_2^2)))
                integral_(-oo)^(+oo)
                exp(
                  - frac(sigma_1^2 + sigma_2^2, 2 sigma_1^2 sigma_2^2)
                  [
                    x - frac(mu_1 sigma_2^2 + (z - mu_2) sigma_1^2, sigma_1^2 + sigma_2^2)
                  ]^(2)
                ) dd(x) \
              & = frac(1, 2 pi sigma_1 sigma_2)
                exp(- frac((z - (mu_1 + mu_2))^(2), 2 (sigma_1^2 + sigma_2^2)))
                sqrt(frac(2 pi sigma_1^2 sigma_2^2, sigma_1^2 + sigma_2^2))
                = frac(1, sqrt(2 pi) sqrt(sigma_1^2 + sigma_2^2))
                exp(- frac((z - (mu_1 + mu_2))^(2), 2 (sigma_1^2 + sigma_2^2)))
  $

]

从而有，对于相互独立的随机变量 $vb(X) = vecrow(X_1, dots.h.c, X_n) tilde.op N(vb(mu), Sigma)$ 和 $vb(A) = vecrow(a_1, a_2, dots.h.c, a_n)^(TT)$，有
$
  vb(A)^TT vb(X) tilde.op N(vb(A)^(TT) vb(mu), vb(A)^(TT) Sigma vb(A))
$

#theorem(title: [伽马分布的可加性])[
  设随机变量 $X tilde.op Gamma(alpha_1, lambda), Y tilde.op Gamma(alpha_2, lambda)$，且 $X,Y$ 相互独立，则$X+Y tilde.op Gamma(alpha_1 + alpha_2, lambda)$.

]
伽马分布有两个常用的特例：指数分布和卡方分布，
$
  Exp(lambda) = Gamma(1, lambda), quad chi^2 (k) = Gamma(frac(k, 2), frac(1, 2))
$

因此可以得到如下结论
#corollary(title: [指数分布的可加性])[
  设随机变量 $X tilde.op Exp(lambda), Y tilde.op Exp(lambda)$，且 $X,Y$ 相互独立，则$X+Y tilde.op Gamma(2, lambda)$.
]
#corollary(title: [卡方分布的可加性])[
  设随机变量 $X tilde.op chi^2 (k_1), Y tilde.op chi^2 (k_2)$，且 $X,Y$ 相互独立，则$X+Y tilde.op chi^2 (k_1 + k_2)$.
]

我们仅介绍寻求二维连续随机变量函数的分布的方法，因为 $n$ 维方法类似。

#problem(title:[看看卷积？])[
某种商品一周的需求数量是一个随机变量，其密度函数为

$
p_1(t) = cases(
  t e^(-t)  \, quad & t>0 ,
  0 \, &  t <=0,
)
$

设各周的需要量是相互独立的，试求
+ 两周需要量的密度函数 $p_2(x)$ 

+ 三周需要量的密度函数 $p_3(x)$
]

#theorem(title: [变量变换法])[
  设二维随机变量 $(X,Y)$ 的联合密度函数为 $p(x,y)$，如果函数
  $
    cases(u=u(x,y), v=v(x,y))
  $
  存在连续偏导数，且存在唯一反函数
  $
    cases(x=x(u,v), y=y(u,v))
  $
  则变换的 Jacobian 行列式为
  $
    abs(J) = abs(pdv((x,y), (u,v)))=jmat(x, y; u, v; big: #true, delim: "|")
    = abs(pdv((u,v), (x,y)))^(-1)
    = jmat(u, v; x, y; big: #true, delim: "|")^(-1)
    !=0
  $
  若随机变量 $U = u(X,Y), V=v(X,Y)$，则
  $
    p(u,v) = p(x(u,v), y(u,v)) abs(J)
  $]




















































































































































































































































#pagebreak()
