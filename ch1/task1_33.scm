; Accumulate general function with filter
(define (accumulate combiner null-value term a next b filter)
  (define (use? x)
    (if (filter x)
        (term x)
        null-value))
  (if (> a b)
      null-value
      (combiner (use? a)
                (accumulate combiner null-value term (next a) next b filter))))

; Iterative
(define (accumulate-iter combiner null-value term a next b filter)
  (define (use? x)
    (if (filter x)
        (term x)
        null-value))
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (use? a) result))))
  (iter a null-value))

; Helpers
(define (add a b) (+ a b))
(define (inc x) (+ x 1))
(define (id x) x)
(define (sq x) (* x x))

(define (sum-of-squared-primes a b)
  (define (prime? n)
    (define (iter x n)
      (cond ((> (sq x) n) true)
            ((= (remainder n x) 0) false)
            (else (iter (inc x) n))))
    (iter 2 n))

  (accumulate add 0 sq a inc b prime?))

(define (sum-of-relatively-prime n)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  (define (relatively-prime? a)
    (= (gcd a n) 1))

  (accumulate-iter add 0 id 1 inc n relatively-prime?))

; Test
(and
  (= (sum-of-squared-primes 1 10) 88)
  (= (sum-of-relatively-prime 10) 20)
)

