(define (fib-rec n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-rec (- n 1))
                 (fib-rec (- n 2))))))

(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
          b
          (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))


(fib-rec 6)
(fib 6)
