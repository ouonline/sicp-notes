(load "3.03.scm")

(define (make-joint account password new-password)
  (define (withdraw amount)
    ((account password 'withdraw) amount))

  (define (deposit amount)
    ((account password 'deposit) amount))

  (define (password-error amount)
    (begin (display "Incorrect password\n")))

  (define (method-error amount)
    (map display (list "Unknown request -- MAKE-JOINT " m)))

  (define (dispatch p m)
    (cond ((not (eq? p new-password)) password-error)
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else method-error)))

  dispatch)

; ------------------------------------------------------------

(define acc (make-account 100 'secret-password))

(define xxx (make-joint acc 'secret-password 'new))

((acc 'secret-password 'withdraw) 40)
((xxx 'new 'withdraw) 10)
