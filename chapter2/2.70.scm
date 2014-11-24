(load "2.68.scm")
(load "2.69.scm")

(define pairs '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1)))

(define ptree (generate-huffman-tree pairs))

(length (encode '(get a job sha na na na na na na na na get a job sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip sha boom) ptree))
