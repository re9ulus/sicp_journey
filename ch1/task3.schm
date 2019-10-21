(define (max a b)
    (if (> a b)
        a
        b))

(define (min a b)
    (if (< a b)
        a
        b))

(define (sq a) (* a a))

(define (sum-of-top a b c)
    (+ (sq (max a (max b c)))
        (sq (- (+ a b c) (max a (max b c)) (min a (min b c))))))



(define (test-sum-of-top)
    (and (= (sum-of-top 0 1 2) 5)
         (= (sum-of-top 1 2 0) 5)
         (= (sum-of-top 1 0 2) 5)))

(test-sum-of-top)
