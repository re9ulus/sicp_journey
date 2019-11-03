(define (prime? n)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))
  (define (ferma-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
  (define (fast-prime? n times)
    (cond ((= times 0) true)
          ((ferma-test n) (fast-prime? n (- times 1)))
          (else false)))
  (fast-prime? n 5))
;---
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))
;---
(define (search-for-primes from to)
  (cond ((> from to) (display "done"))
        ((= (remainder from 2) 0)
         (search-for-primes (+ from 1) to))
        (else
          (timed-prime-test from)
          (search-for-primes (+ from 2) to))))
;---

(search-for-primes 1000 1020)
(search-for-primes 10000 10040)
(search-for-primes 100000 100050)
