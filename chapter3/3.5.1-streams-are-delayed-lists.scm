(define-syntax cons-stream
  (syntax-rules ()
                ((_ x y) (cons x (delay y)))))
(define (stream-cdr s) (force (cdr s)))

(define (stream-null? s) (null? s))
(define (stream-car s) (car s))

(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(define the-empty-stream '())

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(define (stream-map proc s)
  (if (stream-null? s)
    the-empty-stream
    (cons-stream (proc (stream-car s))
                 (stream-map proc (stream-cdr s)))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter
                        pred
                        (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin (proc (stream-car s))
           (stream-for-each proc (stream-cdr s)))))

(define (display-line x) (display x) (newline))

(define (display-stream s)
  (stream-for-each display-line s))

(define (stream-list stream n)
  (define (recur s remain)
    (if (= remain 0)
      (list)
      (append (list (stream-car s))
              (recur (stream-cdr s) (- remain 1)))))

  (recur stream n))

(define (display-stream-n stream n)
  (map display-line (stream-list stream n))
  (display "\n"))
