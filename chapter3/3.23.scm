(define (make-deque)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (empty-deque?)
      (null? front-ptr))

    (define (front-deque)
      (if (empty-deque?)
        '()
        (car front-ptr)))

    (define (rear-deque)
      (if (empty-deque?)
        '()
        (car rear-ptr)))

    (define (front-insert-deque! item)
      (let ((new-item (cons (cons item '()) '())))
        (cond ((empty-deque?)
               (set! front-ptr new-item)
               (set! rear-ptr new-item))
              (else
                (set-cdr! new-item front-ptr)
                (set-cdr! (car front-ptr) new-item)
                (set! front-ptr new-item)))))

    (define (rear-insert-deque! item)
      (let ((new-item (cons (cons item '()) '())))
        (cond ((empty-deque?)
               (set! front-ptr new-item)
               (set! rear-ptr new-item))
              (else
                (set-cdr! (car new-item) rear-ptr)
                (set-cdr! rear-ptr new-item)
                (set! rear-ptr new-item)))))

    (define (front-delete-deque!)
      (if (not (empty-deque?))
        (begin (set! front-ptr (cdr front-ptr))
               (set-cdr! (car front-ptr) '()))))

    (define (rear-delete-deque!)
      (if (not (empty-deque?))
        (begin (set! rear-ptr (cdar rear-ptr))
               (if (null? rear-ptr)
                 (set! front-ptr '())
                 (set-cdr! rear-ptr '())))))

    (define (print-deque)
      (define (iter current end)
        (if (eq? current end)
          (map display (list (caar current) "\n"))
          (begin (map display (list (caar current) " "))
                 (iter (cdr current) end))))

      (if (empty-deque?)
        (display "nil\n")
        (iter front-ptr rear-ptr)))

    (define (dispatch m)
      (cond ((eq? m 'empty-deque?) empty-deque?)
            ((eq? m 'front-deque) front-deque)
            ((eq? m 'front-insert-deque!) front-insert-deque!)
            ((eq? m 'front-delete-deque!) front-delete-deque!)
            ((eq? m 'rear-insert-deque!) rear-insert-deque!)
            ((eq? m 'rear-delete-deque!) rear-delete-deque!)
            ((eq? m 'print-deque) print-deque)))

    dispatch))

; ------------------------------------------------------------------

(define q (make-deque))
((q 'rear-insert-deque!) 'x)
((q 'print-deque))
((q 'front-insert-deque!) 'y)
((q 'print-deque))
((q 'front-delete-deque!))
((q 'print-deque))
((q 'rear-delete-deque!))
((q 'print-deque))
