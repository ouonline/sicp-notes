(define (make-rat-modified numer denom)
  (let ((gcd-result (gcd-terms (term-list numer) (term-list denom))))
    (make-rat (div numer (make-poly (variable numer) gcd-result))
              (div denom (make-poly (variable denom) gcd-result)))))
