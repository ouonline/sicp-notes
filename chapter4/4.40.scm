(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5)))
    (if (not (= baker 5))
      (let ((cooper (amb 1 2 3 4 5)))
        (if (not (= cooper 1))
          (let ((fletcher (amb 1 2 3 4 5)))
            (if (and (not (= fletcher 1))
                     (not (= fletcher 5)))
              (let ((miller (amb 1 2 3 4 5)))
                (if (> miller cooper)
                  (let ((smith (amb 1 2 3 4 5)))
                    (if (and (distinct? (list baker cooper fletcher miller smith))
                             (= (abs (- smith fletcher)) 1)
                             (= (abs (- fletcher cooper)) 1))
                      (display "ok\n"))))))))))))
