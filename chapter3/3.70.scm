(load "3.5.3-exploiting-the-stream-paradigm.scm")

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
          (let ((s1car (stream-car s1))
                (s2car (stream-car s2)))
            (cond ((< (weight s1car) (weight s2car))
                   (cons-stream
                     s1car
                     (merge-weighted (stream-cdr s1) s2 weight)))
                  (else
                    (cons-stream
                      s2car
                      (merge-weighted s1 (stream-cdr s2) weight))))))))

(define (weighted-pairs s t weight)
  (cons-stream (list (stream-car s) (stream-car t))
               (merge-weighted (stream-map (lambda (x)
                                             (list (stream-car s) x))
                                           (stream-cdr t))
                               (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
                               weight)))

; ------------------------------------------------------------

(weighted-pairs integers integers
                (lambda (x)
                  (+ (car x) (cadr x))))

(define not235
  (stream-filter (lambda (x)
                   (and (not (= 0 (remainder x 2)))
                        (not (= 0 (remainder x 3)))
                        (not (= 0 (remainder x 5)))))
                 integers))

(weighted-pairs not235 not235
                (lambda (x)
                  (let ((i (car x))
                        (j (cadr x)))
                    (+ (* 2 i) (* 3 j) (* 5 i j)))))
