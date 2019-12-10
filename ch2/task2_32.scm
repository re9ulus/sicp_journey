; Generate subsets
(define (subsets s)
  (define (id x) x)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map
                       (lambda (x) (append (list (car s)) x)) 
                       rest)))))

; --
(subsets (list 1 2 3))
