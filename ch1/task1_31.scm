; Product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (define (id x) x)
  (define (inc x) (+ x 1))
  (if (= n 0)
      1
      (product id 1 inc n)))


; Test
(= (factorial 5) 120)
