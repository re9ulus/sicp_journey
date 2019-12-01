; Iterative improve
(define tolerance 0.00001)

(define (iterative-improve ok? improve)

  (define (inner guess)
    (if (ok? guess)
        guess
        (inner (improve guess))))

  (lambda (init-guess)
    (inner init-guess)))

(define (near? a b)
  (< (abs (- a b)) tolerance))

; sqrt redefinition
(define (new-sqrt val)

  
  (define (average a b)
    (/ (+ a b) 2.))

  (define (ok? guess)
    (near? (square guess) val))

  (define (improve guess)
    (average guess (/ val guess)))

  (let ((init-guess 2.0))
    ((iterative-improve ok? improve) init-guess)))


; Test
(and 
  (near? (new-sqrt 9) 3)
  (near? (new-sqrt 2) 1.41421)
  )
