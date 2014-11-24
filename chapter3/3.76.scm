(define (make-zero-crossings input-stream last-value)
  (define (smooth stream)
    (define (recur s l) ; s => input-stream, l => last-value
      (let ((avpt (/ (+ (stream-car s) l) 2)))
        (cons-stream avpt (smooth (stream-cdr s) (stream-car s)))))

    (recur stream last-value))

    (let ((avpt-list (smooth input-stream)))
      (stream-map sign-change-detector avpt-list (stream-cdr avpt-list))))

(define zero-crossings (make-zero-crossings sense-data 0))
