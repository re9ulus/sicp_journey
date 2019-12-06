; reverse
(define (reverse lst)
  (let ((head (list (car lst)))
        (tail (cdr lst)))
    (if (null? tail)
        head
        (append (reverse tail) head))))

; -- test
(reverse (list 1 2 3 4))
