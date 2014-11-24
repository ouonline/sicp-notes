(rule (grandson ?G ?S)
      (and (son ?f ?S) (son ?G ?f)))

(rule (son ?M ?S)
      (and (wife ?W ?M)
           (son ?S ?W)))
