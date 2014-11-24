(define (filter predicate sequence)
  (if (null? sequence)
    (list)
    (if (predicate (car sequence))
      (append (list (car sequence)) (filter predicate (cdr sequence)))
      (filter predicate (cdr sequence)))))

; -----------------------------------------------------------------

(load "1.22.scm") ; prime?
(load "2.33.scm") ; accumulate

(define (enumerate-interval a b)
  (if (> a b)
    (list)
    (append (list a) (enumerate-interval (+ a 1) b))))

(define (unique-pairs n)
  (accumulate append
              (list)
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

; -----------------------------------------------------------------

(unique-pairs 5)
(prime-sum-pairs 5)
