(define (split op1 op2)
  (define (helper painter n)
    (if (= n 0)
      painter
      (let ((smaller (helper painter (- n 1))))
        (op1 painter (op2 smaller smaller)))))

  helper)
