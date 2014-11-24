(load "2.3.4-huffman-encoding-trees.scm")

(define (successive-merge l)
  (if (null? l)
    '()
    (if (null? (cdr l))
      (car l)
      (successive-merge (adjoin-set (make-code-tree (car l) (cadr l))
                                    (cddr l))))))

; -------------------------------------------------------

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define sample-list '((a 4) (b 2) (c 1) (d 1)))

(generate-huffman-tree sample-list)
