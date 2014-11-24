(load "2.40.scm")

(define (flatmap proc seq)
  (accumulate append (list) (map proc seq)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (s-triples s)
  (filter (lambda (x)
            (= (accumulate + 0 x) s))
          (unique-triples s)))

; --------------------------------------------------------

(s-triples 11)
