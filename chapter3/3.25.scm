(define (lookup key-list table)
  (if (null? key-list)
    table
    (let ((element (assoc (car key-list) (cdr table))))
      (if (null? element)
        '()
        (if (is-table? element)
          (lookup (cdr key-list) element)
          (if (null? (cdr key-list))
            element
            '()))))))

(define (insert! key-list value table)

  (define (create-keys-value-tree keys)
    (define (helper k)
      (if (null? (cdr k))
        (cons (car k) value)
        (cons (car k) (helper (cdr k)))))

    (helper keys))

  (define (helper keys current-table)
    (let ((element (assoc (car keys) (cdr current-table))))
      (if (null? element)
        (set-cdr! current-table
                  (cons (create-keys-value-tree keys)
                        (cdr current-table)))
        (set-cdr! element value))))

  (if (null? key-list)
    '()
    (helper key-list table)))
