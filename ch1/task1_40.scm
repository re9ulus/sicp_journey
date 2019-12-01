; Define cubic function for newtons-method

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enougth? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enougth? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.000001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))

; -- Test
(define (near a b)
  (< (abs (- a b)) tolerance))
(near (newtons-method (cubic 1 2 3) 40) (- 1.27568))
