(define (div-terms L1 L2)
  (if (empty-termlist? L1)
    (list (the-empty-termlist) (the-empty-termlist))
    (let ((t1 (first-term L1))
          (t2 (first-term L2)))
      (if (> (order t2) (order t1))
        (list (the-empty-termlist) L1)
        (let ((new-c (div (coeff t1) (coeff t2)))
              (new-o (- (order t1) (order t2))))
          (let ((rest-of-result
                  ;<compute rest of result recursively>
                  (div ; 递归求余数除以除数的结果
                    (sub L1 ; 被除数减去(除数和商相乘的结果)得到的余数
                         (mul L2 ; 除数和商相乘
                              (make-term new-o new-c))) ; 最高次数项的试商结果
                    L2)
                  ))
            ;<form complete result>
            (list (add ; 商相加
                    (make-term new-o new-c) ; 最高次数的商
                    (car rest-of-result)) ; 余数除以除数的商(由递归求得)
                  (cadr (rest-of-result))) ; 最后的余数
            ))))))

(define (div-poly P1 P2)
  (let ((result-terms (div-terms (term-list P1) (term-list P2))))
    (list (make-poly (variable P1) (car result-terms))
          (make-poly (variable P1) (cadr result-terms)))))
