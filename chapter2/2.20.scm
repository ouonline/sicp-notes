(define (same-parity . l)
  (define (recur l remain)
    (if (null? l)
      (list)
      (if (= remain (remainder (car l) 2))
        (append (list (car l)) (recur (cdr l) remain))
        (recur (cdr l) remain))))

  (if (null? l)
     (list)
     (recur l (remainder (car l) 2))))

; ----------------------------------------------------

(same-parity 1 2 3 4 5 6 7)
