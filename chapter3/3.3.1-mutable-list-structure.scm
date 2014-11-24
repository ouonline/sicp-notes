(define x '((a b) c d))
(define y '(e f))

(set-car! x y)
x

(define z (cons y (cdr x)))
z

(set-cdr! x y)
x
