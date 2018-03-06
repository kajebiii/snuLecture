

> 2018-03-06

S : set
* : binary operation
* : S x S -> S
*((a, b)) = a * b

<S, *> (* : 적절한 조건)
Group(군), Ring(환), Field(체)

S=V (ex, vector space)
(V, +, ·)
· : F x V -> V (F = R or C)


Eg. binary operation
1) 
Z = set of integers 
(Z, +)

2) 
Z_n = {0, 1, ..., n-1} (when n : 양의정수)
(Z_n, +_n)

+_n => modulo n

3) 
<M_n(R), +>
<M_n(R), ·>

4)
R_2pi = [0, 2pi)
+_2pi 
<R_2pi, +_2pi>

5) 
U_n = {z in C | z^n = 1} (n-th root of unity
<U_n, ·> (because (ab)^n = a^n b^n = 1)

when z = 1(cos 2pi / n + i sin 2pi / n), z^n = 1,
U_n = {1, z, z^2, ..., z^{n-1}}

6)
u = {z in C | |z| = 1} (circle)
< u, ·>

Eg. not binary operation

1) <Z, />
2) <M(R), +> (M(R)은 모든 크기에 해당하는 행렬)



Def: <S, *>
commutative a*b = b*a
associative (a*b)*c = a*(b*c)


Commot(?)

|S| < inf

S = {a_1, a_2, ..., a_n}

table | a_1, ..., a_j, ..., a_n
a_1
a_2
...
a_i              a_i * a_j => 어떤 a_k
...
a_n


<S, *>, <S', *'>

phi : S -> S'
1) phi : one to one, onto.
2) phi(a * b)= phi(a) *' phi(b) (homomorphic property)

<=>

phi is issomorphism

S, S' 사이에 phi가 존재한다면 S ~= S' (isomorphism)
