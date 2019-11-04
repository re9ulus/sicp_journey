; Miller-Rabin test
; condition: (a ** (n - 1)) % n == 1
; untrevial root: x != 1 and x != n-1 such thath x**2 % n == 1


(define (even? v)
  (= (remainder v 2) 0))

(define (untrevial-root? v n)
  (cond ((or (= v 1) (= v (- n 1))) false)
        ((not (= (remainder (* v v) n) 1)) false)
        (else true)))

(define (modpow-mr-test base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (if (untrevial-root? (modpow-mr-test base (/ exp 2) m) m)
             0
             (remainder
               (square (modpow-mr-test base (/ exp 2) m)) m)))
        (else
          (remainder (* base (modpow-mr-test base (- exp 1) m))
                     m))))

(define (prime? n)
  (define (iter-check n times)
    (cond ((= times 0) true)
          ((= (modpow-mr-test (+ 1 (random (- n 1))) (- n 1) n) 1)
           (iter-check n (- times 1)))
          (else false)))
  (iter-check n 10))


; tests
(and (prime? 7)
     (not (prime? 100))
     (not (prime? 49))
     (prime? 73)
     (prime? 199)
     (not (prime? 1337)))
