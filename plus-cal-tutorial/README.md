## Overview

this folder contains my notes about the [PlusCal Tutorial](https://lamport.azurewebsites.net/tla/tutorial/intro.html) by Leslie Lamport.

## [Session 1](https://lamport.azurewebsites.net/tla/tutorial/session1.html)

> The `Evaluate Constant Expression� section�s evaluation failed. Attempted to check equality of integer 1 with non-integer: "a"

- [Why the index starts with 1](https://lamport.azurewebsites.net/tla/tutorial/ordinals.html)
- [Fear of Mathematics](https://lamport.azurewebsites.net/tla/tutorial/math-fear.html)

### Exercise 1

1. `{<<1>>,<<2,2>>,<<3,3,3>>,<<1,2>>,<<1,2,3>>}`
2. `{{"a","b"},{"a"},{"b"},{"a","b","c"}}` correct was `{{"a"},{"a","b"}}`
3. `("aa","bb","cc"}`
4. `{1}`
5. `TRUE`

### Exercise 2

1. `Goldbach == \A n \in Nat : \E m \in 0..n : n = 2 * m /\ n > 2 => \E x,y \in Nat : IsPrime(x) /\ IsPrime(y) /\ n = x + y`
2. if there is no element is `S` then the expression is not TRUE
3. It should evaluate to `TRUE`

## [Session 2](https://lamport.azurewebsites.net/tla/tutorial/session2.html)

- [Link to the PlusCal Manual](https://lamport.azurewebsites.net/tla/c-manual.pdf)

## [Session 3](https://lamport.azurewebsites.net/tla/tutorial/session3.html)

- Property Driven Development: decide what a program should do before thinking
  about the how
- [Why parenthesis are needed](https://lamport.azurewebsites.net/tla/tutorial/parens.html)
