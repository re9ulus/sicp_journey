; Segment structure

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ";")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2.)
              (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2.)))

; Tests
(define s1 (make-segment (make-point 0 0)
                         (make-point 5 (- 5))))
(print-point (midpoint-segment s1))
