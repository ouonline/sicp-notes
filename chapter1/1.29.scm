(define (y f a k h)
  (f (+ a (* k h))))

(define (sum-helper f a k h)
  (cond ((= k 0) (f a))
        ((even? k) (+ (* 2 (y f a k h)) (sum-helper f a (- k 1) h)))
        (else (+ (* 4 (y f a k h)) (sum-helper f a (- k 1) h)))))

(define (sum f a h n)
  (if (= n 0)
    (f a)
    (+ (y f a n h)
       (sum-helper f a (- n 1) h))))

; n is even
(define (integral f a b n)
  (* (/ (/ (- b a) n) 3)
     (sum f a (/ (- b a) n) n)))

; --------------------------------------------------------------------

(define (cube x) (* x x x))

(integral cube 0.0 1.0 1000)
