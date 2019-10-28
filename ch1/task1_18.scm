(define (* a b)
  (define (double val)
    (+ val val))
  (define (halve val)
    (/ val 2))

  (define (inner a b buffer)
    (cond ((= b 0) 0)
          ((= b 1) (+ a buffer))
          ((even? b) (inner (double a) (halve b) buffer))
          (else (inner a (- b 1) (+ buffer a)))))
  
  (inner a b 0))


(and (= (* 2 3) 6)
     (= (* 10 4) 40)
     (= (* 5 5) 25)
     (= (* 1 7) 7)
     (= (* 0 1) 0)
     (= (* 1 0) 0))

(* 2 3)
