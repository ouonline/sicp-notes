(load "2.41.scm")

(define empty-board (list))

(define (safe? col1 positions)

  (define (safe-pos? row1 row2 col2)
    (cond ((= row1 row2) #f)
          ((= col1 col2) #f)
          ((= (abs (- row1 row2)) (abs (- col1 col2))) #f)
          (else #t)))

  (define (recur row1 row col2)
    (if (null? row)
      #t
      (if (not (safe-pos? row1 (car row) col2))
        #f
        (recur row1 (cdr row) (- col2 1)))))

  (if (null? positions)
    #t
    (recur (car positions) (cdr positions) (length (cdr positions)))))

(define (adjoin-position new-row k rest-of-queens)
  (map display (list "join result -> " (append (list new-row) rest-of-queens) "\n"))
  (append (list new-row) rest-of-queens))

; ----------------------------------------------------------------------------

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter (lambda (positions) (safe? k positions))
              (flatmap (lambda (new-row)
                         (map (lambda (rest-of-queens)
                                (adjoin-position new-row k rest-of-queens))
                              (queen-cols (- k 1))))
                       (enumerate-interval 1 board-size)))))

  (queen-cols board-size))

; ----------------------------------------------------------------------------

(queens 4)
