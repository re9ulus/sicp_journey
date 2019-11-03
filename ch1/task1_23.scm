(define (prime? n)
  (define (iter-prime n c)
    (define (next c)
      (if (= c 2)
          3
          (+ c 2)))
    (cond ((> (* c c) n) true)
          ((= (remainder n c) 0) false)
          (else (iter-prime n (next c)))))
  (iter-prime n 2))
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
