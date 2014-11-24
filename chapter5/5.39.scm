(load "../chapter4/4.1-the.metacircular.evaluator.scm") ; frame and environment operations

(define (find-frame env frame-number)
  (define (iter e count)
    (if (null? e)
      *unassigned*
      (if (= count frame-number)
        (first-frame e)
        (iter (enclosing-environment e) (+ count 1)))))
  
  (iter env 0))

(define (lexical-address-lookup env address)
  (let ((frame-number (car address))
        (variable-number (cdr address)))

    (let ((frame (find-frame env frame-number)))
      (if (eq? frame *unassigned*)
        *unassigned*
        (let ((value-list (frame-values frame)))
          (if (< (length value-list) variable-number)
            *unassigned*
            (list-ref value-list variable-number)))))))

(define (lexical-address-set! env address value)
  (let ((frame-number (car address))
        (variable-number (cdr address)))

    (let ((frame (find-frame frame-number env)))
      (if (eq? frame *unassigned*)
        *unassigned*
        (let ((value-list (frame-values frame)))
          (if (< (length value-list) variable-number)
            *unassigned*
            (set! (list-ref value-list variable-number) value)))))))
