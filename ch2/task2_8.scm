; Interval structure, with sub
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (let ((high (max (lower-bound y) (upper-bound y)))
        (low (min (lower-bound y) (upper-bound y))))
    (make-interval (- (lower-bound x) high)
                   (- (upper-bound x) low))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b)
  (cons a b))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

; Tests
(define i1 (make-interval 3. 5.))
(define i2 (make-interval 1. 2.))

(add-interval i1 i2)
(sub-interval i1 i2)
(mul-interval i1 i2)
(div-interval i1 i2)
