
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

[^1]: https://lamport.azurewebsites.net/video/videos.html
