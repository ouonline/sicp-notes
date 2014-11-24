(define (adjoin-set x set)

  (define (iter rest result)
    (if (null? rest)
      (append result (list x))
      (cond ((= x (car rest)) (append result rest))
            ((< x (car rest)) (append result (list x) rest))
            (else (iter (cdr rest) (append result (list (car rest))))))))

  (define (recur s)
    (if (null? s)
      (list x)
      (let ((first (car s)))
        (cond ((= x first) s)
              ((< x first) (append (list x) s))
              (else (append (list first) (recur (cdr s))))))))

  (iter set '()))

; ------------------------------------------------------------------------------

(adjoin-set 9 (list 1 3 5 7))
