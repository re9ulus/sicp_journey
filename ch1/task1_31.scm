; Product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (inc x) (+ x 1))

(define (factorial n)
  (define (id x) x)
  (if (= n 0)
      1
      (product id 1 inc n)))

(define (pi n)
  (define (dividend x)
    (define (trim x)
      (if (= (remainder x 2) 0)
          x
          (- x 1)))
    (+ 2 (trim x)))
  (define (divisor x)
    (if (= (remainder x 2) 0)
        (- (dividend x) 1)
        (+ (dividend x) 1)))
  (define (term x)
    (/ (dividend (+ x 0.0))
       (divisor x)))

  (product term 1 inc n))


; Test
(define (near a b eps)
  (< (abs (- a b)) eps))

(and
  (= (factorial 5) 120)
  (near (* 4 (pi 1000)) 3.1415 0.01)
  )
