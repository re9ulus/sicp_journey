; Continued fraction, tan

(define (cont-frac-tan n d k)
  (define (inc a) (+ a 1))
  (define (inner idx)
    (if (= idx k)
        (/ (n idx) (d idx))
        (/ (n idx) (- (d idx) (inner (inc idx))))))
  (inner 1))

(define (tan-cf x k)
  (define (n idx)
    (if (= idx 1)
        x
        (* x x)))
  (define (d idx)
    (+ (* 2 (- idx 1)) 1))
  (cont-frac-tan n d k))


; Test
(define (near? a b)
  (< (abs (- a b)) 0.0001))

(near? (tan-cf 0.6 10) 0.6841)
