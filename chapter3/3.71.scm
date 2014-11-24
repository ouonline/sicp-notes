(load "3.70.scm")

(define (cube x) (* x x x))

(define (cube-sum pair)
  (+ (cube (car pair)) (cube (cadr pair))))

(define cube-sum-list
  (stream-map cube-sum
              (weighted-pairs integers integers cube-sum)))

(define (ramanujan s)
  (let ((first (stream-car s))
        (second (stream-car (stream-cdr s))))
    (if (= first second)
      (cons-stream first
                   (ramanujan (stream-cdr s)))
      (ramanujan (stream-cdr s)))))

; ------------------------------------------------------------

(display-stream-n (ramanujan cube-sum-list) 10)
