; mobile
(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))
; end mobile

; branch
(define (make-branch length structure)
  (list length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))
; end branch

; total-weight
(define (total-weight item)
  (define (mobil? item)
    (and (pair? item) (pair? (car item)) (pair? (cdr item))))
  (cond
    ((null? item) 0)
    ((mobil? item)
     (+ (total-weight (left-branch item))
        (total-weight (right-branch item))))
    (else (let ((next (branch-structure item)))
            (if (mobil? next)
                (total-weight next)
                (car next))))))

(define (is-ballanced item)
  (define (mobil? item)
    (and (pair? item) (pair? (car item)) (pair? (cdr item))))
  (define (branch-weight branch)
     (* (branch-length branch)
        (total-weight branch)))
  (if (mobil? item)
      (let (
            (left-weight (branch-weight (left-branch item)))
            (right-weight (branch-weight (right-branch item))))
        (and (= left-weight right-weight)
                (is-ballanced (left-branch item))
                (is-ballanced (right-branch item))))
      (let ((next (branch-structure item)))
        (if (mobil? next)
            (is-ballanced next)
            true))))
;

; -- Tests
(define mob (make-mobile
              (make-branch 2 5)
              (make-branch 5 7)))
(define mob-ballanced (make-mobile
              (make-branch 2 5)
              (make-branch 5 2)))

(total-weight mob)

(is-ballanced mob)

(is-ballanced mob-ballanced)
