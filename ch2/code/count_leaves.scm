(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

; -- test
(define tree (cons (cons 1 2) (cons 3 4)))
(count-leaves tree)
