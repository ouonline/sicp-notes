(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (password-error amount)
    (begin (display "Incorrect password\n")))

  (define (method-error amount)
    (map display (list "Unknown request -- MAKE-ACCOUNT: " m)))

  (define (dispatch p m)
    (cond ((not (eq? p password)) password-error)
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else method-error)))

  dispatch)

; ------------------------------------------------------------

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
