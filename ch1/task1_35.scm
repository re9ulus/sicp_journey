; Golden ratio using fixed-point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enougth? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enougth? guess next)
          next
          (try next))))
  (try first-guess))

(define (phi)
  (define (f x)
    (+ 1 (/ 1. x)))
  (fixed-point f 1.0))

; Test
(phi)
