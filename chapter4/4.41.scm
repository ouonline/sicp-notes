(load "4.40.scm")

(define (multiple-dwelling)
  (define result-set (list 1 2 3 4 5))

  (map (lambda (baker)
         (if (not (= baker 5))
           (map (lambda (cooper)
                  (if (not (= cooper 1))
                    (map (lambda (fletcher)
                           (if (and (not (= fletcher 1))
                                    (not (= fletcher 5)))
                             (map (lambda (miller)
                                    (if (> miller cooper)
                                      (map (lambda (smith)
                                             (if (and (distinct? (list baker cooper fletcher miller smith))
                                                      (not (= (abs (- smith fletcher)) 1))
                                                      (not (= (abs (- fletcher cooper)) 1)))
                                               (map display (list "\n"
                                                                  "baker = " baker
                                                                  ", cooper = " cooper
                                                                  ", fletcher = " fletcher
                                                                  ", miller = " miller
                                                                  ", smith = " smith "\n"))))
                                           result-set)))
                                  result-set)))
                         result-set)))
                result-set)))
       result-set))

(multiple-dwelling)
