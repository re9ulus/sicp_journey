(define eps 0.00001)

(define (fixed-point f first-guess)
  (define (near? v1 v2)
    (< (abs (- v1 v2)) eps))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (near? guess next)
          next
          (try next))))
  (try first-guess))


; just fixed-point
; 35+ iterations
(fixed-point
  (lambda (x) (/ (log 1000) (log x)))
  2)

; average dumping fixed point
; 8 iterations
(fixed-point
  (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2.0))
  2)

; fixed point with average dump is faster > 3 times
