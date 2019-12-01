; Smooth
(define delta 0.00001)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth func)
  (lambda (x)
    (/ (+ (func (- x delta))
          (func x)
          (func (+ x delta)))
       3.0)))

(define (n-smooth n)
  (repeated smooth n))

;-- Test
(define (near a b)
  (< (abs (- a b)) delta))

(define (cube a)
  (* a a a))

(near ((smooth cube) 3) 27)

(((n-smooth 1) cube) 3)
(((n-smooth 2) cube) 3)
(((n-smooth 3) cube) 3)
