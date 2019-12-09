(define (square-tree node)
  (cond ((null? node) '())
        ((not (pair? node)) (* node node))
        (else (cons (square-tree (car node))
                    (square-tree (cdr node))))))

(define (square-tree-v2 node)
  (map (lambda (child)
         (if (pair? child)
             (square-tree-v2 child)
             (* child child)))
       node))

; -- Test
(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(square-tree-v2
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
  
