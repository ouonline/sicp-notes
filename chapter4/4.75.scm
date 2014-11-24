(define (uniquely-asserted query stream)
  (stream-flatmap
    (lambda (frame)
      (let ((result (qeval query (singleton-stream frame))))
        (if (and (not (null? (car result)))
                 (null? (cdr result)))
          the-empty-stream
          result)))
    stream))
