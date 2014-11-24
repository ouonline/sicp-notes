(load "5.5-compilation.scm")

(compile
  '(define (factorial n)
     (define (iter product counter)
       (if (> counter n)
         product
         (iter (* counter product)
               (+ counter 1))))
     (iter 1 1))
  'val
  'next)
