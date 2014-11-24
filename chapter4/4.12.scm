(load "4.1-the.metacircular.evaluator.scm")

(define (scan var frame eq-procedure)
  (define (recur vars vals)
    (cond ((null? vars) #f)
          ((eq? var (car vars))
           (eq-procedure vars vals))
          (else (recur (cdr vars) (cdr vals)))))

  (recur (frame-variables frame) (frame-values frame)))

(define (env-loop var env eq-procedure)
  (if (eq? env the-empty-environment)
    #f
    (let ((result (scan var (first-frame env) eq-procedure)))
      (if (eq? result #f)
        (env-loop var (enclosing-environment env) eq-procedure)
        result))))

(define (lookup-variable-value2 var env)
  (env-loop var env (lambda (vars vals) (car vals))))

(define (set-variable-value! var val env)
  (env-loop var env (lambda (vars vals) (set-car! vals val))))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (if (eq? (scan var frame (lambda (vars vals) (set-car! vals val))) #f)
      (add-binding-to-frame! var val frame))))

; -------------------------------------------------------------------------

(define testenv (list (make-frame '(d e f) '(10 20 30)) (make-frame '(a b c d) '(1 2 3 4))))

(lookup-variable-value2 'f testenv)
testenv
(set-variable-value! 'f 101 testenv)
testenv
(define-variable! 'x '100 testenv)
testenv
