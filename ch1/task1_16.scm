(define (fast-pow b n)

  (define (even? b)
    (= (remainder b 2) 0))

  (define (inner-pow buffer b n)
    (cond ((= n 0) buffer)
          ((even? n) (inner-pow buffer (* b b) (/ n 2)))
          (else (inner-pow (* buffer b) b (- n 1)))))

  (inner-pow 1 b n))


(and (= (fast-pow 2 6) 64)
     (= (fast-pow 2 5) 32)
     (= (fast-pow 2 10) 1024)
     (= (fast-pow 2 11) 2048))
