
going through the video lessons[^1]

## [Lecture 3](https://lamport.azurewebsites.net/video/video3.html)

- [CheatSheet](https://lamport.azurewebsites.net/tla/summary-standalone.pdf)
- I am not sure how to organize the git repository with bigger models

## [Lecture 4](https://lamport.azurewebsites.net/video/video4.html)

- Next step formula oftentimes or combination of requirements for different steps
- Inequality can be written as `/=` or as `#`
- general rule: use primed vars only in `v' = ..` and `v' \in ...`

## [Lecture 5](https://lamport.azurewebsites.net/video/video5.html)

- The spec should define the "what" not the "how"
  - minister is an example of "how"
  - find more examples
- negation is written as `~`
- `\A` and `\E` exdend as far as possible
- this video also explains the different kinds of comments

## [Lecture 6](https://lamport.azurewebsites.net/video/video6.html)

- the term  `UNCHANGED <<...>>` can be used to declare a set of variables as
  unchaged in a step
- write down definitions

```tla
\* allows steps where TM sends Commit messages to the RMs and sets tmState to "done"
TMCommit == /\ tmPrepared = RM
            /\ tmState = "init" \* forgot this prerequisite
            /\ tmState' = "done"
            /\ msgs' = msgs \cup {[type |-> "Commit"]} /* my test: [type: "Commit"]
            /\ UNCHANGED <<rmState, tmPrepared>> /* forgot this as well
TMAbort == /\ tmState = "init"
           /\ tmState' = "done"
           /\ msgs' = msgs \cup {[type |-> "Abort"]} /* same as before
            /\ UNCHANGED <<rmState, tmPrepared>> /* forgot this as well
RMPrepare(r) == /\ rmState[r] = "working"
                /\ rmState' = [rmState EXCEPT ![r] = "prepared"] /* forgot `rmState' =`
                /\ msgs' = msgs \cup {[type |-> "Prepared", rm |-> r]} /* forgot `{}`
                /\ UNCHANGED <<rmState, tmPrepared>> /* forgot this as well
RMChooseToAbort(r) == /\ rmState[r] = "working"
                      /\ rmState' = [rmState EXCEPT ![r] = "aborted" /* forgot `rmState' =`
                      /\ UNCHANGED <<rmState, tmPrepared, msgs>> /* forgot this as well
RMRcvCommitMsg(r) == /* unneeded `/\ rmState[r] = "prepared"`
                     /\ [type |-> "Commit"] \in msgs
                     /\ rmState' = [rmState EXCEPT ![r] = "committed"] /* rmState[r] = "committed"
                     /\ UNCHANGED <<rmState, tmPrepared, msgs>> /* forgot this as well
RMRcvAbortMsg(r) == /* unneeded /\ \/ rmState[r] = "prepared"
                    /*             \/ rmState[r] = "working"
                    /\ [type |-> "Abort"] \in msgs
                    /\ rmState' = [rmState EXCEPT ![r] = "aborted"] /* rmState[r] = "aborted"
                    /\ UNCHANGED <<rmState, tmPrepared, msgs>> /* forgot this as well
```

## [Lecture 7](https://lamport.azurewebsites.net/video/video7.html)

- [Link to paxos paper](https://lamport.azurewebsites.net/video/consensus-on-transaction-commit.pdf)
- in this case Acceptor and RM are symmetry sets of model values, because
  exchanging two values in the set leaves expressions unchanged.
  - `{{a1,a2},{a1,a3,},{a2,a3}} = {{a3,a2},{a3,a1,},{a2,a1}}`
- Elements of a symmetry set may not appear in a `CHOOSE` expression

## [Lecture 8 a](https://lamport.azurewebsites.net/video/video8a.html)

> In speech, implication asserts causality. In math, implication asserts only correlation

- state expressions and action expressions
- temporal formulas

## [Lecture 8 b](https://lamport.azurewebsites.net/video/video8b.html)

- `[TCNext]_rmState == TCNext \/ UNCHANGED <<rmState>>`
- stuttering is when all states stay unchanged

> Our specs allow a system to stop at any time _[ with infinite many stuttering steps ]_.
> They specify what the system **may** do.
> They don't specify what the system **must do.

## [Lecture 9 a](https://lamport.azurewebsites.net/video/video9a.html)

- using example alternating bit protocol
- finite sequences: `<<-3, "xyz", {0,2}>>[1] = -3`
- Sequences module defines useful functions
- `\o` is concatenation
- `\X` is cartesian product
- may: safety formula
  - not satisfying Init in the first step 
  - or at a step not satisfying $[Next]_vars$
- must: liveness formula
  - cannot violate at any point: the rest of the behavior can always make it true
  - asserted by `<>` (pronounced eventually)
  - `(AVar = <<"hi",0>>) ~> (BVar = <<"hi",0>>)` means a _leads to_ b
  - Ex.: `<>P = ~[]~P`
- Enabled: In ABSpec `A` is enabled iff `AVar = BVar /\ Data # {}`.
- `WF_vars(A)`: weak fairnes of `A` with `vars` being a tuple of all variables
  in the spec _(pronounced WF of A)_
- `SF_vars(A)`: strong fairnes of `A` with `vars` being a tuple of all variables
  in the spec _(pronounced SF of A)_
- Spec with liveness: `Init /\ [ ][Next]_vars /\ Fairness`
  - Fairness is a conjunction of weak and strong fairness formulas of subaction of Next.
- Ex.: The two formulas are equivalent

> `WF_vars(A)` asserts of a behavior:
> If `A /\ (vars' # vars)` ever remains continuously enabled, then
> `A /\ (vars'# vars)` step must eventually occur.

## [Lecture 9 b](https://lamport.azurewebsites.net/video/video9b.html)



[^1]: https://lamport.azurewebsites.net/video/videos.html
