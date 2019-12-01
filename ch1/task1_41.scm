; Apply twice
(define (double func)
  (lambda (x) (func (func x))))

; -- Test
(define (inc a)
  (+ a 1))

(and 
  (= ((double inc) 1) 3)
  (= (((double (double double)) inc) 5) 21)
)
