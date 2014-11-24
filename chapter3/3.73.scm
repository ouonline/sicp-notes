(load "3.5.2-infinite-streams.scm")

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC resistance capacitance time-step)
  (lambda (currents initial-voltage)
    (add-streams (scale-stream currents resistance)
                 (integral (scale-stream currents (/ 1 capacitance))
                           initial-voltage
                           time-step))))
