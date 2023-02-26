# DD1351-Task-2
Checks if a proof is correctly written in natural deduction.

## Rules supported
- Premise
- Assumtion
- copy(X)
- andint(x,y)
- andel1(x)
- andel2(X)
- orint(1)
- orint(2)
- orel(x,y,u,v,w)
- imint(x,y)
- impel(x,y)
- negint(x,y)
- negel(x,y)
- contel(x)

## Example
[imp(p,q), or(neg(p),q)].
> Premises.

or(neg(p),q).
> Result.

[
  [1, imp(p,q),  	premise],
  [2, or(neg(p), p), lem],
  [
	[3, neg(p), assumption],
	[4, or(neg(p),q), orint1(3)]
  ],
  [
	[5, p, assumption],
	[6, q, impel(5,1)],
	[7, or(neg(p),q), orint2(6)]
  ],
  [8, or(neg(p),q), orel(2,3,4,5,7)]
].
> Proof (which is true in this case).
