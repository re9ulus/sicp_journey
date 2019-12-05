; Pair implementation through 2**a * 3**b
(define car-base 2)
(define cdr-base 3)

(define (cons a b)
  (* (expt car-base a) (expt cdr-base b)))

(define (split-base val base)
  (define (inner x acc)
    (if (not (= (remainder x base) 0))
        acc
        (inner (/ x base) (+ acc 1))))
  (inner val 0))

(define (car p)
  (split-base p car-base))

(define (cdr p)
  (split-base p cdr-base))

; -- Tests
(define (print-pair p)
  (newline)
  (display "(")
  (display (car p))
  (display ";")
  (display (cdr p))
  (display ")"))

(define my-pair (cons 4 5))
(print-pair my-pair)

(define another-pair (cons 5 4))
(print-pair another-pair)

(define pair-with-zero (cons 0 9))
(print-pair pair-with-zero)
