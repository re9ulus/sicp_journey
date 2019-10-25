(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (f-rec (- n 2))
         (f-rec (- n 3)))))

(define (f-iter n)
  (define (inner-f-iter n a1 a2 a3)
    (if (= n 0)
        a1
        (inner-f-iter (- n 1)
                      (+ a1 a2 a3)
                      a1
                      a2)))
  (if (< n 3)
      n
      (inner-f-iter (- n 2) 2 1 0)))


(and (= (f-iter 3) 3)
     (= (f-iter 4) 6)
     (= (f-iter 5) 11))


(and (= (f-rec 3) 3)
     (= (f-rec 4) 6)
     (= (f-rec 5) 11))
