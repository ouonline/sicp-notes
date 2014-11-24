(load "3.70.scm")

(define (square x) (* x x))

(define (square-sum pair)
  (+ (square (car pair)) (square (cadr pair))))

(define square-sum-list
  (stream-map (lambda (x)
                (append (list (square-sum x)) x)) ; 第一个是平方和，后面是pair
              (weighted-pairs integers integers square-sum)))

(define (square-3 s)
  (let ((first (stream-car s))
        (second (stream-car (stream-cdr s)))
        (third (stream-car (stream-cdr (stream-cdr s)))))
    (if (and (= (car first) (car second))
             (= (car first) (car third)))
      (cons-stream (list first second third)
                   (square-3 (stream-cdr s)))
      (square-3 (stream-cdr s)))))

; ------------------------------------------------------------

(display-stream-n (square-3 square-sum-list) 10)
