(define (pascal row col)
    (define (pascal-rec row col)
      (cond ((or (< col 0) (< row 0) (> col row)) 0)
            ((or (= col 0) (= row col)) 1)
            (else (+ (pascal-rec (- row 1) (- col 1))
                     (pascal-rec (- row 1) col)))))
    
    (pascal-rec row col))


(and (= (pascal 0 0) 1)
     (= (pascal 2 1) 2)
     (= (pascal 3 1) 3)
     (= (pascal 4 1) 4)
     (= (pascal 4 2) 6)
     (= (pascal 4 3) 4))

