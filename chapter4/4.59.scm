; a.
(meeting ?anybody (Friday ?time))

; b.
(rule (meeting-time ?persion ?day-and-time)
      (and (meeting whole-company ?day-and-time)
           (job ?persion (?division . ?rest))
           (meeting ?division ?day-and-time)))

; c.
(meeting-time Alyssa (Wednesday . ?rest))
