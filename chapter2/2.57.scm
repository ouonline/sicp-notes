(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? e n)
  (and (number? e) (= e n)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s)
  (if (null? (cdddr s))
    (caddr s)
    (append (list '+) (cddr s))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multipliend p)
  (if (null? (cdddr p))
    (caddr p)
    (append (list '*) (cddr p))))

; ----------------------------------------------------------

(define (deriv e v)
  (cond ((number? e) 0)
        ((variable? e)
         (if (same-variable? e v) 1 0))
        ((sum? e)
         (make-sum (deriv (addend e) v)
                   (deriv (augend e) v)))
        ((product? e)
         (make-sum (make-product (multiplier e)
                                 (deriv (multipliend e) v))
                   (make-product (deriv (multiplier e) v)
                                 (multipliend e))))
        (else
          (error "unknown expression type --DERIV" e))))

; ----------------------------------------------------------

(deriv '(* x y (+ x 3)) 'x)
