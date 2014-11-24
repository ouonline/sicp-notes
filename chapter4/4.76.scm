(define (conjoin conjuncts frame-stream)
  (define (recur first-frame-stream rest-frame-stream)
    (if (stream-null? rest-frame-stream)
      first-frame-stream
      (recur (join first-frame-stream (stream-car rest-frame-stream))
             (stream-cdr rest-frame-stream))))

  (if (empty-conjunction? conjuncts)
    frame-stream
    (let ((first (qeval (first-conjunct conjuncts) frame-stream))
          (rest (qeval (rest-conjncts conjuncts) frame-stream)))
      (recur first rest))))
