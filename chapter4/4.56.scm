(and (supervisor ?x (Bitdiddle Ben))
     (address ?x . ?y))

(and (salary (Bitdiddle Ben) ?Ben-salary)
     (salary ?person ?amount)
     (list-value < ?amount ?Ben-salary))

(and (not (job ?person (computer . ?y)))
     (supervisor ?person ?x))
