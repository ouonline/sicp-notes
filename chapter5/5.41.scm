(define (find-variable variable env)

  (define (find-variable-number frame)
    (define (iter-value variable-list count)
      (if (null? variable-list)
        'not-found
        (if (eq? variable (car variable-list))
          count
          (iter-value (cdr variable-list) (+ count 1)))))
    
    (iter-value frame 0))

  (define (iter-frame frame-list count)
    (if (null? frame-list)
      'not-found
      (let ((variable-number (find-variable-number (car frame-list))))
        (if (eq? variable-number 'not-found)
          (iter-frame (cdr frame-list) (+ count 1))
          (cons count variable-number)))))

  (iter-frame env 0))

; -----------------------------------------------------------------------------

(find-variable 'c '((y z) (a b c d e) (x y)))
(find-variable 'x '((y z) (a b c d e) (x y)))
(find-variable 'w '((y z) (a b c d e) (x y)))
