(define (make-account balance password)
  (define try-times 0)

  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (password-error amount)
    (begin (display "Incorrect password\n")
           (set! try-times (+ try-times 1))
           (if (> try-times 7)
             (display "call the cops\n"))))

  (define (method-error amount)
    (map display (list "Unknown request -- MAKE-ACCOUNT: " m)))

  (define (dispatch p m)
    (cond ((not (eq? p password))
           password-error)
          ((eq? m 'withdraw)
           (begin (set! try-times 0)
                  withdraw))
          ((eq? m 'deposit)
           (begin (set! try-times 0)
                  deposit))
          (else method-error)))

  dispatch)

; ------------------------------------------------------------

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
