(load "3.3.2-representing-queues.scm")

(define (print-queue q)
  (define (iter current end)
    (if (eq? current end)
      (map display (list (car current) "\n"))
      (begin (map display (list (car current) " "))
             (iter (cdr current) end))))

  (if (empty-queue? q)
    (display "nil\n")
    (iter (front-ptr q) (rear-ptr q))))

; -------------------------------------------------------

(define q1 (make-queue))
(insert-queue! q1 'a)
(insert-queue! q1 'b)
(delete-queue! q1)
(delete-queue! q1)
(print-queue q1)
