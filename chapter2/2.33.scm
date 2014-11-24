(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; -----------------------------------------------------------------------

(define (my-map p sequence)
  (accumulate (lambda (x y) (append (list x) y)) (list) sequence))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (my-length sequence)
  (accumulate (lambda (x y) (if (null? sequence)
                              0
                              (+ 1 y))) 0 sequence))

; -----------------------------------------------------------------------

(my-map + (list 1 2 3 4 5))
(my-length (list 1 3 4))
(my-append (list 1 2 3) (list 5 6 7))
