(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

; -----------------------------------------------------------

(define (left-branch x)
  (car x))

(define (right-branch x)
  (car (cdr x)))

(define (branch-length x)
  (car x))

(define (branch-structure x)
  (car (cdr x)))

; -----------------------------------------------------------

(define (total-weight x)

  (define (mobile? m)
    (pair? m))

  (define (branch-weight b)
    (let ((tmp (branch-structure b)))
      (if (mobile? tmp)
        (mobile-weight tmp)
        tmp)))

  (define (mobile-weight m)
    (+ (branch-weight (left-branch m))
       (branch-weight (right-branch m))))
  
  (mobile-weight x))

; -----------------------------------------------------------

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))

(total-weight b)
