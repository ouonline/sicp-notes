(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (mul-interval x y)
  (let ((a1 (lower-bound x))
        (b1 (upper-bound x))
        (a2 (lower-bound y))
        (b2 (upper-bound y)))

    (cond ((and (> a1 0) (> b1 0) (> a2 0) (> b2 0))
           (make-interval (* a1 a2) (* b1 b2)))
          
          ((and (> a1 0) (> b1 0) (< a2 0) (> b2 0))
           (make-interval (* a2 b1) (* b1 b2)))
          
          ((and (> a1 0) (> b1 0) (< a2 0) (< a2 0))
           (make-interval (* b1 b2) (* a1 a2)))
          
          ((and (< a1 0) (> b1 0) (> a2 0) (> b2 0))
           (make-interval (* a1 b2) (* b1 b2)))
          
          ((and (< a1 0) (> b1 0) (< a2 0) (> b2 0))
           (make-interval (min (* a1 b2) (* b1 a2))
                          (max (* a1 a2) (* b1 b2))))
          
          ((and (< a1 0) (> b1 0) (< a2 0) (< b2 0))
           (make-interval (* b1 b2) (* a1 a2)))
          
          ((and (< a1 0) (< b1 0) (> a2 0) (> b2 0))
           (make-interval (* a1 b2) (* b1 a2)))
          
          ((and (< a1 0) (< b1 0) (< a2 0) (> b2 0))
           (make-interval (* a1 b2) (* a1 a2)))
          
          ((and (< a1 0) (< b1 0) (< a2 0) (< b2 0))
           (make-interval (* b1 b2) (* a1 a2))))))
