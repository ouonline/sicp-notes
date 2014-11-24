(define (estimate-integral p x1 y1 x2 y2)
  (define internal-p-stream
    (cons-stream (p (random-in-range x1 x2) (random-in-range y1 y2))
                 internal-p-stream))

  (monte-carlo internal-p-stream 0 0))
