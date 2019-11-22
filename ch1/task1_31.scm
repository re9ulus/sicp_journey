; Product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

; Iterative product
(define (fast-product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

; Helpers
(define (inc x) (+ x 1))
(define (id x) x)

; Factorial
(define (factorial n)
  (if (= n 0)
      1
      (product id 1 inc n)))

; Pi-approcsimation
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

  (fast-product term 1 inc n))


; Test
(define (near a b eps)
  (< (abs (- a b)) eps))

(and
  (= (product id 1 inc 5) 120)
  (= (fast-product id 1 inc 5) 120)
  (= (factorial 5) 120)
  (near (* 4 (pi 1000)) 3.1415 0.01)
  )

