(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(define (square-list-v2 items)
  (map (lambda (x) (* x x)) items))

; -- test
(square-list (list 1 2 3 4 5))
(square-list-v2 (list 1 2 3 4 5))
