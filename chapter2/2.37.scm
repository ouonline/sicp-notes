(load "2.33.scm")
(load "2.36.scm")

(define (matrix-*-vector m v)
  (map (lambda (x) (accumulate + 0 (map * x v))) m))

(define (transpose m)
  (accumulate-n (lambda (x y) (append (list x) y))
                (list) m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x))
         m)))

; -----------------------------------------------------------------

(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define v (list 1 4 7))

(matrix-*-vector m v)
(transpose m)
(matrix-*-matrix m m)
