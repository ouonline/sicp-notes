(define (squarer a b)

  (define (process-new-value)
    (if (has-value? b)
      (if (< (get-value b) 0)
        (map display (list "square less than 0: SQUARER" (get-value b) "\n"))
        (set-value! a (sqrt (get-value b)) me))
      (set-value! b (* (get-value a) (get-value a)) me)))

  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))

  (define (me request)
    (cond ((eq? request 'I-have-a-value)
           (process-new-value))
          ((eq? request 'I-lost-my-value)
           (process-forget-value))
          (else (map display (list "Unknown request: MULTIPLIER" request "\n")))))

  (connect a me)
  (connect b me)

  me)

; -------------------------------------------------------------------------------------

(load "3.3.5-propagation-of-constraints.scm")

(define a (make-connector))
(define b (make-connector))

(probe "a" a)
(probe "b" b)

(set-value! b 25 'ou)
(squarer a b)
