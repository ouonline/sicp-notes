(load "4.40.scm")

(define (betty-and-kitty? betty kitty)
  (and (not (= betty kitty))
       (if (= kitty 2)
         (not (= betty 3))
         (= betty 3))))

(define (ethel-and-joan? ethel joan)
  (and (not (= ethel joan))
       (if (= ethel 1)
         (not (= joan 2))
         (= joan 2))))

(define (joan-and-ethel? joan ethel)
  (and (not (= joan ethel))
       (if (= joan 3)
         (not (= ethel 5))
         (= ethel 5))))

(define (kitty-and-marry? kitty marry)
  (and (not (= kitty marry))
       (if (= kitty 2)
         (not (= marry 4))
         (= marry 4))))

(define (marry-and-betty? marry betty)
  (and (not (= marry betty))
       (if (= marry 4)
         (not (= betty 1))
              (= betty 1))))

(define (liars)
  (define result-set (list 1 2 3 4 5))
  (map (lambda (betty)
         (map (lambda (kitty)
                (if (betty-and-kitty? betty kitty)
                  (map (lambda (marry)
                         (if (and (marry-and-betty? marry betty)
                                  (kitty-and-marry? kitty marry))
                           (map (lambda (ethel)
                                  (map (lambda (joan)
                                         (if (and (distinct? (list betty kitty marry ethel joan))
                                                  (joan-and-ethel? joan ethel)
                                                  (ethel-and-joan? ethel joan))
                                           (map display (list
                                                          "betty = " betty
                                                          ", ethel = " ethel
                                                          ", joan = " joan
                                                          ", kitty = " kitty
                                                          ", marry = " marry "\n"))))
                                       result-set))
                                result-set)))
                       result-set)))
              result-set))
       result-set))

(liars)
