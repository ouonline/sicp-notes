(load "3.50.scm")
(load "3.5.4-streams-and-delayed-evaluation.scm")

(define(general-solve-2nd f y0 dy0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (my-stream-map f dy y))
  y)
