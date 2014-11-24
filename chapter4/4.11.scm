(define (make-frame variables values)
  (if (null? variables)
    '()
    (if (null? values)
      (append (list (list (car variables) #f))
              (make-frame (cdr variables) values))
      (append (list (list (car variables) (car values)))
              (make-frame (cdr variables) (cdr values))))))

(define (frame-variables frame)
  (map car frame))

(define (frame-values frame)
  (map cadr frame))

(define (add-binding-to-frame! var val frame)
  (let ((new-rest (map (lambda (x) x) frame)))
    (set-car! frame (list var val))
    (set-cdr! frame new-rest)))

; --------------------------------------------------------------

(make-frame (list 'a 'b 'c 'd) (list 1 2 3 4 5))
(make-frame (list 'a 'b 'c 'd) (list 1 2))

(define testframe (make-frame (list 'a 'b 'c 'd) (list 1 2 3 4 5)))

(frame-variables testframe)
(frame-values testframe)
(add-binding-to-frame! 'e 5 testframe)
(add-binding-to-frame! 'f 8 testframe)
