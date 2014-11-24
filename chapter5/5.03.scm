; version 1: good-enough? and improve are both primitives
(controller
  test-good-enough
    (test (op good-enough?) (reg guess))
    (branch (label sqrt-done))
    (assign guess (op improve) (reg guess))
    (goto (label test-good-enough))
  sqrt-done)

; version 2
(controller
  test-good-enough
    ; good-enough?
    (assign t (op square) (reg guess))
    (assign t (op -) (reg t) (reg x))
    (assign t (op abs) (reg t))
    (test (op <) (reg t) (const 0.001))
    (branch (label sqrt-done))

    ; improve
    (assign t (op /) (reg x) (reg guess))
    (assign guess (op average) (reg guess) (reg t))

    (goto (label test-good-enough))
  sqrt-done)
