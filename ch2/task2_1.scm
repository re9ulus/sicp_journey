; Rational number, support negative numbers
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


(define (make-rat n d)
  (let ((abs-n (abs n))
        (abs-d (abs d))
        (sign (if (> 0 (* n d)) (- 1) 1)))
    (let ((g (gcd abs-n abs-d)))
     (cons (* sign (/ abs-n g))
           (/ abs-d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Tests
(define neg-one-half (make-rat (- 1) 2))
(print-rat neg-one-half)
(print-rat (mul-rat neg-one-half neg-one-half))

(print-rat (make-rat 1 (- 2)))

(print-rat (make-rat (- 1) (- 2)))
