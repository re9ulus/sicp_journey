; Sqrt-n using fixed-point

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enougth? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enougth? guess next)
          next
          (try next))))
  (try first-guess))

(define delta 0.00001)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average a b)
  (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

; If we are looking for root a**{-N}
; Fixed-damp must be applyer more than sqrt(N) times
(define (sqrt-n n)
  (define (pow a n)
    (if (= n 0)
        1
        (* a (pow a (- n 1)))))
  
  (define (sqrt-int n)
    (define (>= a b)
      (or (> a b) (= a b)))
    (define (inner i)
      (if (>= (* i i) n)
          i
          (inner (+ i 1))))
    (inner 1))

  (let ((val (sqrt-int n))
        (guess 1.5))
    (lambda (a)
      (fixed-point
        ((repeated average-damp val)
         (lambda (x)
           (/ a (pow x (- n 1))))) guess))))

; Tests
(define (near a b)
  (let ((eps 0.00001))
    (< (abs (- a b)) eps)))

(and
  (near ((sqrt-n 4) 81) 3)
  (near ((sqrt-n 10) 1024) 2)
  (near ((sqrt-n 20) 1048576) 2)
  (near ((sqrt-n 2) 2) 1.414213))
