(define (get-record name file)
  ((get 'lookup (file-format file)) name (file-content file)))

(define (get-salary record)
  ((get 'salary (record-format record)) (record-content record)))

(define (find-employee-record name file-list)
  (if (null? file-list)
    '()
    (let ((record (get-record name (car file-list))))
      (if (null? record)
        (find-employee-record name (cdr file-list))
        (record)))))
