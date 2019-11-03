;; Check Carmichael numbers

(define (>= a b)
  (or (> a b) (= a b)))

(define (modpow base exp m)
  (cond ((= exp 0) 1)
        ((= (remainder exp 2) 0)
         (remainder
           (square (modpow base (/ exp 2) m))
            m))
        (else
          (remainder
            (* base (modpow base (- exp 1) m))
            m))))

(define (check-carmichael n)
  (define (check a n)
    (= (modpow a n n) a))

  (define (iter-check step n)
    (cond ((>= step n) true)
          ((check step n) (iter-check (+ step 1) n))
          (else false)))

  (iter-check 1 n))


;; test
(and
    (check-carmichael 561)
    (check-carmichael 1105)
    (check-carmichael 1729)
    (check-carmichael 2821)
    (check-carmichael 6601)
    
    (not (check-carmichael 4)))
