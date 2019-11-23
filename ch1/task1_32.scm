; Accumulate general function
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b
                            ))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (define (add a b) (+ a b))
  (accumulate add 0 term a next b))

(define (prod term a next b)
  (define (mul a b) (* a b))
  (accumulate mul 1 term a next b))

(define (sum-iter term a next b)
  (define (add a b) (+ a b))
  (accumulate-iter add 0 term a next b))

(define (prod-iter term a next b)
  (define (mul a b) (* a b))
  (accumulate-iter mul 1 term a next b))


; Tests
(define (inc x) (+ x 1))
(define (id x) x)

(and
  (= (sum id 0 inc 10) 55)
  (= (prod id 1 inc 5) 120)
  (= (sum-iter id 0 inc 10) 55)
  (= (prod-iter id 1 inc 5) 120)
  )
