ev-cond
    (save env)
    (save continue)
    (assign unev (op cond-clauses) (reg exp))

ev-cond-loop
    (test (op null?) (reg unev))
    (branch (label ev-cond-unset)) ; predicates are false

    (assign exp (op cond-first-clause-predicate) (reg unev))

    (test (op cond-else-predicate?) (reg exp)) ; else clause is always true
    (branch ev-cond-actions)

    (save unev)
    (save env) ; save env for ev-cond-decide

    (assign continue (label ev-cond-decide))
    (goto (label eval-dispatch))

ev-cond-decide
    (restore env) ; current env
    (restore unev)

    (test (op true?) (reg val))
    (branch ev-cond-actions)

    (assign unev (op cond-rest-clauses) (reg unev))
    (save unev)

    (goto (label ev-cond-loop)) ; next clause

ev-cond-actions
    (assign unev (op cond-first-clause-action) (reg unev))
    (save unev)
    (goto (label ev-sequence))

ev-cond-unset
    (assign val '*unset*)
    (restore env)
    (restore continue)
    (goto (reg continue))
