(define (contains-cycle? l)
  (define visited (list))

  (define (exist? e)
    (define (recur rest)
      (if (null? rest)
        #f
        (if (eq? e (car rest))
          #t
          (recur (cdr rest)))))

    (recur visited))

  (define (helper ll)

    (if (null? ll)
      #f
      (if (exist? (car ll))
        #t
        (begin
          (set! visited (cons (car ll) visited))
          (helper (cdr ll))))))

  (helper l))

; ----------------------------------------------------

(load "3.12.scm") ; (last-pair)
(define x '(a b c d e f g))
(set-cdr! (last-pair x) x)
(contains-cycle? x)
