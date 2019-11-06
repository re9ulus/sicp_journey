(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (define (cube n)
    (* n n n))
  (sum cube a inc b))

(define (sum-integers a b)
  (define (id n)
    n)
  (sum id a inc b))

(define (pi-sum a b)
  (define (pi-term v)
    (/ 1.0 (* v (+ v 2))))
  (define (pi-next v)
    (+ v 4))
  (sum pi-term a pi-next b))

; test
(= (sum-cubes 1 10) 3025)
(= (sum-integers 1 10) 55)
(pi-sum 1 1000)
