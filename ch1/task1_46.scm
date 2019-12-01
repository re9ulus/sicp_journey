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

; sqrt redefinition with iterative-improve
(define (new-sqrt val)
  
  (define (average a b)
    (/ (+ a b) 2.))

  (define (ok? guess)
    (near? (square guess) val))

  (define (improve guess)
    (average guess (/ val guess)))

  (let ((init-guess 2.0))
    ((iterative-improve ok? improve) init-guess)))

; fixed-point redefinition with iterative-improve
(define (new-fixed-point f init-guess)
  
  ; ok == near
  (define (ok? guess)
    (near? guess (f guess)))

  (define (improve guess)
    (f guess))

  ((iterative-improve ok? improve) init-guess))


; Test
(and 
  (near? (new-sqrt 9) 3)
  (near? (new-sqrt 2) 1.41421)
  (near? (new-fixed-point cos 1.0) 0.739089)
  (near? (new-fixed-point sin 1.0) 0.391432)
  )

