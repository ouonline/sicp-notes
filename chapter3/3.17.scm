;           +--------------+----------------+-----+
; visited   |   element1   |    element2    | ... |
;           +--------------+----------------+-----+
;                  |                |
;            +-----------+    +-----------+
;            | car | cdr |    | car | cdr |
;            +-----------+    +-----------+

(define (count-pairs x)
  (define visited (list))

  (define (exist? e)
    (define (recur rest)
      (if (null? rest)
        #f
        (if (eq? e (car rest))
          #t
          (recur (cdr rest)))))

    (recur visited))

  (define (helper l)
    (if (not (pair? l))
      0
      (if (exist? l)
        (+ (helper (car l))
           (helper (cdr l)))
        (begin
          (set! visited (cons l visited))
          (+ (helper (car l))
             (helper (cdr l))
             1)))))

  (helper x))

; ----------------------------------------------------

(define x (cons 'a 'b))
(define y (cons x x))
(define z (cons y y))
(count-pairs z)
