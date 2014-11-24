(load "2.12.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; -------------------------------------------------------------

(define x (make-interval 1 1))
(define y (make-interval 3 5))

;(par1 x y)
(par2 x y)
