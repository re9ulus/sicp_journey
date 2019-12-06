; last-pair
(define (last-pair lst)
  (let ((tail (cdr lst)))
    (if (null? tail)
        (car lst)
        (last-pair tail))))

; -- test
(and
  (= (last-pair (list 1 2 3 4)) 4)
  (= (last-pair (list 1)) 1))
