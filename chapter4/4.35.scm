(define (an-integer-between lower upper)
  (require (<= lower upper))
  (amb lower (an-integer-between (+ lower 1) upper)))
