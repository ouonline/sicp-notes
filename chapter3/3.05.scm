(define (estimate-integral p x1 y1 x2 y2 trials)
  (define (internal-p)
    (p (random-in-range x1 x2) (random-in-range y1 y2)))

  (monte-carlo trials internal-p))

(define (compute-pi trials experiment)
  (sqrt (/ 6 (estimate-integral experiment -1 -1 1 1 trials))))
