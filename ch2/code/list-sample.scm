(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

; tests
(define squares (list 1 4 9 16 25))
(list-ref squares 3)
(length squares)
(append (list 1 2 3) (list 4 5 6))
