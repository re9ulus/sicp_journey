; Rectangle structure

; -- Point
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ";")
  (display (y-point p))
  (display ")"))
; -- End Point

; -- RectangleV1
(define (make-rectangle top-left bot-right)
  (cons top-left bot-right))

(define (get-rect-top-left r)
  (car r))

(define (get-rect-bot-right r)
  (cdr r))

(define (rect-width r)
  (- (x-point (get-rect-bot-right r))
     (x-point (get-rect-top-left r))))

(define (rect-height r)
  (- (y-point (get-rect-top-left r))
     (y-point (get-rect-bot-right r))))

(define (rect-perimeter r)
  (* 2 (+ (rect-width r)
          (rect-height r))))

(define (rect-area r)
  (* (rect-width r)
     (rect-height r)))
; -- End RectangleV1

; -- RectangleV2
(define (make-rectangle-2 top-left width height)
  (lambda (x)
    (cond ((= x 0) top-left)
          ((= x 1) width)
          ((= x 2) h))))

; This rect-width-2 and rect-height-2 can be used instead of
; rect-width/height in area/perimeter computation
(define (rect-width-2 r)
  (r 1))

(define (rect-height-2 r)
  (r 2))
; -- End RectangleV2


; Tests
(define rect (make-rectangle (make-point 0 3)
                             (make-point 4 0)))
(rect-perimeter rect)
(rect-area rect)

; Test 
(define rect2 (make-rectangle-2 (make-point 0 3) 4 3))
(rect-width-2 rect2)
