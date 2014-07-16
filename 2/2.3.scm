; Points
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Segments
(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (define (average a b) (/ (+ a b) 2))
  (let ((a (start-segment s))
        (b (end-segment s)))
    (make-point (average (x-point a) (x-point b))
                (average (y-point a) (y-point b)))))

; Rectangle 1
(define (make-rectangle bottom-left top-right)
  (cons bottom-left top-right))

(define (bottom-left r)
  (car r))

(define (top-right r)
  (cdr r))

(define (height-rect r)
  (- (y-point (top-right r))
     (y-point (bottom-left r))))

(define (width-rect r)
  (- (x-point (top-right r))
     (x-point (bottom-left r))))

(define (area-rect r)
  (* (height-rect r)
     (width-rect r)))

(define (perimeter-rect r)
  (* (+ (height-rect r)
        (width-rect r))
     2))

