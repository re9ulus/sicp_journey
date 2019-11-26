; Continued fraction

; recursive
(define (cont-frac n d k)
  (define (inc a) (+ a 1))
  (define (inner idx)
    (if (= idx k)
        (/ (n idx) (d idx))
        (/ (n idx) (+ (d idx) (inner (inc idx))))))
  (inner 1))

; iterative
(define (cont-frac-iter n d k)
  (define (dec a) (- a 1))
  (define (inner idx result)
    (if (= idx 0)
        result
        (inner (dec idx)
               (/ (n idx) (+ (d idx) result)))))
  (inner (dec k) (/ (n k) (d k))))


; Tests
(define (near a b)
  (< (abs (- a b)) 0.0001))

(and (near (cont-frac (lambda (x) 1.0)
                      (lambda (x) 1.0)
                      100)
           0.618)
     (near (cont-frac-iter (lambda (x) 1.0)
                           (lambda (x) 1.0)
                           100)
           0.618)
     )
