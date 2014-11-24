(load "../chapter3/3.5.4-streams-and-delayed-evaluation.scm")

(define (solve-2 f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    (let ((a (integral (delay dy) y0 dt))
          (b (stream-map f y)))
      (set! y a)
      (set! dy b))
    y))

(define (solve-3 f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    (set! y (integral (delay dy) y0 dt))
    (set! dy (stream-map f y))
    y))

; ----------------------------------------------------------------

(stream-ref (solve-2 (lambda (y) y) 1 0.001) 1000)
(stream-ref (solve-3 (lambda (y) y) 1 0.001) 1000)
