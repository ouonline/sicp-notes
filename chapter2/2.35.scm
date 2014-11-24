(load "2.33.scm") ; accumulate

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                         (if (pair? x)
                           (count-leaves x)
                           1))
                       t)))

; -----------------------------------------------

(define x (list (list 1 2) (list 3 4)))
(count-leaves x)
