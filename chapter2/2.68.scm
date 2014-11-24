(load "2.3.4-huffman-encoding-trees.scm")

(define (encode-symbol s tree)
  (define (valid? x branch)
    (memq x (symbols branch)))

  (define (encode-1 s current-branch)
    (if (leaf? current-branch)
      '()
      (if (valid? s (left-branch current-branch))
        (append (list 0) (encode-1 s (left-branch current-branch)))
        (append (list 1) (encode-1 s (right-branch current-branch))))))

  (if (valid? s tree)
    (encode-1 s tree)
    (error "bad character ->" s)))

; ---------------------------------------------------------------

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))

(encode '(A D A B B C A) sample-tree)
