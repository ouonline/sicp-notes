(define (self-evaluating? expression)
  (cond ((number? expression) #t)
        ((string? expression) #t)
        (else #f)))

; -----------------------------------------------------------------------------

(define (variable? expression) (symbol? expression))

; -----------------------------------------------------------------------------

(define (tagged-list? expression tag)
  (if (pair? expression)
    (eq? (car expression) tag)
    #f))

(define (quoted? expression) (tagged-list? expression 'quote))
(define (text-of-quotation expression) (cadr expression))

; -----------------------------------------------------------------------------

(define (assignment? expression) (tagged-list? expression 'set!))
(define (assignment-variable expression) (cadr expression))
(define (assignment-value expression) (caddr expression))

; -----------------------------------------------------------------------------

(define (lambda? expression) (tagged-list? expression 'lambda))
(define (lambda-parameters expression) (cadr expression))
(define (lambda-body expression) (cddr expression))

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))

; -----------------------------------------------------------------------------

(define (definition? expression)
  (tagged-list? expression 'define))

(define (definition-variable expression)
  (if (symbol? (cadr expression))
    (cadr expression)
    (caadr expression)))

(define (definition-value expression)
  (if (symbol? (cadr expression))
    (caddr expression)
    (make-lambda (cdadr expression) ; formal parameters
                 (cddr expression)))) ; body

; -----------------------------------------------------------------------------

(define (if? expression) (tagged-list? expression 'if))
(define (if-predicate expression) (cadr expression))
(define (if-consequent expression) (caddr expression))

(define (if-alternative expression)
  (if (not (null? (cdddr expression)))
    (cadddr expression)
    'false))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

; -----------------------------------------------------------------------------

(define (begin? expression) (tagged-list? expression 'begin))
(define (begin-actions expression) (cdr expression))
(define (last-exp? seq) (null? (cdr seq)))
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (make-begin seq) (cons 'begin seq))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))

; -----------------------------------------------------------------------------

(define (application? expression) (pair? expression))
(define (operator expression) (car expression))
(define (operands expression) (cdr expression))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

; -----------------------------------------------------------------------------

(define (cond? expression) (tagged-list? expression 'cond))

(define (cond-clauses expression) (cdr expression))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))

(define (expand-clauses clauses)
  (if (null? clauses)
    'false ; no else clause
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (if (cond-else-clause? first)
        (if (null? rest)
          (sequence->exp (cond-actions first))
          (display "ELSE clause isn't last: COND->IF\n"))
        (make-if (cond-predicate first)
                 (sequence->exp (cond-actions first))
                 (expand-clauses rest))))))

(define (cond->if expression) (expand-clauses (cond-clauses expression)))

; -----------------------------------------------------------------------------

(define (true? x)  (not (eq? x false)))
(define (false? x) (eq? x false))

(define (make-procedure parameters body env)
  (list 'procedure parameters body env))
(define (compound-procedure? p)
  (tagged-list? p 'procedure))
(define (procedure-parameters p) (cadr p))
(define (procedure-body p) (caddr p))
(define (procedure-environment p) (cadddr p))

(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environment '())

(define (make-frame variables values)
  (cons variables values))
(define (frame-variables frame) (car frame))
(define (frame-values frame) (cdr frame))
(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons var (car frame)))
  (set-cdr! frame (cons val (cdr frame)))
  )

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
    (cons (make-frame vars vals) base-env)
    (if (< (length vars) (length vals))
      (error "Too many arguments supplied" vars vals)
      (error "Too few arguments supplied" vars vals))))

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
      (error "Unbound variable" var)
      (let ((frame (first-frame env)))
        (scan (frame-variables frame)
              (frame-values frame)))))
  (env-loop env))

(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
      (error "Unbound variable: SET!" var)
      (let ((frame (first-frame env)))
        (scan (frame-variables frame)
              (frame-values frame)))))
  (env-loop env))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
             (add-binding-to-frame! var val frame))
            ((eq? var (car vars))
             (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame) (frame-values frame))))

; -----------------------------------------------------------------------------

(define (eval-if expression env)
  (if (true? (my-eval (if-predicate expression) env))
    (my-eval (if-consequent expression) env)
    (my-eval (if-alternative expression) env)))

(define (eval-sequence exps env)
  (cond ((last-exp? exps)
         (my-eval (first-exp exps) env))
        (else
          (my-eval (first-exp exps) env)
          (eval-sequence (rest-exps exps) env))))

(define (eval-assignment expression env)
  (set-variable-value! (assignment-variable expression)
                       (my-eval (assignment-value expression) env)
                       env)
  'ok)

(define (eval-definition expression env)
  (define-variable! (definition-variable expression)
                    (my-eval (definition-value expression) env)
                    env)
  'ok)

(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (cons (my-eval (first-operand exps) env)
          (list-of-values (rest-operands exps) env))))

(define (my-eval expression env)
  (cond
    ((self-evaluating? expression)
     expression)
    ((variable? expression)
     (lookup-variable-value expression env))
    ((quoted? expression)
     (text-of-quotation expression))
    ((assignment? expression)
     (eval-assignment expression env))
    ((definition? expression)
     (eval-definition expression env))
    ((if? expression)
     (eval-if expression env))
    ((lambda? expression)
     (make-procedure (lambda-parameters expression)
                     (lambda-body expression)
                     env))
    ((begin? expression)
     (eval-sequence (begin-actions expression) env))
    ((cond? expression)
     (my-eval (cond->if expression) env))
    ((application? expression)
     (my-apply (my-eval (operator expression) env)
               (list-of-values (operands expression) env)))
    (else (display "Unknown expression type: my-eval\n"))))

(define (my-apply procedure arguments)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure)
         (eval-sequence
           (procedure-body procedure)
           (extend-environment (procedure-parameters procedure)
                               arguments
                               (procedure-environment procedure))))
        (else
          (display "Unknown procedure type: my-apply\n"))))
