; Continued fraction to compute e - 2
(define (cont-frac-iter n d k)
  (define (dec a) (- a 1))
  (define (inner idx result)
    (if (= idx 0)
        result
        (inner (dec idx)
               (/ (n idx) (+ (d idx) result)))))
  (inner (dec k) (/ (n k) (d k))))

(define (eps-frac k) 
  (define (n x) 1.0)
  (define (d x)
    (let ((val (- x 5)))
      (cond ((= x 2) 2)
            ((and (>= val 0) (= (remainder val 3) 0))
             (- x (+ (/ val 3) 1)))
            (else 1))))
  (cont-frac-iter n d k))


; test
(define (near a b)
  (< (abs (- a b)) 0.0001))

(near (eps-frac 100) 0.71828)
