(define (goode-enougth? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess prev-guess x)
  (if (goode-enougth? guess prev-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))


(define (near a b)
  (< (abs (- a b)) 0.001))


(and (near (sqrt 9) 3)
     (near (sqrt 4) 2)
     (near (sqrt 2) 1.41421))
