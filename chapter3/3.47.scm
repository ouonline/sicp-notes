(define (make-semaphore n)
  (let ((count 0)
        (mutex (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (mutex 'acquire)
             (if (= count n)
               (begin (mutex 'release)
                      (the-semaphore 'acquire))
               (begin (set! count (+ count 1))
                      (mutex 'release))))
            ((eq? m 'release)
             (mutex 'acquire)
             (if (> count 0)
               (set! count (- count 1)))
             (mutex 'release))))

    the-semaphore))
