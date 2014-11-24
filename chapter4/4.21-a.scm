((lambda (n)
   ((lambda (fact) (fact fact n))
    (lambda (ft k)
      (if (= k 1)
        1
        (* k (ft ft (- k 1)))))))
 5)

((lambda (n)
   ((lambda (fact) (fact fact n))
    (lambda (fib k)
      (cond ((= k 0) 0)
            ((= k 1) 1)
            (else (+ (fib fib (- k 2)) (fib fib (- k 1))))))))

 10)
