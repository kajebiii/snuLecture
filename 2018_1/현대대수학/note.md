

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



1) issomorphism(동형)

<R(실수), +>, <R+ (양의 실수), ·>

x -> a^x (some a > 0)

one to one


2)
U_n = {1, z, z^2, ..., z^{n-1}}
<U_n, ·> ~= <Z_n, +_n>

z^i -> i


phi(z^i · z^j) = phi(z^(i+j % n)) = i+j % n


3)
<Z, +>, <2Z, +>

Z -> 2Z
n -> 2n

one to one
phi(n+m) = phi(n) + phi(m)



How to know not issomrophism
(S, *) !~= (S', *')

assum <S, *> ~= <S', *'>
then " ... ..." holds
structure prop.



<Q, +>, <R, +>


|Q| = |Z| = א_0
|R> > א_0

1) <Z, ·> !~= <Z+, ·>

if) phi exists
x = 0 or 1 <=> x·x = x <=> phi(x) · phi(x) = phi(x) <=> phi(x) = 1

phi(0) = 1
phi(1) = 1

not one to one

contradiction. so, <Z, ·> !~= <Z+, ·>

2) <Z, +> !~= <Q, +>

|Z|=|Q|

if) phi exists
x is None <=> x + x = 3 <=> phi(x) + phi(x) = phi(3) = c in Q
phi(v) = c/2 
v is None

contradiction. so, <Z, +> !~= <Q, +>



3) <R, ·> ~= <C, ·>
C = {a+bi|a,b in R}

|C| = |R|

x^2 = -1




????
(G, ·) : Group
G ~= G'

n = dim V < inf
V ~= F^n (F is R or C, i think?)

|G| = n
when n=4

Z_4, Z_2 x Z_2
???


=====

<G, *> : Group
<=>
0) * : binary operation (it might be)  (closure)
1) * is associative
2) exists e in G s.t a * e = a (= e * a) (some a in G)
e : identity
3) for all a in G, exists a' s.t. a*a' = e (= a'*a)
a' : inverse of a

()로 약화해도 됨 * 기준으로 방향 중요.



uniqueness of e, a'

if exists e, e'
e = e * e' = e'
contradiction

if exists a', a''
a' = a' * e = a' * (a * a'') = (a' * a) * a'' = e * a'' = a''
contradiction
