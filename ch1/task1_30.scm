; Incremental sum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
    (iter a 0))

; Test
(define (id x) x)

(define (inc x) (+ x 1))

(= (sum id 0 inc 10) 55)
