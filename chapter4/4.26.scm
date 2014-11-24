(define (unless->if expression)
  (let ((condition (cadr expression))
        (usual-value (caddr expression))
        (exception-value (cadddr expression)))
    (list 'if condition exception-value usual-value)))

; ----------------------------------------------------

(define str '(unless (= n 0) 1 0))
(unless->if str)
