(define f
  (let ((called 0))
    (lambda (v)
      (if (= v 0)
        (if (= called 0)
          (begin (set! called 1)
                 0)
          1)
        (if (= called 0)
          (begin (set! called 1)
                 1)
          0)))))

; ---------------------------------

(+ (f 0) (f 1))
