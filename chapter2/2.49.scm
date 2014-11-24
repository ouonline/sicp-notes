(define origin (make-vect 0 0))
(define top-left (make-vect 0 1))
(define top-right (make-vect 1 1))
(define bottom-right (make-vect 1 0))

; ---------------------------------------------------------------

(define outlint-segment-list (list (make-segment origin top-left)
                                   (make-segment top-left top-right)
                                   (make-segment top-right bottom-right)
                                   (make-segment bottom-right origin)))

(define (outline frame)
  ((segment->painter outlint-segment-list) frame))

; ---------------------------------------------------------------

(define opposite-segment-list (list (make-segment origin top-right)
                                    (make-segment top-left bottom-right)))

(define (opposite frame)
  ((segment->painter opposite-segment-list) frame))

; ---------------------------------------------------------------

(define diamond-segment-list (list (make-segment origin (make-vect 0 0.5))
                                   (make-segment top-left (make-vect 0.5 1))
                                   (make-segment (make-vect 1 0.5) bottom-right)
                                   (make-segment (make-vect 0.5 0) origin)))

(define (diamond frame)
  ((segment->painter diamond-segment-list) frame))
