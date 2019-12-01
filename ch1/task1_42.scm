; Compose
(define (compose f g)
  (lambda (x) (f (g x))))

; Test
(define (inc a)
  (+ a 1))

(define (square a)
  (* a a))

(= ((compose square inc) 6) 49)
