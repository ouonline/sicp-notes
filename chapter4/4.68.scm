(rule (reverse () ()))

(rule (reverse ?req ?res)
      (reverse (lisp-value cdr ?req) ?res1)
      (reverse (lisp-value car ?req) ?res2)
      (append-to-form ?res1 ?res2 ?res))
