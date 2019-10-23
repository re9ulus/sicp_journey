(define (is-near a b)
  (< (abs (- a b)) 0.001))

(define (good-enougth? guess prev-guess)
  (is-near guess prev-guess))

(define (sq a)
  (* a a))

(define (improve guess x)
  (/ (+ (/ x (sq guess)) (* 2 guess)) 3))

(define (sqrt3-iter guess prev-guess x)
  (if (good-enougth? guess prev-guess)
      guess
      (sqrt3-iter (improve guess x)
                  guess
                  x)))

(define (sqrt3 x)
  (sqrt3-iter 1.0 0.0 x))


(and (is-near (sqrt3 27) 3)
     (is-near (sqrt3 1000) 10))
