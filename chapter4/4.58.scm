(rule (big-shot ?person)
      (and (job ?person (?division . ?type))
           (supervisor ?x ?person)
           (not (job ?x (?division . ?x-type)))))
