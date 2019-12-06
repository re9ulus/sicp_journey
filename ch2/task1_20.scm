(define (same-parity val . other)

  (let ((target (remainder val 2)))

    (define (accept? x)
      (= (remainder x 2) target))

    (define (inner lst)
      (if (null? lst)
          (list)
          (let ((head (car lst))
                (tail (cdr lst)))
            (if (accept? head)
                (append (list head) (inner tail))
                (inner tail)))))

    (inner other)))

; Test
(same-parity 2 1 2 3 4 5 6)
(same-parity 3 1 2 3 4 5 6)
