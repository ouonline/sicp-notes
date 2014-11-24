(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (empty-queue?)
      (null? front-ptr))

    (define (front-queue)
      (if (empty-queue?)
        '()
        (car front-ptr)))

    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair))
              (else
                (set-cdr! rear-ptr new-pair)
                (set! rear-ptr new-pair)))))

    (define (delete-queue!)
      (if (not (empty-queue?))
        (set! front-ptr (cdr front-ptr))))

    (define (print-queue)
      (define (iter current end)
        (if (eq? current end)
          (map display (list (car current) "\n"))
          (begin (map display (list (car current) " "))
                 (iter (cdr current) end))))

      (if (empty-queue?)
        (display "nil\n")
        (iter front-ptr rear-ptr)))

    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) empty-queue?)
            ((eq? m 'front-queue) front-queue)
            ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            ((eq? m 'print-queue) print-queue)))

    dispatch))

; -------------------------------------------------------

(define q (make-queue))
((q 'insert-queue!) 'x)
((q 'insert-queue!) 'y)
((q 'print-queue))
((q 'delete-queue!))
((q 'print-queue))
