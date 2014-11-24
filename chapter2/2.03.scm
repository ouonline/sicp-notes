(load "2.02.scm")

(define (make-rect top-left bottom-right)
  (cons top-left bottom-right))

(define (top-left-rect r) (car r))
(define (bottom-right-rect r) (cdr r))

(define (x-distance left-point right-point)
  (- (x-point right-point) (x-point left-point)))

(define (y-distance top-point bottom-point)
  (- (y-point bottom-point) (y-point top-point)))

(define (perimeter-rect r)
  (* (+ (x-distance (top-left-rect r) (bottom-right-rect r))
        (y-distance (top-left-rect r) (bottom-right-rect r)))
     2))

(define (area-rect r)
  (* (x-distance (top-left-rect r) (bottom-right-rect r))
     (y-distance (top-left-rect r) (bottom-right-rect r))))

; -------------------------------------------------

(perimeter-rect (make-rect (make-point 1 3)
                           (make-point 3 4)))

(area-rect (make-rect (make-point 1 2)
                      (make-point 3 4)))
