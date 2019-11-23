; Simpson rule
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (simpson func a b n)
  (define (get-h)
    (/ (- b a) n))

  (define (term k)
    (define (mult x)
      (define (even? x)
        (= (remainder x 2) 0))
      (cond ((or (= 0 x) (= n x)) 1)
            ((even? x) 2)
            (else 4)))
    (* (mult k) (func (+ a (* k (get-h))))))

  (define (inc x)
    (+ x 1))

  (/ (* (get-h) (sum term 0 inc n)) 3.0 ))


; Test
(define (cube x) (* x x x))
(define (near a b eps)
  (< (abs (- a b)) eps))

(near (simpson cube 0 1 100) 0.25 0.0001)
