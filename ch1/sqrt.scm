(define (goode-enougth? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (goode-enougth? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


(define (near a b)
  (< (abs (- a b)) 0.001))

(and (near (sqrt 9) 3)
     (near (sqrt 4) 2)
     (near (sqrt 2) 1.41421))
