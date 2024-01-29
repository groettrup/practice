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
- [Why Seq?](https://lamport.azurewebsites.net/tla/tutorial/why-seq.html)

### Puzzle

- Writing the empty tuple: `<< >>, [{} -> {}], [1..0 -> -0..-1]`

## [Session 4](https://lamport.azurewebsites.net/tla/tutorial/session4.html)

- `with (id \in S) { body }` to introduce nondeterministic variable `id`
- Lamport uses a variable `b = (I \= {})` to see if the loop should run. This
  means that in the case that the loop is skipped if the tuple is empty.
- I have not did this which means my program does not ever terminate if i have
  the empty set
- why does `with (i \in {})` produce a deadlock in S4E1?
  - my idea: its body is not executed so the loop condition cannot change
  - correct: the program cannot find an item so the execution halts
    ([answer from lamport](https://lamport.azurewebsites.net/tla/tutorial/deadlock.html))

### Exercise 2

- my try: `{ n \in \N: \A p,q \in 2..n: n # p*g }`
- answer: Just use isPrime `{ n \in Int: IsPrime(n) }`

### Exercise 3

- my try: `{ <<p, q>>: p \in Int, q \in (..p) }`
- my try: `{t \in { <<p, q>>: p \in Int, q \in Int }: t[1] < t[2]}`
- [A Note on Parsing](https://lamport.azurewebsites.net/tla/tutorial/parsing.html)

### Exercise 4

- > Use UNION to write the set of all tuples of length at most 21 whose elements are "a", "b", or "c".
- my try: `UNION { t \in {?}: Len(t) <= 21 }`
- answer: `UNION {[1..i -> {"a","b","c"}] : i \in 0..21} `
  - `[1..i -> S]` is the set of all tuples of length `i` with elements in `S`

### Puzzle 1

- Define Intersect so that for any set `S` of sets, `Intersect(S)` is the intersection of the sets in `S`
- my try: `Intersect == UNION {x \subseteq UNION(S): \A s \in S: x \subseteq S }`
- answer: `Intersect(S) == UNION {v \in UNION(S): \A s \in S: v \in S }`

### Puzzle 2

- What does this set equal: `{(x \in S) : x \in S}`?
- my try: the set equals S, because for all `x` in S, the condition holds.
- answer: (x \in S) evaluates to `TRUE` so the result is `{TRUE}` except for the empty set where it is the empty set.

### Exercise 5

- What is this set: `(S \X T) \X U` ?
- my try: `{<<s,t,u>>: s \in S, t \in T, u \in U}`
- answer: `{<< <<s, t>>, u >> : s \in S, t \in T, u \in U}`

### Exercise 6

- How many ways can you write the set of all 1-tuples whose element is in the set `S` ?
- my try:
  1. `{ <<s>> : s \in S }`
  2. `S \X {}`
  3. `{ [1 -> s]: s \in S }`
- answer: 
  1. `[{1} -> S]`
  2. `{<<s>> : s \in S}`
