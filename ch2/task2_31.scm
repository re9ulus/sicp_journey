(define (tree-map func node)
  (map (lambda (child)
         (if (pair? child)
             (tree-map func child)
             (func child)))
       node))

(define (square-tree tree) (tree-map square tree))

; -- Test
(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
