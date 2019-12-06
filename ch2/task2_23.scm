(define (for-each func items)
  (if (null? items)
      true
      (let ((item (car items)))
        (func item)
        (for-each func (cdr items)))))

; -- Test
(for-each (lambda (x) (newline) (display x))
          (list 1 2 3 4 5))
