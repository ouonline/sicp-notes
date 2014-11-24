(load "3.5.3-exploiting-the-stream-paradigm.scm")

(define (stream-limit stream tolerance)
  (let ((first (stream-ref stream 0))
        (second (stream-ref stream 1)))
    (if (< (abs (- first second)) tolerance)
      second
      (stream-limit (stream-cdr stream) tolerance))))

; -------------------------------------------------------

(define (my-sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(my-sqrt 2 0.000001)
