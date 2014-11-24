(load "2.3.2-symbolic-differentiation.scm")

(define (make-exponentation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))

(define (exponentation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))
(define (exponent x) (caddr x))

; -----------------------------------------------------------------------

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
                   (make-product (deriv (multiplier e) v))))
        ((exponentation? e)
         (let ((b (base e))
               (ex (exponent e)))
           (make-product (make-product ex (make-exponentation b (- ex 1)))
                         (deriv b v))))
        (else
          (error "unknown expression type --DERIV" e))))

; -----------------------------------------------------------------------

(deriv '(** x 3) 'x)
